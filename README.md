# database-exercises
This repo holds the practice work for the database module at Codeup.

## What is MySQL?

- MySQL is a relational database management system based on SQL – Structured Query Language. The application is used for a wide range of purposes, including data warehousing, e-commerce, and logging applications. The most common use for mySQL however, is for the purpose of a web database. It can be used to store anything from a single record of information to an entire inventory of available products for an online store. [What is MySQL?](https://www.123-reg.co.uk/support/servers/what-is-mysql-and-why-do-i-need-it/)

- MySQL is an open-source relational database management system. A relational database organizes data into one or more data tables in which data types may be related to each other; these relations help structure the data. SQL is a language programmers use to create, modify and extract data from the relational database, as well as control user access to the database. In addition to relational databases and SQL, an RDBMS like MySQL works with an operating system to implement a relational database in a computer's storage system, manages users, allows for network access and facilitates testing database integrity and creation of backups. [Wikipedia](https://en.wikipedia.org/wiki/MySQL)

## Temporary Tables
- A temporary table is a base table that is not stored in the database, but instead exists only while the database session in which it was created is active. [Temporary Tables](https://www.sciencedirect.com/topics/computer-science/temporary-table)

- Temporary tables are particularly useful when you have a large number of records in a table and you repeatedly need to interact with a small subset of those records. In such cases instead of filtering the data again and again to fetch the subset, you can filter the data once and store it in a temporary table. You can then execute your queries on that temporary table. [Temporary Tables in SQL Server](https://codingsight.com/introduction-to-temporary-tables-in-sql-server/)