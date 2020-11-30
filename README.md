# Como levantar el entorno de desarrollos

## Linux
Ejecutamos en la terminal
```
sudo apt-get update -y && sudo apt-get install -y make
```
## Windows
https://stackoverflow.com/questions/32127524/how-to-install-and-use-make-in-windows

## Instalar git
### Linux
```
sudo apt-get install git
```
### Windows
(https://git-scm.com/download/win)[https://git-scm.com/download/win]
# Create una cuenta de github
(https://github.com/join)[https://github.com/join]
# Create un Fork de este repositorio
[https://aprendegit.com/fork-de-repositorios-para-que-sirve/#:~:text=La%20palabra%20fork%20se%20traduce,como%20un%20repositorio%20git%20cualquiera.](https://aprendegit.com/fork-de-repositorios-para-que-sirve/#:~:text=La%20palabra%20fork%20se%20traduce,como%20un%20repositorio%20git%20cualquiera.)

Un fork es una copia de este repositorio en un repositorio tuyo personal, ya que de lo contrario no podrás subir tus cambios.

# Instalar cliente de BD
https://dbeaver.io/
https://www.mysql.com/products/workbench/
# Tarea de creación de una base de datos:
Primero crearemos una carpeta SQL y dentro de ella crearemos una carpeta llamada DML y otra DDL, coloca los scripts que vamos a hacer con la creación y modificación de la base de datos, en la carpeta de DDL

# Diseño de ER para crear una base de datos
Diseñar un ER que represente el uso de una agenda, donde tendremos:
```
	- Usuario
		- Email
		- Contraseña
		- Fecha de nacimiento
		- DNI
		- created_at
		- updated_at
		- deleted_at
	- Contacto:
		- ninguno o más emails
		- uno o muchos tlf
		- Nombre
		- Apellido1
		- Apellido2
		- Sexo
		- Fecha de nacimiento
        - created_at
		- updated_at
		- deleted_at
```

# Creación de esquema de base de datos
Convertir dicho ER en un esquema de base de datos teniendo en cuenta cosas como:

Tienes que analizar cosas como que tipo de dato debería utilizar, porque y cual debería ser la longitud de cada uno de los atributos, cueles son únicos y/o tendrían valores por defecto.

## Encontar las consultas que tenemos que hacer para identificar como se han creado las tablas
esto también se llama la definición de las tablas
# Inserción de base de datos
- Tienes que crear 4 usuarios distintos
- Tienes que insertar por lo menos 100 contactos por cada usuario

# Altera la tabla para que la tabla con
Altera la tabla contacto para que el campo Sexo sea M o F Masculino o femenino

# Compartir contactos
Ahora queremos que los usuarios puedan compartir contactos con otros usuarios, que deberíamos hacer, como podríamos hacerlos. Ahora quiero que lo hagais.
# Consultas:
- [ ] Lista todos los usuarios
- [ ] Lista todos los contactos
- [ ] Lista todos los usuarios con sus contactos
- [ ] Lista todos los todos los usuarios que sean mayores de edad
- [ ] Listar todos los usuarios que su nombre empiece por "a"
- [ ] Listar todos los usuarios que su apellido empiece por "a"
- [ ] Listar todos los usuarios que su nombre contenga la "a"
- [ ] Listar todos los usuarios que su nombre empiece por "a" y ordenarlos por nombre
- [ ] Listar todos los usuarios que su apellido empiece por "a" y ordenarlos por apellido
- [ ] Listar todos los usuarios que su nombre contenga la "a" y ordenarlos por fecha de nacimiento
- [ ] Listar todos los contactos que su nombre empiece por a para cada usuario
- [ ] Decir cuantos contactos que su nombre empiece por a para cada usuario
- [ ] Listar todos los usuarios que su apellido empiece por a
- [ ] Listar todos los usuarios que su nombre contenga la a
- [ ] Cuantos emails existen en la BD
- [ ] Cuantos tlf existen en la BD
- [ ] Cuantos contactos por cada uno de los usuarios son mayores de edad
- [ ] Cual es el usuario con mayor edad de los que existen
- [ ] Cual es el contacto con menor edad de los que existen
- [ ] A que usuario pertenece el contacto con menor edad
- [ ] A que usuario pertenece el contacto con mayor edad
- [ ] Lista de todos los contactos un atributo llamado "full_name" que sea el conjunto del nombre, apellido1 y apellido2
- [ ] Listar todos los contactos que contengan una "e", que sean mayores de edad, que su DNI contanga un 1 ordenarlo y los agrupamos por fecha de nacimiento
- [ ] Hallar todos los datos de los contactos menores de 18 años a fecha de hoy

# Actualizaciones:
- [ ] Actualizaremos la fecha de nacimiento a la fecha actual de todos los contactos del usuario 4 que en su apellido2 contengan una "a" y en su DNI contenga la "5" 


# Borrado de constactos
Vamos a insertar un usuario y varios contactos y vamos a intentar hacer lo siguiente.
- [ ] Borrar el usuario (¿Qué ocurre?)
- [ ] Borrar un contacto
- [ ] Borrar todos los contactos
- [ ] Borrar el usuario
# Programación
El siguiente paso es desarrollar un programa en java que represente estos modelos de la entidad relación y que hagamos un programa donde nos conectemos a la base de datos y podamos:
- [ ] Crear un nuevo usuario
- [ ] Iniciar sesión con usuario
- [ ] Listar sus contactos
- [ ] Crear contactos
- [ ] Editar contactos
- [ ] Borrar contactos

Para ello lo primero que tienes que hacer es ver el curso de http://www.formacarm.es/portal/servlet/formacarm.servlets.Portal?METHOD=DTEMARIO&id=210