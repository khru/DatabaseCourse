SHELL=/bin/sh

include .env
MAKEFLAGS += --no-print-directory

# Pick docker-compose v1 or v2 automatically
COMPOSE := $(shell if command -v docker-compose >/dev/null 2>&1; then echo docker-compose; else echo "docker compose"; fi)

# Wait settings
WAIT_TIMEOUT ?= 120   # seconds
WAIT_SLEEP   ?= 1

# Internal helper used by wait-db
MYSQL_PING = docker exec -i ${MYSQL_HOST} mysqladmin ping \
	-u ${MYSQL_USER} -p${MYSQL_PASSWD} -h 127.0.0.1 --silent 2>/dev/null

.PHONY: help install start stop delete mysql-cli shell load-comercial-db \
        wait-db logs ps onboarding clean-data

help:
	@echo ""
	@echo "usage: make COMMAND"
	@echo ""
	@echo "Commands:"
	@echo "  start               🚀 Starts the MySQL container and waits until it is ready"
	@echo "  stop                ✋ Stop the MySQL container"
	@echo "  delete              🗑 Deletes all the MySQL data (stops first)"
	@echo "  onboarding          🧼 Full reset: delete data, start, and wait until ready"
	@echo "  mysql-cli           📡 Open a MySQL client inside the container"
	@echo "  shell               📡 Open a shell inside the container"
	@echo "  load-comercial-db   🔼 Load 'dump/db.sql' into MySQL"
	@echo "  logs                📜 Follow container logs"
	@echo "  ps                  🔎 Show compose services status"

install:
	@echo "✔️ Checking if you have the docker requirements"
	./scripts/docker-compose.sh

start:
	@echo "🚀 Starts the MySQL container"
	${COMPOSE} up -d
	@$(MAKE) --no-print-directory wait-db

stop:
	@echo "✋ Stop the MySQL container"
	${COMPOSE} down

# Safer data removal that works with or without sudo
clean-data:
	@echo "🧹 Removing ./data..."
	@rm -rf ./data 2>/dev/null || { echo "ℹ️ Retrying with sudo"; sudo rm -rf ./data; }

delete: stop clean-data
	@echo "🗑 All MySQL data deleted"

# Wait until mysqladmin ping succeeds or timeout
wait-db:
	@echo "⏳ Waiting for MySQL at ${MYSQL_HOST}:${MYSQL_PORT} (timeout: ${WAIT_TIMEOUT}s)..."
	@i=0; \
	until ${MYSQL_PING}; do \
		i=$$((i+${WAIT_SLEEP})); \
		if [ $$i -ge ${WAIT_TIMEOUT} ]; then \
			echo "❌ MySQL did not become ready within ${WAIT_TIMEOUT} seconds"; \
			exit 1; \
		fi; \
		sleep ${WAIT_SLEEP}; \
	done; \
	echo "✅ MySQL is ready"

mysql-cli:
	@echo "📡 Connecting to MySQL inside 🐳 ${MYSQL_HOST}"
	docker exec -it ${MYSQL_HOST} mysql -u ${MYSQL_USER} -p${MYSQL_PASSWD}

shell:
	@echo "📡 Shell inside 🐳 ${MYSQL_HOST}"
	docker exec -it ${MYSQL_HOST} /bin/bash

load-comercial-db:
	@echo "🔼 Loading dump/db.sql into MySQL on 🐳 ${MYSQL_HOST}"
	docker exec -i ${MYSQL_HOST} mysql -u ${MYSQL_USER} -p${MYSQL_PASSWD} < ${SQL_DUMP}/db.sql

logs:
	${COMPOSE} logs -f

ps:
	${COMPOSE} ps

# Full reset: delete any existing data then start and wait
onboarding:
	@echo "🧼 Running onboarding: full reset and start"
	-$(MAKE) delete
	$(MAKE) start

