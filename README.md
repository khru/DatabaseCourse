# How to set up the development environment

## Linux

Run in the terminal

```
sudo apt-get update -y && sudo apt-get install -y make
```

## Windows

[https://stackoverflow.com/questions/32127524/how-to-install-and-use-make-in-windows](https://stackoverflow.com/questions/32127524/how-to-install-and-use-make-in-windows)

## Install Git

### Linux

```
sudo apt-get install git
```

### Windows

[https://git-scm.com/download/win](https://git-scm.com/download/win)

# Create a GitHub account

[https://github.com/join](https://github.com/join)

# Create a fork of this repository

[https://aprendegit.com/fork-de-repositorios-para-que-sirve/#:~:text=La%20palabra%20fork%20se%20traduce,como%20un%20repositorio%20git%20cualquiera.](https://aprendegit.com/fork-de-repositorios-para-que-sirve/#:~:text=La%20palabra%20fork%20se%20traduce,como%20un%20repositorio%20git%20cualquiera.)

A fork is a copy of this repository into your own personal repository, otherwise you will not be able to push your changes.

# Install a DB client

[https://dbeaver.io/](https://dbeaver.io/)
[https://www.mysql.com/products/workbench/](https://www.mysql.com/products/workbench/)

# Task to create a database

First, create a folder named `SQL`, and inside it create a folder called `DML` and another called `DDL`. Put the scripts we are going to write for creating and modifying the database in the `DDL` folder.

# ER design to create a database

Design an ER that represents the use of an address book, where we will have:

```
    - User
        - Email
        - Password
        - Date of birth
        - DNI
        - created_at
        - updated_at
        - deleted_at
    - Contact:
        - zero or more emails
        - one or many phone numbers
        - First name
        - First surname
        - Second surname
        - Sex
        - Date of birth
        - created_at
        - updated_at
        - deleted_at
```

# Creating the database schema

Convert that ER into a database schema taking into account things like:

You must analyze which data type should be used, why, and what the length of each attribute should be, which ones are unique and or should have default values.

## Find the queries we need to identify how the tables were created

This is also called the definition of the tables.

# Database insertion

* You must create 4 different users.
* You must insert at least 100 contacts for each user.

# Alter the table

Alter the `contact` table so that the `Sex` field is M or F, male or female.

# Delete some contacts
 - delete some contacts that you have created 10 for each user.
 - virtual delete a random number contacts that you have created. This means that you will use the deleted_at field to indicate that they are deleted, but they will still be in the database.

# Sharing contacts

Now we want users to be able to share contacts with other users. What should we do, how could we implement it. Now I want you to do it.

# Queries:

* [ ] List all users
* [ ] List all contacts
* [ ] List all contacts for a given user
* [ ] List all users with their contacts 
* [ ] List all users who are of legal age
* [ ] List all users whose first name starts with "a"
* [ ] List all users whose surname starts with "a"
* [ ] List all users whose first name contains the letter "a"
* [ ] List all users whose first name starts with "a" and sort them by first name
* [ ] List all users whose first name ends with "a" and sort them by first name
* [ ] List all users whose surname starts with "a" and sort them by surname
* [ ] List all users whose first name contains the letter "a" and sort them by date of birth
* [ ] For each user, list all contacts whose first name starts with "a"
* [ ] Say how many contacts whose first name starts with "a" there are for each user
* [ ] List all users whose surname starts with "a"
* [ ] List all users whose first name contains the letter "a"
* [ ] How many emails exist in the DB
* [ ] How many phone numbers exist in the DB
* [ ] How many contacts for each user are of legal age
* [ ] Which user is the oldest among those that exist
* [ ] Which contact is the youngest among those that exist
* [ ] Which user the youngest contact belongs to
* [ ] Which user the oldest contact belongs to
* [ ] List all contacts with an attribute called `full_name` that is the concatenation of first name, first surname, and second surname
* [ ] List all contacts that contain an "e", that are of legal age, whose DNI contains a 1, sort them and group them by date of birth
* [ ] Find all data for contacts under 18 years old as of today

# Updates:

* [ ] Update the date of birth to the current date for all contacts of user 4 whose second surname contains an "a" and whose DNI contains "5"

# Deleting contacts

We are going to insert a user and several contacts and we are going to try the following.

* [ ] Delete the user (what happens)
* [ ] Delete one contact
* [ ] Delete all contacts
* [ ] Delete the user
* [ ] Use virtual deletion to delete a user (set deleted_at to current date) for a random number of contacts

# Programming

The next step is to develop a program in Java that represents these entity-relationship models and to write a program where we connect to the database and can:

* [ ] Create a new user
* [ ] Log in with a user
* [ ] List their contacts
* [ ] Create contacts
* [ ] Edit contacts
* [ ] Delete contacts

To do this, the first thing you have to do is watch the course at [http://www.formacarm.es/portal/servlet/formacarm.servlets.Portal?METHOD=DTEMARIO&id=210](http://www.formacarm.es/portal/servlet/formacarm.servlets.Portal?METHOD=DTEMARIO&id=210)

# Query exercises in a bit more detail

For this we are going to load a new database that is already prepared in the `dump` folder.
We will run the command

```shell
make load-comercial-db
```

```
1 -  Find all data for customers over 20 years old as of today
2 - Find all data for customers over 35 years old who live in a district with postal code 30001
3 - Find the number of customers who live in each of the districts (that share the same postal code). In the output
4 - Find the different postal codes where we have both customers and sales reps.
5 - Find the average stock of items. (two decimals only)
6 - Find the average unit price of items that were sold in 2014 (that appear on 2014 delivery notes) (two decimals only)
7 - Find the code and description of those items that are above the average price of all items
8 - Find the current total value of the warehouse. (the value of all the items we have in stock)
9 - Find the total billing value in 2012
10 - Find the total billing value in each district (customer postal code). Include in the output the postal code and the total billing for that district.
11 - Find (in a single query) the total billing value for each year. Include the total value and the year in the result of the query.
12 - Find (for each invoice) the number of delivery notes that make it up. Include the cod_fact and the number of delivery notes in the result of the query.
13 - Find all data for the invoice with the highest amount.
14 - Find the cod_fact and amount of the invoices corresponding to the three highest amounts.
15 - Find all data for the three invoices with the highest amounts.
16 - Find all data for the items whose average sales for that item
(average number of units sold in each delivery note for that item) represent
40% or more of the current stock for that item.
17 - Find all data for the delivery notes corresponding to the three largest
delivery note amounts (Hint: you have to calculate the amount of each delivery note since
it is not in the table) (you can use a TEMPORARY table for
intermediate results)
18 - Find, for each customer, the DNI together with their total billing.
19 - Find, for each sales rep, the total amount of billing generated by the
customers they have visited at least once. Include the sales rep's DNI and the billing of their
customers. (Be careful not to add invoice amounts multiple times. You can
use a TEMPORARY table for intermediate results)
20 - Find the query to determine whether there is any item that has been sold to
all customers. If there is, indicate the item code and description.
21 - Find whether there is any item (and if there is, indicate its code and description) that has been
sold in all districts (taking the customer's postal code as the district
reference). (Without a TEMPORARY table 100% of the grade, with a TEMPORARY
table 45% of the grade)
```

# Function exercises

* For the user exercise you must create a function that searches for the user by `email` or `DNI`.
* For the user exercise you must create a function that searches by `FirstName`, `FirstSurname`, or `SecondSurname`.

# Trigger exercises

* Create a new field on the user that will calculate the total number of contacts they have, and that will be updated whenever a contact is added, updated, or deleted.
* Create one history table where the information of the "users to be updated or deleted" is stored.
* Create one history table where the information of the "contacts to be updated or deleted" is stored.
