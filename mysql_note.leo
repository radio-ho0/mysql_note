<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo (http://leoeditor.com/leo_toc.html) -->
<?xml-stylesheet ekr_test?>
<leo_file xmlns:leo="http://www.leo-editor.org/2011/leo" >
<leo_header file_format="2" tnodes="0" max_tnode_index="0" clone_windows="0"/>
<globals body_outline_ratio="0.5" body_secondary_ratio="0.5">
	<global_window_position top="50" left="50" height="500" width="700"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="root.20160211145428.1692" a="E"><vh>ho0 - mysql note</vh>
<v t="root.20160211145428.1694"><vh>Creating a database</vh></v>
<v t="root.20160211145428.1698"><vh>Examining the database</vh></v>
<v t="root.20160211145428.1699"><vh>MySQL data types</vh></v>
<v t="root.20160211145428.1703"><vh>Creating, altering and dropping tables in MySQL</vh></v>
<v t="root.20160211145428.1704"><vh>Variables</vh></v>
<v t="root.20160211145428.1705"><vh>Inserting, updating, and deleting data in MySQL</vh></v>
<v t="root.20160211145428.1706"><vh>The SELECT statement in MySQL</vh></v>
<v t="root.20160211145428.1707"><vh>MySQL subqueries</vh></v>
<v t="root.20160211145428.1708"><vh>MySQL constraints</vh></v>
<v t="root.20160211145428.1709"><vh>Exporting and importing data in MySQL</vh></v>
<v t="root.20160211145428.1710"><vh>Joining tables in MySQL</vh></v>
<v t="root.20160211145428.1711"><vh>MySQL functions</vh></v>
<v t="root.20160211145428.1693"><vh>abd</vh></v>
</v>
</vnodes>
<tnodes>
<t tx="root.20160211145428.1692">ho0
##############

:date: 2016-02-11


A `relational` database is a collection of data organised in tables. There are relations among the tables. The tables are formally described. They consist of rows and columns. 

SQL (Structured Query Language) is a database computer language designed for managing data in relational database management systems. A table is a set of values that is organised using a model of vertical columns and horizontal rows. 

The columns are identified by their names. A schema of a database system is its structure described in a formal language. It defines the tables, the fields, relationships, views, indexes, procedures, functions, queues, triggers, and other elements. 

 MySQL server is a daemon which runs in the background. The way you start MySQL depends on your system and the installation type that you have done.
 
code ::

    $ sudo /etc/init.d/mysqld start
    $ sudo /etc/init.d/mysqld stop
    

</t>
<t tx="root.20160211145428.1693"></t>
<t tx="root.20160211145428.1694">:from: http://zetcode.com/databases/mysqltutorial/firststeps/

mysql&gt; SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| test               |
+--------------------+

The ``SHOW DATABASES`` statement shows all available databases on our system. Note that SQL statements are terminated with a **semicolon**. 
There are four databases present. The information_schema, mysql, and performance_schema are MySQL system databases. The test database is available as a workspace for users to try things out. It is empty; there are no tables. 


mysql&gt; CREATE DATABASE mydb;

This statement creates a new database. Throughout this tutorial, we will use the mydb database. To create a new database, we need to have certain privileges. Remember that we have connected to the server with the root user, which is a superuser and has all privileges.

mysql&gt; SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mydb               |
| mysql              |
| performance_schema |
| test               |
+--------------------+

Showing all databases, the mydb database is among them.

mysql&gt; use mydb;
Database changed

In order to work with a database, we must first select it. We select a specific database with a use command.

mysql&gt; SHOW TABLES;
Empty set (0.00 sec)

The SHOW TABLES statement shows all available tables in a database. Since it is a newly created database, no tables are found.

mysql&gt; source cars.sql
Database changed
Query OK, 0 rows affected (0.20 sec)

Query OK, 1 row affected (0.08 sec)

...

In the first chapter, we have provided some SQL scripts to create some tables. We use the source command to execute the cars.sql script, which creates a Cars table for us.

mysql&gt; SHOW TABLES;
+----------------+
| Tables_in_mydb |
+----------------+
| Cars           |
+----------------+

Now the SHOW TABLES statement displays one table available.

mysql&gt; SELECT * FROM Cars;
+----+------------+--------+
| Id | Name       | Cost   |
+----+------------+--------+
|  1 | Audi       |  52642 |
|  2 | Mercedes   |  57127 |
|  3 | Skoda      |   9000 |
|  4 | Volvo      |  29000 |
|  5 | Bentley    | 350000 |
|  6 | Citroen    |  21000 |
|  7 | Hummer     |  41400 |
|  8 | Volkswagen |  21600 |
+----+------------+--------+

And this is the data in the table. 

Creating a new user
***********************

Similarly to Unix root account, it is advised not to use the MySQL superuser root account for our tasks. We should use the root account only when it is necessary. We rather create a new account that we will use for our tasks. This user will have limited privileges. When using the root user we could accidentally do a lot of harm to our data.

mysql&gt; CREATE USER user12@localhost IDENTIFIED BY '34klq*';

The above statement created a new user called user12. The accout has password 34klq*. The user is created, but he has no privileges.

mysql&gt; GRANT ALL ON mydb.* to user12@localhost;

This statement grants all privileges to user12 for all database objects on the mydb database. These privileges will be sufficient for the examples in this tutorial
</t>
<t tx="root.20160211145428.1698">Examining the database
############################

:from: http://zetcode.com/databases/mysqltutorial/quick/

 In this section, we are going to look at the tables of the world database in general.

mysql&gt; SHOW TABLES;
+-----------------+
| Tables_in_world |
+-----------------+
| City            |
| Country         |
| CountryLanguage |
+-----------------+

We show all available tables with the SHOW TABLES statement. There are three.

mysql&gt; DESCRIBE City;
+-------------+----------+------+-----+---------+----------------+
| Field       | Type     | Null | Key | Default | Extra          |
+-------------+----------+------+-----+---------+----------------+
| ID          | int(11)  | NO   | PRI | NULL    | auto_increment |
| Name        | char(35) | NO   |     |         |                |
| CountryCode | char(3)  | NO   | MUL |         |                |
| District    | char(20) | NO   |     |         |                |
| Population  | int(11)  | NO   |     | 0       |                |
+-------------+----------+------+-----+---------+----------------+

With the DESCRIBE statement, we can see the table structure of the City table. We see the column names and their data types. Plus other important information.

mysql&gt; SHOW CREATE TABLE City;

If we wanted to find out the SQL to create the City table, we would issue the SHOW CREATE TABLE City statement.

$ mysqldump -uroot -p world City &gt; city.sql

Here we use the mysqldump tool to back up the City table.

mysql&gt; DROP TABLE City;

mysql&gt; SHOW TABLES;
+-----------------+
| Tables_in_world |
+-----------------+
| Country         |
| CountryLanguage |
+-----------------+

We use the DROP TABLE statement to drop the City table. Subsequent statement verifies that the table was removed.

mysql&gt; source city.sql

mysql&gt; SHOW TABLES;
+-----------------+
| Tables_in_world |
+-----------------+
| City            |
| Country         |
| CountryLanguage |
+-----------------+

We recreate the City table from the backup. The source command executes the backup city.sql script.
Queries

Queries are used to look up data from the database tables.
Limiting data output

There are thousands of rows in the tables of the database. They cannot be displayed all on the screen. We can control the number of rows to be displayed with the LIMIT clause.

mysql&gt; SELECT Id, Name, Population FROM City LIMIT 10;
+----+----------------+------------+
| Id | Name           | Population |
+----+----------------+------------+
|  1 | Kabul          |    1780000 |
|  2 | Qandahar       |     237500 |
|  3 | Herat          |     186800 |
|  4 | Mazar-e-Sharif |     127800 |
|  5 | Amsterdam      |     731200 |
|  6 | Rotterdam      |     593321 |
|  7 | Haag           |     440900 |
|  8 | Utrecht        |     234323 |
|  9 | Eindhoven      |     201843 |
| 10 | Tilburg        |     193238 |
+----+----------------+------------+

In the above query, we show three of the five columns of the City table. There are lots of rows in the table. We limit the query to the first 10 rows.

mysql&gt; SELECT Id, Name, Population FROM City LIMIT 15, 5;
+----+-------------------+------------+
| Id | Name              | Population |
+----+-------------------+------------+
| 16 | Haarlem           |     148772 |
| 17 | Almere            |     142465 |
| 18 | Arnhem            |     138020 |
| 19 | Zaanstad          |     135621 |
| 20 | ´s-Hertogenbosch  |     129170 |
+----+-------------------+------------+

The LIMIT clause can be followed by two numbers. The first one is the offset and the second one is the number of rows to display. Our query shows rows 16-20.

mysql&gt; pager less
PAGER set to 'less'
mysql&gt; SELECT * FROM City;
+------------------------------------+------------+
| Name                               | Population |
+------------------------------------+------------+
| Kabul                              |    1780000 |
| Qandahar                           |     237500 |
| Herat                              |     186800 |
...
:

Since the City table has more than four thousand rows, we cannot see them in one screen. We can use the pager command to show the data in a less program. We can navigate through the data with the cursor keys or page down, page up keys. If we want to use no pager program, simply hit the pager without an argument.

$ mysql -u user12 -p world -e "SELECT * FROM City" &gt; city
Enter password: 
$ ls -sh city
144K city

The mysql command tool can be used in a non-interactive way. We specify the SQL statement after the -e option and redirect the result to the city file. Now we can use any text editor to display the data.
The COUNT(), MAX(), MIN() functions

mysql&gt; SELECT COUNT(Id) AS 'Number of rows' FROM City;
+----------------+
| Number of rows |
+----------------+
|           4079 |
+----------------+

There are 4079 cities in the table. We use the built-in COUNT() function to find out the number of rows.

mysql&gt; SELECT Name, Population FROM City
    -&gt; WHERE Population = (SELECT Max(Population) FROM City);
+-----------------+------------+
| Name            | Population |
+-----------------+------------+
| Mumbai (Bombay) |   10500000 |
+-----------------+------------+

The above query shows the most populated city in the table. The SQL is a special type of a query called a subquery. The outer query uses the data returned by the inner query. The inner query is bounded by parentheses.

mysql&gt; SELECT Name, Population FROM City 
    -&gt; WHERE Population = (SELECT Min(Population) FROM City);
+-----------+------------+
| Name      | Population |
+-----------+------------+
| Adamstown |         42 |
+-----------+------------+

This subquery shows the least populated city in the table.
Selecting specific rows with the WHERE clause

The WHERE clause can be used to filter the results. It provides a selection criteria to select only specific rows from the data.

mysql&gt; SELECT Name, Population FROM City 
    -&gt; WHERE Population &gt; 1000000;
+--------------------------+------------+
| Name                     | Population |
+--------------------------+------------+
| Kabul                    |    1780000 |
| Alger                    |    2168000 |
| Luanda                   |    2022000 |
| Buenos Aires             |    2982146 |
| La Matanza               |    1266461 |
| Córdoba                  |    1157507 |
...

The above SQL statement returns all cities with a population above one million people.

mysql&gt; SELECT Name FROM City WHERE Name LIKE 'Kal%';
+-------------+
| Name        |
+-------------+
| Kalookan    |
| Kalyan      |
| Kalemie     |
| Kallithea   |
| Kalisz      |
| Kaliningrad |
| Kaluga      |
+-------------+
7 rows in set (0.00 sec)

Here we select all city names which begin with Kal. We have found seven cities in the table. We can look for a specific pattern in the column with the LIKE clause.

mysql&gt; SELECT Name, Population FROM City 
    -&gt; WHERE ID IN (5, 32, 344, 554);
+-------------------+------------+
| Name              | Population |
+-------------------+------------+
| Amsterdam         |     731200 |
| Alkmaar           |      92713 |
| Guarapuava        |     160510 |
| Santiago de Chile |    4703954 |
+-------------------+------------+
4 rows in set (0.00 sec)

This SQL code returns cities and their populations for rows with Id 5, 32, 344, and 554.

mysql&gt; SELECT * FROM City WHERE Name = 'Bratislava';
+------+------------+-------------+------------+------------+
| ID   | Name       | CountryCode | District   | Population |
+------+------------+-------------+------------+------------+
| 3209 | Bratislava | SVK         | Bratislava |     448292 |
+------+------------+-------------+------------+------------+
1 row in set (0.00 sec)

With the above SQL statement we select all columns for one specific city, namely Bratislava.

mysql&gt; SELECT Name, Population FROM City 
    -&gt; WHERE Population BETWEEN 670000 AND 700000;
+----------------+------------+
| Name           | Population |
+----------------+------------+
| Teresina       |     691942 |
| Natal          |     688955 |
| Bandar Lampung |     680332 |
| Gwalior        |     690765 |
| Kermanshah     |     692986 |
| Palermo        |     683794 |
| Toronto        |     688275 |
| Huainan        |     700000 |
| Jixi           |     683885 |
| Antananarivo   |     675669 |
| Chihuahua      |     670208 |
| Kano           |     674100 |
| Tunis          |     690600 |
+----------------+------------+
13 rows in set (0.00 sec)

Say we wanted to find out cities with a population between two specific values. There is a BETWEEN operator for this. We have found 13 cities with a population in the range 670,000 and 700,000.
Ordering data

Ordering data can be done with the ORDER BY clause.

mysql&gt; SELECT Name, Population FROM City
    -&gt; ORDER BY Population DESC LIMIT 10;
+-------------------+------------+
| Name              | Population |
+-------------------+------------+
| Mumbai (Bombay)   |   10500000 |
| Seoul             |    9981619 |
| São Paulo         |    9968485 |
| Shanghai          |    9696300 |
| Jakarta           |    9604900 |
| Karachi           |    9269265 |
| Istanbul          |    8787958 |
| Ciudad de México  |    8591309 |
| Moscow            |    8389200 |
| New York          |    8008278 |
+-------------------+------------+
10 rows in set (0.00 sec)

We find the 10 most populated cities. We order the data by population from the most populated to the least populated city. We limit the output with the LIMIT clause.

mysql&gt; SELECT Name, Population FROM City 
    -&gt; ORDER BY Population ASC LIMIT 10;
+---------------------+------------+
| Name                | Population |
+---------------------+------------+
| Adamstown           |         42 |
| West Island         |        167 |
| Fakaofo             |        300 |
| Città del Vaticano  |        455 |
| Bantam              |        503 |
| Yaren               |        559 |
| The Valley          |        595 |
| Alofi               |        682 |
| Flying Fish Cove    |        700 |
| Kingston            |        800 |
+---------------------+------------+
10 rows in set (0.01 sec)

Here we get the least populated cities. This time we order the data in the ascending order. For this we use the ASC keyword.

mysql&gt; SELECT Name, Population FROM City 
    -&gt; ORDER BY Name LIMIT 10;
+------------------------+------------+
| Name                   | Population |
+------------------------+------------+
| A Coruña (La Coruña)   |     243402 |
| Aachen                 |     243825 |
| Aalborg                |     161161 |
| Aba                    |     298900 |
| Abadan                 |     206073 |
| Abaetetuba             |     111258 |
| Abakan                 |     169200 |
| Abbotsford             |     105403 |
| Abeokuta               |     427400 |
| Aberdeen               |     213070 |
+------------------------+------------+
10 rows in set (0.01 sec)

In the above SQL statement we order data by city name and get the first ten cities.
Grouping data

The GROUP BY clause is used to combine database records with identical values into a single record. It is often used with the aggregation functions.

mysql&gt; SELECT District, SUM(Population) FROM City
    -&gt; WHERE District = 'New York' GROUP BY District;
+----------+-----------------+
| District | SUM(Population) |
+----------+-----------------+
| New York |         8958085 |
+----------+-----------------+
1 row in set (0.00 sec)

The above SQL statement returns the total number of people in the towns of the New York district, which are listed in our database.

mysql&gt; SELECT Name, District, Population FROM City
    -&gt; WHERE District = 'New York';
+-----------+----------+------------+
| Name      | District | Population |
+-----------+----------+------------+
| New York  | New York |    8008278 |
| Buffalo   | New York |     292648 |
| Rochester | New York |     219773 |
| Yonkers   | New York |     196086 |
| Syracuse  | New York |     147306 |
| Albany    | New York |      93994 |
+-----------+----------+------------+
6 rows in set (0.01 sec)

The previous number is a sum of these six cities.

mysql&gt; SELECT District, SUM(Population) FROM City
    -&gt; WHERE CountryCode = 'USA' GROUP BY District
    -&gt; HAVING SUM(Population) &gt; 3000000;
+------------+-----------------+
| District   | SUM(Population) |
+------------+-----------------+
| Arizona    |         3178903 |
| California |        16716706 |
| Florida    |         3151408 |
| Illinois   |         3737498 |
| New York   |         8958085 |
| Texas      |         9208281 |
+------------+-----------------+
6 rows in set (0.00 sec)

We select all districts which have population over 3 million people. When we work with groups of data, we use the HAVING clause instead of the WHERE clause.
Updating, deleting, and inserting data

Next we will concern ourselves with updating, deleting, and inserting data.

mysql&gt; SELECT Name, HeadOfState FROM Country
    -&gt; WHERE Name = 'United States';
+---------------+----------------+
| Name          | HeadOfState    |
+---------------+----------------+
| United States | George W. Bush |
+---------------+----------------+
1 row in set (0.00 sec)

As we have already stated, the world database is outdated. George Bush is not the president of the USA anymore.

mysql&gt; UPDATE Country SET HeadOfState = 'Barack Obama'
    -&gt; WHERE Name = 'United States';

With the UPDATE statement we change the row to the actual data.

mysql&gt; SELECT Name, HeadOfState FROM Country WHERE Name = 'United States';
+---------------+--------------+
| Name          | HeadOfState  |
+---------------+--------------+
| United States | Barack Obama |
+---------------+--------------+
1 row in set (0.00 sec)

We have successfully updated the row.

mysql&gt; CREATE TABLE First10 engine=MEMORY SELECT * FROM City LIMIT 10;

We create a temporary table in the memory. It will contain first ten cities from the City table.

mysql&gt; SELECT * FROM First10;
+----+----------------+-------------+---------------+------------+
| ID | Name           | CountryCode | District      | Population |
+----+----------------+-------------+---------------+------------+
|  1 | Kabul          | AFG         | Kabol         |    1780000 |
|  2 | Qandahar       | AFG         | Qandahar      |     237500 |
|  3 | Herat          | AFG         | Herat         |     186800 |
|  4 | Mazar-e-Sharif | AFG         | Balkh         |     127800 |
|  5 | Amsterdam      | NLD         | Noord-Holland |     731200 |
|  6 | Rotterdam      | NLD         | Zuid-Holland  |     593321 |
|  7 | Haag           | NLD         | Zuid-Holland  |     440900 |
|  8 | Utrecht        | NLD         | Utrecht       |     234323 |
|  9 | Eindhoven      | NLD         | Noord-Brabant |     201843 |
| 10 | Tilburg        | NLD         | Noord-Brabant |     193238 |
+----+----------------+-------------+---------------+------------+
10 rows in set (0.00 sec)

This is the contents of the First10 table.

mysql&gt; DELETE FROM First10 WHERE ID IN (2, 4, 6, 8, 10);

With the DELETE FROM statement and the WHERE clause we delete every second row from the First10 table.

mysql&gt; SELECT * FROM First10;
+----+-----------+-------------+---------------+------------+
| ID | Name      | CountryCode | District      | Population |
+----+-----------+-------------+---------------+------------+
|  1 | Kabul     | AFG         | Kabol         |    1780000 |
|  3 | Herat     | AFG         | Herat         |     186800 |
|  5 | Amsterdam | NLD         | Noord-Holland |     731200 |
|  7 | Haag      | NLD         | Zuid-Holland  |     440900 |
|  9 | Eindhoven | NLD         | Noord-Brabant |     201843 |
+----+-----------+-------------+---------------+------------+
5 rows in set (0.00 sec)

We have five rows left in the table.

mysql&gt; TRUNCATE TABLE First10;
Query OK, 0 rows affected (0.00 sec)

mysql&gt; SELECT * FROM First10;
Empty set (0.00 sec)

We delete all rows from the table with the TRUNCATE statement. There is no data left.

mysql&gt; INSERT INTO First10 VALUES(1, 'Kabul', 'AFG', 'Kabol', 1780000);

mysql&gt; SELECT * FROM First10;
+----+-------+-------------+----------+------------+
| ID | Name  | CountryCode | District | Population |
+----+-------+-------------+----------+------------+
|  1 | Kabul | AFG         | Kabol    |    1780000 |
+----+-------+-------------+----------+------------+
1 row in set (0.00 sec)

With the INSERT INTO statement, we insert one row into the table.

mysql&gt; DROP TABLE First10;
Query OK, 0 rows affected (0.00 sec)

We drop the table from the database.

In this chapter, we have quickly introduced some basics of the MySQL database. We go into more details in the following chapters. </t>
<t tx="root.20160211145428.1699">MySQL data types

:from: http://zetcode.com/databases/mysqltutorial/datatypes/

 In this part of the MySQL tutorial, we will cover MySQL data types.

A data type is a set of representable values. Each value belongs to one data type. Items that can be referenced by a name, such as SQL parameters, columns, fields, attributes, and variables, also have declared types.

MySQL supports three groups of data types:

    Numeric
    Date &amp; time
    String

Choosing the right data types for columns is a part of the initial design of the database. Data types ensure the correctness of the data provided. They ensure that the data is used in a meaningful way. This is important when we do comparisons, ordering of data. For example dates are compared differently than numbers. Other developers using our tables will know what data to expect from the database schema. Data types enable MySQL to do validation on the data inserted. Finally, with correct data types for table columns, we allow MySQL to optimise the queries and use less disk space.
Numbers

Numeric types can be either integers or floating point numbers.

    Integers
        TINYINT
        SMALLINT
        MEDIUMINT
        INTEGER
        BIGINT
    Floating points
        FLOAT
        DOUBLE
        DECIMAL

Integers

Integers are a subset of the real numbers. They are written without a fraction or a decimal component. Integers fall within a set Z = {..., -2, -1, 0, 1, 2, ...} Integers are infinite. Computers can practically work only with a subset of integer values, because computers have finite capacity. Integers are used to count discrete entities. We can have 3, 4, 6 cars, but we cannot have 3.33 cars. We can have 3.33 kilograms.

The following is a table of integer types in MySQL: TINYINT, MEDIUMINT and BIGINT are MySQL extensions to the SQL standard.
Data type 	Bytes 	Minimum value 	Maximum value
TINYINT 	1 	-128 	127
SMALLINT 	2 	-32768 	32767
MEDIUMINT 	3 	-8388608 	8388607
INTEGER 	4 	-2147483648 	2147483647
BIGINT 	8 	-9223372036854775808 	9223372036854775807

The integer types differ in their storage. We can choose values that fit our requirements.

mysql&gt; CREATE TABLE Ages(Id SMALLINT, Age TINYINT) ENGINE=Memory;

We have created a temporary Ages table. This will be only a temporary testing table, so there will be only a few rows. SMALLINT will certainly suffice. We do not know anyone older than 130 years, so TINYINT will be OK for the Age column.

mysql&gt; INSERT INTO Ages VALUES(1, 43);
Query OK, 1 row affected (0.00 sec)

mysql&gt; INSERT INTO Ages VALUES(2, 128);
Query OK, 1 row affected, 1 warning (0.00 sec)

We insert two rows into the table. There is a warning for the second SQL statement.

mysql&gt; SHOW WARNINGS;
+---------+------+----------------------------------------------+
| Level   | Code | Message                                      |
+---------+------+----------------------------------------------+
| Warning | 1264 | Out of range value for column 'Age' at row 1 |
+---------+------+----------------------------------------------+

We use the SHOW WARNINGS SQL statement to show the last warning message. We have tried to insert a value which is larger than the column data type allows. There is no integer overflow, as we know from the C language. In such a case, the largest allowable integer is written and a warning is issued.

When we are dealing with ages, we do not need negative integer values. MySQL supports unsigned integers. This way we can further optimise our table definitions.

mysql&gt; ALTER TABLE Ages MODIFY Age TINYINT UNSIGNED;

We use the SQL statement to change the Age column to have a TINYINT UNSIGNED data type. Now we can insert values from 0 to 255.

mysql&gt; INSERT INTO Ages VALUES(3, 240);
Query OK, 1 row affected (0.00 sec)

mysql&gt; SELECT * FROM Ages;
+------+------+
| Id   | Age  |
+------+------+
|    1 |   43 |
|    2 |  127 |
|    3 |  240 |
+------+------+

We have inserted a hypothetical 240. Now the column accepts it.
Floating point values

Floating point numbers represent real numbers in computing. Real numbers measure continuous quantities. Like weight, height or speed. MySQL has FLOAT, DOUBLE and DECIMAL floating point values.

A FLOAT is a single precision floating point number. MySQL uses four bytes to store a FLOAT value. A DOUBLE is a double precision floating point number. MySQL uses eight bytes to store a DOUBLE value. DECIMAL data type is best used for financial calculations.

Floats, doubles and decimals may have specified their precision and scale. In DECIMAL[M, D] the M is the maximum number of digits, the precision. The D is the number of digits to the right of the decimal point. It is the scale. If you have a column with DECIMAL(3, 1), you can insert numbers with maximum of three digits. Two before and one after the decimal point.

mysql&gt; SELECT 1/3;
+--------+
| 1/3    |
+--------+
| 0.3333 |
+--------+
1 row in set (0.02 sec)

mysql&gt; SELECT 0.3333 = 1/3;
+--------------+
| 0.3333 = 1/3 |
+--------------+
|            0 |
+--------------+
1 row in set (0.00 sec)

You might expect that the comparison in the second SQL statement returns true, but it does not. The reason is the way, how floating point values are stored.

Caution must be exercised when working with floating point values. Floats and doubles are faster to deal with, but they are not accurate to the last digit. There is a small rounding error, which is OK in many cases. In many real word situations, we just need to have an approximate value. For example, you have a shop in which you have 7.5321 kg of apples, 4.372 kg of oranges. It is perfectly valid to store these two values as 7.5 kg and 4.4 kg. No big deal. On the other hand, when we do exact mathematical calculations; let's say we add some financial data or any scientific calculations, we need more precision. For such cases, we use the DECIMAL data type.

mysql&gt; CREATE TABLE Numbers (Id TINYINT, Floats FLOAT, Decimals DECIMAL(3, 2));

We create a table, in which we are going to store a few floats and decimals.

mysql&gt; INSERT INTO Numbers VALUES (1, 1.1, 1.1), (2, 1.1, 1.1), (3, 1.1, 1.1);

We insert three rows into the newly created table.

mysql&gt; SELECT * FROM Numbers;
+------+--------+----------+
| Id   | Floats | Decimals |
+------+--------+----------+
|    1 |    1.1 |     1.10 |
|    2 |    1.1 |     1.10 |
|    3 |    1.1 |     1.10 |
+------+--------+----------+

This is how the table looks.

mysql&gt; SELECT SUM(Floats), SUM(Decimals) FROM Numbers;
+------------------+---------------+
| SUM(Floats)      | SUM(Decimals) |
+------------------+---------------+
| 3.30000007152557 |          3.30 |
+------------------+---------------+

The two results differ. The decimal calculation is more precise. Due to some internal rounding, the sum of floats is not accurate.
Date &amp; time values

MySQL has data types for storing dates and times. It has DATE, TIME, DATETIME, YEAR and TIMESTAMP.

The DATE is used to store dates. MySQL retrieves and displays date values in YYYY-MM-DD format. The supported range is from 1000-01-01 to 9999-12-31.

mysql&gt; CREATE TABLE Dates(Id TINYINT, Dates DATE);
mysql&gt; INSERT INTO Dates VALUES(1, '2011-01-24');
mysql&gt; INSERT INTO Dates VALUES(2, '2011/01/25');
mysql&gt; INSERT INTO Dates VALUES(3, '20110126');
mysql&gt; INSERT INTO Dates VALUES(4, '110127');
mysql&gt; INSERT INTO Dates VALUES(5, '2011+01+28');

Dates are displayed in MySQL in one format, but we can use various date formats in our SQL statements. The YYYY-MM-DD is the standard format. But we can use any punctuation character between the date parts.

mysql&gt; SELECT * FROM Dates;
+------+------------+
| Id   | Dates      |
+------+------------+
|    1 | 2011-01-24 |
|    2 | 2011-01-25 |
|    3 | 2011-01-26 |
|    4 | 2011-01-27 |
|    5 | 2011-01-28 |
+------+------------+

We have used multiple formats to insert dates into the table. MySQL uses one format to display the dates.

mysql&gt; INSERT INTO Dates VALUES (6, '10000-01-01');
Query OK, 1 row affected, 1 warning (0.00 sec)

mysql&gt; SHOW WARNINGS;
+---------+------+--------------------------------------------+
| Level   | Code | Message                                    |
+---------+------+--------------------------------------------+
| Warning | 1265 | Data truncated for column 'Dates' at row 1 |
+---------+------+--------------------------------------------+
1 row in set (0.00 sec)

mysql&gt; SELECT Id, Dates FROM Dates WHERE Id=6;
+------+------------+
| Id   | Dates      |
+------+------------+
|    6 | 0000-00-00 |
+------+------------+
1 row in set (0.00 sec)

In case we go beyond the range of supported date values a warning is issued. The data is truncated to zero values.

The TIME data type is used to display time in MySQL. It shows values in HH:MM:SS format. The range is from -838:59:59 to 838:59:59. The hours part of the time format may be greater than 24. It is because TIME data type can be used to denote time intervals. This is also why we can have negative time values.

mysql&gt; SELECT TIMEDIFF('23:34:32', '22:00:00');
+----------------------------------+
| TIMEDIFF('23:34:32', '22:00:00') |
+----------------------------------+
| 01:34:32                         |
+----------------------------------+

We use the TIMEDIFF() function to subtract two time values.

mysql&gt; SELECT TIME('2011-01-29 11:27:42');
+-----------------------------+
| TIME('2011-01-29 11:27:42') |
+-----------------------------+
| 11:27:42                    |
+-----------------------------+

We can use the TIME() function to extract the time part of the date and time value.

mysql&gt; SELECT TIMEDIFF('211344', 201123);
+----------------------------+
| TIMEDIFF('211344', 201123) |
+----------------------------+
| 01:02:21                   |
+----------------------------+

We can write time values in different formats too. The first parameter is a time value in a string format without delimiters. The second is a time value specified as a number.

The DATETIME values contain both date and time. MySQL retrieves and displays values in YYYY-MM-DD HH:MM:SS format. The supported range is from 1000-01-01 00:00:00 to 9999-12-31 23:59:59.

mysql&gt; SELECT DAYNAME('2011@01@29 11@50@13');
+--------------------------------+
| DAYNAME('2011@01@29 11@50@13') |
+--------------------------------+
| Saturday                       |
+--------------------------------+

MySQL displays date and time in only one format. But in our SQL statements, we can use different formats. Any punctuation character may be used as the delimiter between date parts or time parts. In our case, we have used the @ character.

The YEAR is a data type used for representing years. MySQL displays YEAR values in YYYY format. It allows us to assign values to YEAR columns using either strings or numbers. The allowable range is from 1901 to 2155. Illegal year values are converted to 0000.

A timestamp is a sequence of characters, denoting the date and/or time at which a certain event occurred. Timestamps are typically used for logging events. In MySQL we have a TIMESTAMP data type for creating timestamps. A TIMESTAMP column is useful for recording the date and time of an INSERT or UPDATE operation. It automatically sets to the date and time of the most recent operation if you do not give it a value yourself. The TIMESTAMP data type has a range of 1970-01-01 00:00:01 UTC to 2038-01-19 03:14:07 UTC.

The following table summarises the supported TIMESTAMP formats.
Data type 	Format
TIMESTAMP(14) 	YYYYMMDDHHMMSS
TIMESTAMP(12) 	YYMMDDHHMMSS
TIMESTAMP(10) 	YYMMDDHHMM
TIMESTAMP(8) 	YYYYMMDD
TIMESTAMP(6) 	YYMMDD
TIMESTAMP(4) 	YYMM
TIMESTAMP(2) 	YY

The TIMESTAMP data type offers automatic initialisation and updating. We can restrict this data type to have only automatic initialisation or automatic update only.

mysql&gt; CREATE TABLE Prices(Id TINYINT, Price Decimal(8, 2),
    -&gt; Stamp TIMESTAMP);
mysql&gt; INSERT INTO Prices (Id, Price) VALUES (1, 234.34);
mysql&gt; INSERT INTO Prices (Id, Price) VALUES (2, 344.12);

We create a table with a TIMESTAMP column. We insert two rows into the table. The Stamp column is not included in the SQL statements. MySQL automatically fills the column.

mysql&gt; SELECT * FROM Prices;
+------+--------+---------------------+
| Id   | Price  | Stamp               |
+------+--------+---------------------+
|    1 | 234.34 | 2011-01-29 13:24:29 |
|    2 | 344.12 | 2011-01-29 13:24:59 |
+------+--------+---------------------+

The timestamps for the two rows were created. This is the auto-initialisation of the TIMESTAMP data type. This can be turned off by Stamp TIMESTAMP DEFAULT 0 ON UPDATE CURRENT_TIMESTAMP SQL code.

mysql&gt; UPDATE Prices SET Price=250.50 WHERE Id=1;

We execute the SQL statement to update the Price column in the first row.

mysql&gt; SELECT * FROM Prices;
+------+--------+---------------------+
| Id   | Price  | Stamp               |
+------+--------+---------------------+
|    1 | 250.50 | 2011-01-29 13:25:50 |
|    2 | 344.12 | 2011-01-29 13:24:59 |
+------+--------+---------------------+

The timestamp of the first column was updated. If we wanted to turn off the auto-update of the TIMESTAMP, we could use the Stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP SQL code.
Strings

MySQL has the following string data types:

    CHAR
    VARCHAR
    BINARY
    VARBINARY
    BLOB
    TEXT
    ENUM
    SET

A CHAR is a fixed length character data type. It is declared with a length, CHAR(x), where x can be between 0 to 255. CHAR always uses the same amount of storage space per entry. In case we specify an item which is shorter than the declared length, the value is right-padded with spaces to the specified length. Trailing spaces are removed when the value is retrieved.

mysql&gt; CREATE TABLE Chars(Id TINYINT, Chars CHAR(3));
Query OK, 0 rows affected (0.08 sec)

mysql&gt; INSERT INTO Chars VALUES (1, 'a'), (2, 'ab'), 
    -&gt; (3, 'abc'), (4, 'abce');
Query OK, 4 rows affected, 1 warning (0.00 sec)
Records: 4  Duplicates: 0  Warnings: 1

mysql&gt; SHOW WARNINGS;
+---------+------+--------------------------------------------+
| Level   | Code | Message                                    |
+---------+------+--------------------------------------------+
| Warning | 1265 | Data truncated for column 'Chars' at row 4 |
+---------+------+--------------------------------------------+
1 row in set (0.00 sec)

In the above SQL code, we have created a Chars table, which has one column of the CHAR data type. The length is set to three characters. The second SQL statement inserts four rows into the table. Note that there is a warning. With the SHOW WARNINGS statement we find out that the data to be inserted at the fourth row has been truncated. It is because it exceeded the maximum length allowed.

mysql&gt; SELECT * FROM Chars;
+------+-------+
| Id   | Chars |
+------+-------+
|    1 | a     |
|    2 | ab    |
|    3 | abc   |
|    4 | abc   |
+------+-------+

This is what we have in the table.

mysql&gt; SELECT Id, LENGTH(Chars) AS Length FROM Chars;
+------+--------+
| Id   | Length |
+------+--------+
|    1 |      1 |
|    2 |      2 |
|    3 |      3 |
|    4 |      3 |
+------+--------+

We have retrieved Ids and the length of the characters that we have inserted. Above we have stated that chars are stored at fixed size. Why do we have different size values for the rows. We would expect each row to have exactly 3 characters. The reason is that MySQL trims spaces for chars at the data retrieval. By setting the sql_mode to PAD_CHAR_TO_FULL_LENGTH the spaces are also trimmed.

mysql&gt; SET sql_mode = 'PAD_CHAR_TO_FULL_LENGTH';
Query OK, 0 rows affected (0.00 sec)

mysql&gt; SELECT Id, LENGTH(Chars) AS Length FROM Chars;
+------+--------+
| Id   | Length |
+------+--------+
|    1 |      3 |
|    2 |      3 |
|    3 |      3 |
|    4 |      3 |
+------+--------+
4 rows in set (0.00 sec)

By changing the sql_mode, we get the expected results.

VARCHAR data types stores variable-length strings. The length of the string can be from 0 to 65535. VARCHAR values are not padded when they are stored. Trailing spaces are retained when values are stored and retrieved. Most shorter string data types are stored in this data type. For example emails, names of people, of merchandise, addresses etc.

mysql&gt; CREATE TABLE FirstNames(Id TINYINT, FirstName VARCHAR(20));
Query OK, 0 rows affected (0.05 sec)

mysql&gt; INSERT INTO FirstNames VALUES (1, 'Tom'), (2, 'Lucy'), (3, 'Alice'),
    -&gt; (4, 'Robert'), (5, 'Timothy'), (6, 'Alexander');
Query OK, 6 rows affected (0.00 sec)
Records: 6  Duplicates: 0  Warnings: 0

We create a FirstNames table in which we store six first names.

mysql&gt; SELECT Id, LENGTH(FirstName) AS Length FROM FirstNames;
+------+--------+
| Id   | Length |
+------+--------+
|    1 |      3 |
|    2 |      4 |
|    3 |      5 |
|    4 |      6 |
|    5 |      7 |
|    6 |      9 |
+------+--------+

We can see that names in a VARCHAR column type are stored in variable length. This saves disk space.

BINARY and VARBINARY are binary byte data types. They contain byte strings rather than character strings. They have no character sets. Sorting and comparison are based on the numeric values of the bytes in the values. The range of the BINARY data types is from 0 to 255. It stores values in fixed length. The range of the VARBINARY is from 0 to 65535.

A BLOB is a binary large object data type. It can hold a variable amount of binary data. It can be used to store binary data like images or documents. BLOB has four types:
Blog type 	Range in bytes
TINYBLOB 	0 - 255
BLOB 	0 - 65535
MEDIUMBLOB 	0 - 16777215
LONGBLOB 	0 - 4294967295

A TEXT datatype is used for storing large textual data. For example articles, blogs, pages or comments.
Blog type 	Range in bytes
TINYTEXT 	0 - 255
TEXT 	0 - 65535
MEDIUMTEXT 	0 - 16777215
LONGTEXT 	0 - 4294967295

The last data types we are going to mention are ENUM and SET The ENUM is a string object with a value chosen from a permitted list of values. They are enumerated explicitly in the column specification. We can insert only one value from the list.

mysql&gt; CREATE TABLE SizeTable(Size ENUM('S', 'M', 'L', 'XL', 'XXL'));

We create a table, which has one column of the ENUM type. The list of permitted values is explicitly stated.

mysql&gt; INSERT INTO SizeTable VALUES ('S'), ('L');

We insert two rows in the table.

mysql&gt; INSERT INTO SizeTable VALUES ('Large');
Query OK, 1 row affected, 1 warning (0.00 sec)

mysql&gt; SHOW WARNINGS;
+---------+------+-------------------------------------------+
| Level   | Code | Message                                   |
+---------+------+-------------------------------------------+
| Warning | 1265 | Data truncated for column 'Size' at row 1 |
+---------+------+-------------------------------------------+

Large was not mentioned in the list. In such a case a warning is issued. It says that the data was truncated.

mysql&gt; SELECT * FROM SizeTable;
+------+
| Size |
+------+
| S    |
| L    |
|      |
+------+

We have two regular values in the table. In the third case, empty text was written.

A SET is a string object that can have zero or more values, each of which must be chosen from a list of permitted values. It is similar to the ENUM data type. The difference is that it can contain zero or more values from the list of permitted values. 

</t>
<t tx="root.20160211145428.1703">Creating, altering and dropping tables in MySQL

:from: http://zetcode.com/databases/mysqltutorial/tables/



 In this part of the MySQL tutorial, we will be creating, altering, and dropping tables.

We will use the following SQL statements:

    CREATE TABLE
    ALTER TABLE
    DROP TABLE

The CREATE, ALTER, and DROP statements are not limited to tables. We can use them to create other database objects like events, triggers, views, functions or procedures. These statements are part of the Data Definition Language (DDL) of the SQL specification.
CREATE and DROP statements

The CREATE statement is used to create tables. It is also used to create indexes, views, events, routines, and triggers.

To create a table, we give a name to a table and to its columns. Each column has a data type. We have covered various MySQL data types in the previous chapter. Choosing the correct datatype for the columns is part of the initial design of the database.

mysql&gt; CREATE TABLE Testing(Id INTEGER);

We create a simple Testing table with the CREATE TABLE statement. The table name is Testing. The table has one column called Id. And column's datatype is INTEGER.

mysql&gt; SHOW CREATE TABLE Testing;
+---------+------------------------------------------
| Table   | Create Table                                                                                
+---------+------------------------------------------
| Testing | CREATE TABLE `Testing` (
  `Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |
+---------+------------------------------------------
1 row in set (0.00 sec)

Using the SHOW CREATE TABLE statement, we can see the exact SQL statement to create a specific table. There are also some defaults. These are chosen if we do not provide some explicit attributes. The default MySQL engine is InnoDB if not specified otherwise. (This applies to MySQL 5.5+). The default charset it latin1.

mysql&gt; SHOW TABLES LIKE 'T%';
+---------------------+
| Tables_in_mydb (T%) |
+---------------------+
| Testing             |
+---------------------+

Created, non-temporary tables can be shown using the SHOW TABLES syntax. We can restrict the tables shown using the LIKE clause. In our case, we show all tables that begin with T.

mysql&gt; DROP TABLE Testing;
Query OK, 0 rows affected (0.00 sec)

mysql&gt; SHOW TABLES LIKE 'T%';
Empty set (0.00 sec)

The DROP TABLE statement drops a table from the database.

mysql&gt; CREATE TABLE Testing(Id INT NOT NULL) ENGINE=MEMORY CHARACTER SET='utf8'
    -&gt; COLLATE='utf8_slovak_ci';

We recreate the Testing table. The INT is a synonym for INTEGER. The database engine is explicitly set to MEMORY. We also specify the character set and collation.
ALTER TABLE statement

The ALTER TABLE statement changes the structure of an existing table. It is possible to add a new column, delete a column, rename column and table or change the type of the table. In the following examples, we will demonstrate some of the possibilities.

mysql&gt; ALTER TABLE Testing RENAME TO TestTable;

mysql&gt; SHOW TABLES LIKE 'T%';
+---------------------+
| Tables_in_mydb (T%) |
+---------------------+
| TestTable           |
+---------------------+

We use the RENAME TO clause to rename the Testing table to TestTable.

mysql&gt; ALTER TABLE TestTable ADD iValues INT;

We add a new column named iValues to the table.

mysql&gt; SHOW COLUMNS FROM TestTable;
+---------+---------+------+-----+---------+-------+
| Field   | Type    | Null | Key | Default | Extra |
+---------+---------+------+-----+---------+-------+
| Id      | int(11) | NO   |     | NULL    |       |
| iValues | int(11) | YES  |     | NULL    |       |
+---------+---------+------+-----+---------+-------+

The statement shows available columns in the table. We see the newly added column.

It is possible to add constraints to the table.

mysql&gt; ALTER TABLE TestTable ADD PRIMARY KEY (Id);

We add a PRIMARY KEY constraint to the TestTable.

mysql&gt; DESCRIBE TestTable;
+---------+---------+------+-----+---------+-------+
| Field   | Type    | Null | Key | Default | Extra |
+---------+---------+------+-----+---------+-------+
| Id      | int(11) | NO   | PRI | NULL    |       |
| iValues | int(11) | YES  |     | NULL    |       |
+---------+---------+------+-----+---------+-------+

The DESCRIBE is a synonym for SHOW COLUMNS FROM. We can see under the Key column that the primary key constraint is set for the Id column.

mysql&gt; ALTER TABLE TestTable CHANGE COLUMN iValues iValues1 INT;

In this SQL statement we change the column name from iValues to iValues1.

mysql&gt; ALTER TABLE TestTable MODIFY COLUMN iValues1 MEDIUMINT;

mysql&gt; DESCRIBE TestTable;
+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| Id       | int(11)      | NO   | PRI | NULL    |       |
| iValues1 | mediumint(9) | YES  |     | NULL    |       |
+----------+--------------+------+-----+---------+-------+

We use the above SQL statement to modify the column definition. We change the column datatype from INTEGER to MEDIUMINTEGER.

mysql&gt; ALTER TABLE TestTable DROP COLUMN iValues1;

mysql&gt; DESCRIBE TestTable;
+-------+---------+------+-----+---------+-------+
| Field | Type    | Null | Key | Default | Extra |
+-------+---------+------+-----+---------+-------+
| Id    | int(11) | NO   | PRI | NULL    |       |
+-------+---------+------+-----+---------+-------+

In our last example, we drop an existing column from the table. 

</t>
<t tx="root.20160211145428.1704">Variables

A variable is a symbolic name associated with a value. This value may be changed over time. Variables in MySQL are preceded by the @ character.

mysql&gt; SET @name = 'Jane';

mysql&gt; SELECT @name;
+-------+
| @name |
+-------+
| Jane  |
+-------+

We set a variable and show its contents afterwards. </t>
<t tx="root.20160211145428.1705">Inserting, updating, and deleting data in MySQL

:from: http://zetcode.com/databases/mysqltutorial/datamanipulation/

 In this part of the MySQL tutorial, we will insert, update and delete data from MySQL tables. We will use the INSERT, DELETE and UPDATE statements. These statements are part of the SQL Data Manipulation Language, DML.
Inserting data

The INSERT statement is used to insert data into tables.

We will create a new table, where we will do our examples.

mysql&gt; CREATE TABLE Books(Id INTEGER PRIMARY KEY, Title VARCHAR(100),
    -&gt; Author VARCHAR(60));

We create a new table Books, with Id, Title and Author columns.

mysql&gt; INSERT INTO Books(Id, Title, Author) VALUES(1, 'War and Peace', 
    -&gt; 'Leo Tolstoy');

This is the classic INSERT SQL statement. We have specified all column names after the table name and all values after the VALUES keyword. We add our first row into the table.

mysql&gt; SELECT * FROM Books;
+----+---------------+-------------+
| Id | Title         | Author      |
+----+---------------+-------------+
|  1 | War and Peace | Leo Tolstoy |
+----+---------------+-------------+

We have inserted our first row into the Books table.

mysql&gt; INSERT INTO Books(Title, Author) VALUES ('The Brothers Karamazov',
    -&gt; 'Fyodor Dostoyevsky');

We add a new title into the Books table. We have omitted the Id column. The Id column has AUTO_INCREMENT attribute. This means that MySQL will increase the Id column automatically. The value by which the AUTO_INCREMENT column is increased is controlled by auto_increment_increment system variable. By default it is 1.

mysql&gt; SELECT * FROM Books;
+----+------------------------+--------------------+
| Id | Title                  | Author             |
+----+------------------------+--------------------+
|  1 | War and Peace          | Leo Tolstoy        |
|  2 | The Brothers Karamazov | Fyodor Dostoyevsky |
+----+------------------------+--------------------+

Here is what we have in the Books table.

mysql&gt; INSERT INTO Books VALUES(3, 'Crime and Punishment',
    -&gt; 'Fyodor Dostoyevsky');

In this SQL statement, we did not specify any column names after the table name. In such a case, we have to supply all values.

mysql&gt; REPLACE INTO Books VALUES(3, 'Paradise Lost', 'John Milton');
Query OK, 2 rows affected (0.00 sec)

The REPLACE statement is a MySQL extension to the SQL standard. It inserts a new row or replaces the old row if it collides with an existing row. In our table, there is a row with Id=3. So our previous statement replaces it with a new row. There is a message that two rows were affected. One row was deleted and one was inserted.

mysql&gt; SELECT * FROM Books WHERE Id=3;
+----+---------------+-------------+
| Id | Title         | Author      |
+----+---------------+-------------+
|  3 | Paradise Lost | John Milton |
+----+---------------+-------------+

This is what we have now in the third column.

We can use the INSERT and SELECT statements together in one statement.

mysql&gt; CREATE TABLE Books2(Id INTEGER PRIMARY KEY AUTO_INCREMENT, 
    -&gt; Title VARCHAR(100), Author VARCHAR(60)) type=MEMORY;

First, we create a temporary table called Books2 in memory.

mysql&gt; INSERT INTO Books2 SELECT * FROM Books;
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

Here we insert all data into the Books2 that we select from the Books table.

mysql&gt; SELECT * FROM Books2;
+----+------------------------+--------------------+
| Id | Title                  | Author             |
+----+------------------------+--------------------+
|  1 | War and Peace          | Leo Tolstoy        |
|  2 | The Brothers Karamazov | Fyodor Dostoyevsky |
|  3 | Paradise Lost          | John Milton        |
+----+------------------------+--------------------+

We verify it. All OK.

mysql&gt; INSERT INTO Books(Title, Author) VALUES ('The Insulted and Humiliated',
    -&gt; 'Fyodor Dostoyevsky'), ('Cousin Bette', 'Honore de Balzac');
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

We can insert more than one row into the table with the INSERT statement. Here we show how.

We can insert data from a file on the filesystem. First, we dump data from the Books table in a books.csv file.

mysql&gt; SELECT * INTO OUTFILE '/tmp/books.csv'
    -&gt; FIELDS TERMINATED BY ','
    -&gt; LINES TERMINATED BY '\n'
    -&gt; FROM Books;

We write data from the Books table into the books.csv file. The data will be in a CSV format.

$ cat /tmp/books.csv 
1,War and Peace,Leo Tolstoy
2,The Brothers Karamazov,Fyodor Dostoyevsky
3,Paradise Lost,John Milton
4,The Insulted and Humiliated,Fyodor Dostoyevsky
5,Cousin Bette,Honore de Balzac

We show the contents of the books.csv file.

mysql&gt; TRUNCATE Books;
Query OK, 0 rows affected (0.00 sec)

mysql&gt; SELECT * FROM Books;
Empty set (0.00 sec)

We delete all data from the table.

mysql&gt; LOAD DATA INFILE '/tmp/books.csv'    
    -&gt; INTO TABLE Books    
    -&gt; FIELDS TERMINATED BY ','    
    -&gt; LINES TERMINATED BY '\n';

We use the LOAD DATA INFILE syntax to populate the Books table from the books.csv file.

mysql&gt; SELECT * FROM Books;
+----+-----------------------------+--------------------+
| Id | Title                       | Author             |
+----+-----------------------------+--------------------+
|  1 | War and Peace               | Leo Tolstoy        |
|  2 | The Brothers Karamazov      | Fyodor Dostoyevsky |
|  3 | Paradise Lost               | John Milton        |
|  4 | The Insulted and Humiliated | Fyodor Dostoyevsky |
|  5 | Cousin Bette                | Honore de Balzac   |
+----+-----------------------------+--------------------+

All OK.

We can load data from XML files as well. First, we write data from the Books table into an XML file.

$ mysql -uroot -p --xml -e 'SELECT * FROM mydb.Books' &gt; books.xml

The mysql monitor has an --xml option, which enables us to dump data in XML format. The -e option executes a statement and quits the monitor.

$ cat books.xml 
&lt;?xml version="1.0"?&gt;

&lt;resultset statement="SELECT * FROM mydb.Books
" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"&gt;
  &lt;row&gt;
    &lt;field name="Id"&gt;1&lt;/field&gt;
    &lt;field name="Title"&gt;War and Peace&lt;/field&gt;
    &lt;field name="Author"&gt;Leo Tolstoy&lt;/field&gt;
  &lt;/row&gt;

  &lt;row&gt;
    &lt;field name="Id"&gt;2&lt;/field&gt;
    &lt;field name="Title"&gt;The Brothers Karamazov&lt;/field&gt;
    &lt;field name="Author"&gt;Fyodor Dostoyevsky&lt;/field&gt;
  &lt;/row&gt;

  &lt;row&gt;
    &lt;field name="Id"&gt;3&lt;/field&gt;
    &lt;field name="Title"&gt;Paradise Lost&lt;/field&gt;
    &lt;field name="Author"&gt;John Milton&lt;/field&gt;
  &lt;/row&gt;

  &lt;row&gt;
    &lt;field name="Id"&gt;4&lt;/field&gt;
    &lt;field name="Title"&gt;The Insulted and Humiliated&lt;/field&gt;
    &lt;field name="Author"&gt;Fyodor Dostoyevsky&lt;/field&gt;
  &lt;/row&gt;

  &lt;row&gt;
    &lt;field name="Id"&gt;5&lt;/field&gt;
    &lt;field name="Title"&gt;Cousin Bette&lt;/field&gt;
    &lt;field name="Author"&gt;Honore de Balzac&lt;/field&gt;
  &lt;/row&gt;
&lt;/resultset&gt;

This is our XML file.

mysql&gt; LOAD XML INFILE '/home/vronskij/programming/mysql/books.xml' INTO TABLE Books;

We load data from the XML file. Note that LOAD XML statement is available for MySQL 5.5 and newer.
Deleting data

In MySQL, we can delete data using the DELETE and TRUNCATE statements. The TRUNCATE statement is a MySQL extension to the SQL specification. First, we are going to delete one row from a table. We will use the Books2 table that we have created previously.

mysql&gt; DELETE FROM Books2 WHERE Id=1;

We delete a row with Id=1.

mysql&gt; SELECT * FROM Books2;
+----+------------------------+--------------------+
| Id | Title                  | Author             |
+----+------------------------+--------------------+
|  2 | The Brothers Karamazov | Fyodor Dostoyevsky |
|  3 | Paradise Lost          | John Milton        |
+----+------------------------+--------------------+

We verify the data.

mysql&gt; DELETE FROM Books2;
mysql&gt; TRUNCATE Books2;

These two SQL statements delete all data in the table.
Updating data

The UPDATE statement is used to change the value of columns in selected rows of a table.

mysql&gt; SELECT * FROM Books;
+----+-----------------------------+--------------------+
| Id | Title                       | Author             |
+----+-----------------------------+--------------------+
|  1 | War and Peace               | Leo Tolstoy        |
|  2 | The Brothers Karamazov      | Fyodor Dostoyevsky |
|  3 | Paradise Lost               | John Milton        |
|  4 | The Insulted and Humiliated | Fyodor Dostoyevsky |
|  5 | Cousin Bette                | Honore de Balzac   |
+----+-----------------------------+--------------------+

We recreate the table Books. These are the rows.

Say we wanted to change 'Leo Tolstoy' to 'Lev Nikolayevich Tolstoy' table. The following statement shows, how to accomplish this.

mysql&gt; UPDATE Books SET Author='Lev Nikolayevich Tolstoy'
    -&gt; WHERE Id=1;

The SQL statement sets the author column to 'Lev Nikolayevich Tolstoy' for the column with Id=1.

mysql&gt; SELECT * FROM Books WHERE Id=1;
+----+---------------+--------------------------+
| Id | Title         | Author                   |
+----+---------------+--------------------------+
|  1 | War and Peace | Lev Nikolayevich Tolstoy |
+----+---------------+--------------------------+

The row is correctly updated. </t>
<t tx="root.20160211145428.1706">The SELECT statement in MySQL

:from: http://zetcode.com/databases/mysqltutorial/select/

 This part of the MySQL tutorial will be covering the SELECT statement understood by the MySQL in detail.
Retrieving data

The following SQL statement is one of the most common ones. It is also one of the most expensive ones.

mysql&gt; SELECT * FROM Cars;
+----+------------+--------+
| Id | Name       | Cost   |
+----+------------+--------+
|  1 | Audi       |  52642 |
|  2 | Mercedes   |  57127 |
|  3 | Skoda      |   9000 |
|  4 | Volvo      |  29000 |
|  5 | Bentley    | 350000 |
|  6 | Citroen    |  21000 |
|  7 | Hummer     |  41400 |
|  8 | Volkswagen |  21600 |
+----+------------+--------+
8 rows in set (0.00 sec)

Here we retrieve all data from the Cars table.
Selecting specific columns

We can use the SELECT statement to retrieve specific columns. The column names follow the SELECT word.

mysql&gt; SELECT Name, Cost FROM Cars;
+------------+--------+
| Name       | Cost   |
+------------+--------+
| Audi       |  52642 |
| Mercedes   |  57127 |
| Skoda      |   9000 |
| Volvo      |  29000 |
| Bentley    | 350000 |
| Citroen    |  21000 |
| Hummer     |  41400 |
| Volkswagen |  21600 |
+------------+--------+
8 rows in set (0.00 sec) 

We retrieve the Name and the Cost columns. The column names are separated by commas.
Renaming column names

We can rename the column names of the returned result set. For this, we use the AS clause.

mysql&gt; SELECT Name, Cost AS Price FROM Cars;
+------------+--------+
| Name       | Price  |
+------------+--------+
| Audi       |  52642 |
| Mercedes   |  57127 |
| Skoda      |   9000 |
| Volvo      |  29000 |
| Bentley    | 350000 |
| Citroen    |  21000 |
| Hummer     |  41400 |
| Volkswagen |  21600 |
+------------+--------+
8 rows in set (0.00 sec)

Say we wanted to name the column price rather than cost. With the above SQL statement, we have accomplished this.
Limiting data output

As we mentioned above, retrieving all data is expensive when dealing with large amounts of data. We can use the LIMIT clause to limit the data amount returned by the statement.

mysql&gt; SELECT * FROM Cars LIMIT 4;
+----+----------+-------+
| Id | Name     | Cost  |
+----+----------+-------+
|  1 | Audi     | 52642 |
|  2 | Mercedes | 57127 |
|  3 | Skoda    |  9000 |
|  4 | Volvo    | 29000 |
+----+----------+-------+
4 rows in set (0.00 sec) 

The LIMIT clause limits the number of rows returned to 4.

With two arguments, the LIMIT returns rows beginning from an offset value.

mysql&gt; SELECT * FROM Cars LIMIT 2, 4;
+----+---------+--------+
| Id | Name    | Cost   |
+----+---------+--------+
|  3 | Skoda   |   9000 |
|  4 | Volvo   |  29000 |
|  5 | Bentley | 350000 |
|  6 | Citroen |  21000 |
+----+---------+--------+
4 rows in set (0.00 sec)   

The first value is the offset and the second is the number of rows to be returned. Here we select all data from max four rows, and we begin with the third row.

mysql&gt; SELECT * FROM Cars LIMIT 4 OFFSET 2;
+----+---------+--------+
| Id | Name    | Cost   |
+----+---------+--------+
|  3 | Skoda   |   9000 |
|  4 | Volvo   |  29000 |
|  5 | Bentley | 350000 |
|  6 | Citroen |  21000 |
+----+---------+--------+
4 rows in set (0.00 sec)

To be compatible with PostgreSQL database, MySQL has also the OFFSET keyword. The above code is equivalent to the previous example.
Ordering data

We use the ORDER BY clause to sort the returned data set. The ORDER BY clause is followed by the column on which we do the sorting. The ASC keyword sorts the data in ascending order, the DESC in descending order.

mysql&gt; SELECT Name, Cost FROM Cars ORDER BY Cost DESC;
+------------+--------+
| Name       | Cost   |
+------------+--------+
| Bentley    | 350000 |
| Mercedes   |  57127 |
| Audi       |  52642 |
| Hummer     |  41400 |
| Volvo      |  29000 |
| Volkswagen |  21600 |
| Citroen    |  21000 |
| Skoda      |   9000 |
+------------+--------+
8 rows in set (0.00 sec)

In the above SQL statement, we select name, cost columns from the Cars table and sort it by the cost of the cars in descending order. So the most expensive cars come first.
Selecting specific rows with the WHERE clause

In the following examples, we are going to use the Orders table.

mysql&gt; SELECT * FROM Orders;
+----+------------+------------+
| Id | OrderPrice | Customer   |
+----+------------+------------+
|  1 |       1200 | Williamson |
|  2 |        200 | Robertson  |
|  3 |         40 | Robertson  |
|  4 |       1640 | Smith      |
|  5 |        100 | Robertson  |
|  6 |         50 | Williamson |
|  7 |        150 | Smith      |
|  8 |        250 | Smith      |
|  9 |        840 | Brown      |
| 10 |        440 | Black      |
| 11 |         20 | Brown      |
+----+------------+------------+
11 rows in set (0.00 sec)

Here we see all the data from the Orders table.

Next, we want to select a specific row.

mysql&gt; SELECT * FROM Orders WHERE Id=6;
+----+------------+------------+
| Id | OrderPrice | Customer   |
+----+------------+------------+
|  6 |         50 | Williamson |
+----+------------+------------+
1 row in set (0.00 sec)

The above SQL statement selects a row which has Id 6.

mysql&gt; SELECT * FROM Orders WHERE Customer="Smith";
+----+------------+----------+
| Id | OrderPrice | Customer |
+----+------------+----------+
|  4 |       1640 | Smith    |
|  7 |        150 | Smith    |
|  8 |        250 | Smith    |
+----+------------+----------+
3 rows in set (0.00 sec)

The above SQL statement selects all orders created by Smith customer.

We can use the LIKE keyword to look for a specific pattern in the data.

mysql&gt; SELECT * FROM Orders WHERE Customer LIKE "B%";
+----+------------+----------+
| Id | OrderPrice | Customer |
+----+------------+----------+
|  9 |        840 | Brown    |
| 10 |        440 | Black    |
| 11 |         20 | Brown    |
+----+------------+----------+
3 rows in set (0.00 sec)

This SQL statement selects all orders from customers whose names begin with B character.
Removing duplicate items

The DISTINCT keyword is used to select only unique items from the result set.

mysql&gt; SELECT Customer FROM Orders WHERE Customer LIKE 'B%';
+----------+
| Customer |
+----------+
| Brown    |
| Black    |
| Brown    |
+----------+
3 rows in set (0.00 sec)

This time we have selected customers whose names begin with B character. We can see that Brown is mentioned twice. To remove duplicates, we use the DISTINCT keyword.

mysql&gt; SELECT DISTINCT Customer FROM Orders WHERE Customer LIKE 'B%';
+----------+
| Customer |
+----------+
| Brown    |
| Black    |
+----------+
2 rows in set (0.00 sec)

This is the correct solution.

Say we wanted to figure out, how many orders were placed by Brown customer. We would utilize the COUNT() function.

mysql&gt; SELECT COUNT(Customer) AS "Orders by Brown" FROM Orders WHERE Customer="Brown";
+-----------------+
| Orders by Brown |
+-----------------+
|               2 |
+-----------------+
1 row in set (0.00 sec)

The customer has placed two orders.
Grouping data

The GROUP BY clause is used to combine database records with identical values into a single record. It is often used with the aggregation functions.

Say we wanted to find out, the sum of each customers' orders.

mysql&gt; SELECT SUM(OrderPrice) AS Total, Customer FROM Orders GROUP BY Customer;
+-------+------------+
| Total | Customer   |
+-------+------------+
|   440 | Black      |
|   860 | Brown      |
|   340 | Robertson  |
|  2040 | Smith      |
|  1250 | Williamson |
+-------+------------+
5 rows in set (0.00 sec)

The SUM() keyword returns the total sum of a numeric column. The GROUP BY clause divides the total sum among the customers. So we can see that Black has ordered items for 440 or Smith for 2040.

We cannot use the WHERE clause when aggregate functions were used. We use the HAVING clause instead.

mysql&gt; SELECT SUM(OrderPrice) AS Total, Customer FROM Orders
    -&gt; GROUP BY Customer HAVING SUM(OrderPrice)&gt;1000;
+-------+------------+
| Total | Customer   |
+-------+------------+
|  2040 | Smith      |
|  1250 | Williamson |
+-------+------------+
2 rows in set (0.00 sec)

The above SQL statement selects customers whose total orders where greater than 1000 units.
Selecting data into a file

The SELECT statement can be used to write data from tables to a file.

mysql&gt; SELECT * INTO OUTFILE '/tmp/cars.txt'
    -&gt; FIELDS TERMINATED BY ','
    -&gt; LINES TERMINATED BY '\n'
    -&gt; FROM Cars;
Query OK, 8 rows affected (0.00 sec)

We write data from the Cars table into a cars.txt file. The output file is a CSV (Comma Separated Values) file. Note that this operation is error prone, we can easily run into permission denied errors.

$ cat /tmp/cars.txt 
1,Audi,52642
2,Mercedes,57127
3,Skoda,9000
4,Volvo,29000
5,Bentley,350000
6,Citroen,21000
7,Hummer,41400
8,Volkswagen,21600

We can do the opposite operation; load the data from the file into the table.

mysql&gt; DELETE FROM Cars;
Query OK, 8 rows affected (0.00 sec)

mysql&gt; SELECT * FROM Cars;
Empty set (0.00 sec)

We delete all the rows from the Cars table.

mysql&gt; LOAD DATA INFILE '/tmp/cars.txt' 
    -&gt; INTO TABLE Cars
    -&gt; FIELDS TERMINATED BY ','
    -&gt; LINES TERMINATED BY '\n';
Query OK, 8 rows affected (0.00 sec)
Records: 8  Deleted: 0  Skipped: 0  Warnings: 0

mysql&gt; SELECT *  FROM Cars;
+----+------------+--------+
| Id | Name       | Cost   |
+----+------------+--------+
|  1 | Audi       |  52642 |
|  2 | Mercedes   |  57127 |
|  3 | Skoda      |   9000 |
|  4 | Volvo      |  29000 |
|  5 | Bentley    | 350000 |
|  6 | Citroen    |  21000 |
|  7 | Hummer     |  41400 |
|  8 | Volkswagen |  21600 |
+----+------------+--------+
8 rows in set (0.00 sec)

We use the LOAD DATA INFILE statement to load the data back into the table. We verify that the data was loaded correctly. </t>
<t tx="root.20160211145428.1707">MySQL subqueries

:from: http://zetcode.com/databases/mysqltutorial/subqueries/


 In this part of the MySQL tutorial, we will mention subqueries in MySQL.

A subquery is a query in a query. It is also called an inner query or a nested query. A subquery can be used anywhere an expression is allowed. It is a query expression enclosed in parentheses. Subqueries can be used with SELECT, INSERT, UPDATE, or DELETE statements.

There is more than one way to execute an SQL task. Many subqueries can be replaced by SQL joins. SQL joins are usually faster.

In this chapter, we will be using the following tables:

mysql&gt; SELECT * FROM Cars;
+----+------------+--------+
| Id | Name       | Cost   |
+----+------------+--------+
|  1 | Audi       |  52642 |
|  2 | Mercedes   |  57127 |
|  3 | Skoda      |   9000 |
|  4 | Volvo      |  29000 |
|  5 | Bentley    | 350000 |
|  6 | Citroen    |  21000 |
|  7 | Hummer     |  41400 |
|  8 | Volkswagen |  21600 |
+----+------------+--------+

The data from the Cars table.

mysql&gt; SELECT * FROM Customers; SELECT * FROM Reservations;
+------------+-------------+
| CustomerId | Name        |
+------------+-------------+
|          1 | Paul Novak  |
|          2 | Terry Neils |
|          3 | Jack Fonda  |
|          4 | Tom Willis  |
+------------+-------------+
4 rows in set (0.00 sec)

+----+------------+------------+
| Id | CustomerId | Day        |
+----+------------+------------+
|  1 |          1 | 2009-11-22 |
|  2 |          2 | 2009-11-28 |
|  3 |          2 | 2009-11-29 |
|  4 |          1 | 2009-11-29 |
|  5 |          3 | 2009-12-02 |
+----+------------+------------+
5 rows in set (0.00 sec)

We recapitulate what we have in the Customers and Reservations tables. Subqueries are often performed on tables, which have some relationship.
Subquery with the INSERT statement

We want to create a copy of the Cars table. Into another table called Cars2. We will create a subquery for this.

mysql&gt; CREATE TABLE Cars2(Id INT NOT NULL PRIMARY KEY, 
    -&gt; Name VARCHAR(50) NOT NULL, Cost INT NOT NULL);

We create a new Cars2 table with the same columns and datatypes as the Cars table. To find out how a table was created, we can use the SHOW CREATE TABLE statement.

mysql&gt; INSERT INTO Cars2 SELECT * FROM Cars;

This is a simple subquery. We insert all rows from the Cars table into the Cars2 table.

mysql&gt; SELECT * FROM Cars2;
+----+------------+--------+
| Id | Name       | Cost   |
+----+------------+--------+
|  1 | Audi       |  52642 |
|  2 | Mercedes   |  57127 |
|  3 | Skoda      |   9000 |
|  4 | Volvo      |  29000 |
|  5 | Bentley    | 350000 |
|  6 | Citroen    |  21000 |
|  7 | Hummer     |  41400 |
|  8 | Volkswagen |  21600 |
+----+------------+--------+

The data was copied to a new Cars2 table.
Scalar subqueries

A scalar subquery returns a single value.

mysql&gt; SELECT Name FROM Customers WHERE 
    -&gt; CustomerId=(SELECT CustomerId FROM Reservations WHERE Id=5);
+------------+
| Name       |
+------------+
| Jack Fonda |
+------------+

The query enclosed in parentheses is the subquery. It returns one single scalar value. The returned value is then used in the outer query. In this scalar subquery, we return the name of the customer from the Customers table, whose reservation has Id equal to 5 in the Reservations table.
Table subqueries

A table subquery returns a result table of zero or more rows.

mysql&gt; SELECT Name FROM Customers WHERE CustomerId IN    
    -&gt; (SELECT DISTINCT CustomerId FROM Reservations);
+-------------+
| Name        |
+-------------+
| Paul Novak  |
| Terry Neils |
| Jack Fonda  |
+-------------+

The above query returns the names of the customers, who made some reservations. The inner query returns customer Ids from the Reservations table. We use the IN predicate to select those names of customers, who have their CustomerId returned from the inner select query.

mysql&gt; SELECT DISTINCT Name FROM Customers JOIN Reservations
    -&gt; ON Customers.CustomerId=Reservations.CustomerId;
+-------------+
| Name        |
+-------------+
| Paul Novak  |
| Terry Neils |
| Jack Fonda  |
+-------------+

The previous subquery can be rewritten using SQL join.
Correlated subqueries

A correlated subquery is a subquery that uses values from the outer query in its WHERE clause. The subquery is evaluated once for each row processed by the outer query.

mysql&gt; SELECT Name FROM Cars WHERE Cost &lt;
    -&gt; (SELECT AVG(Cost) FROM Cars);
+------------+
| Name       |
+------------+
| Audi       |
| Mercedes   |
| Skoda      |
| Volvo      |
| Citroen    |
| Hummer     |
| Volkswagen |
+------------+

In the above correlated subquery, we return all cars that cost below the average price of all cars in the table.
Subqueries with EXISTS, NOT EXISTS

If a subquery returns any values, then the predicate EXISTS returns TRUE, and NOT EXISTS FALSE.

mysql&gt; SELECT Name FROM Customers WHERE EXISTS
    -&gt; (SELECT * FROM Reservations WHERE
    -&gt; Customers.CustomerId=Reservations.CustomerId);
+-------------+
| Name        |
+-------------+
| Paul Novak  |
| Terry Neils |
| Jack Fonda  |
+-------------+

In the above SQL statement we select all customers' names, which have an entry in the Reservations table.

mysql&gt; SELECT Name FROM Customers WHERE NOT EXISTS    
    -&gt; (SELECT * FROM Reservations WHERE 
    -&gt; Customers.CustomerId=Reservations.CustomerId);
+------------+
| Name       |
+------------+
| Tom Willis |
+------------+

In this query, we return all customers that do not have an entry in the Reservations table. Both SQL queries are correlated queries.

This part of the MySQL tutorial was dedicated to MySQL subqueries. 

</t>
<t tx="root.20160211145428.1708">
MySQL constraints

:from: http://zetcode.com/databases/mysqltutorial/constraints/

 In this part of the MySQL tutorial, we will work with constraints.

Constraints are placed on columns or tables. They limit the data that can be inserted into tables.

We have the following constraints:

    NOT NULL
    UNIQUE
    PRIMARY KEY
    FOREIGN KEY
    ENUM
    SET

Other databases also have the CHECK constraint, which places a condition on a valid data. MySQL parses this constraint, but it is not enforced.
NOT NULL constraint

A column with a NOT NULL constraint, cannot have NULL values.

mysql&gt; CREATE TABLE People(Id INTEGER, LastName TEXT NOT NULL,
    -&gt;                     FirstName TEXT NOT NULL, City VARCHAR(55));
Query OK, 0 rows affected (0.07 sec)

We create two columns with NOT NULL constraints.

mysql&gt; INSERT INTO People VALUES(1, 'Hanks', 'Robert', 'New York');
Query OK, 1 row affected (0.00 sec)

mysql&gt; INSERT INTO People VALUES(1, NULL, 'Marianne', 'Chicago');
ERROR 1048 (23000): Column 'LastName' cannot be null

The first SELECT statement is executed OK, the second one fails. The SQL error says, the LastName column may not be null.
UNIQUE constraint

The UNIQUE constraint ensures that all data are unique in a column.

mysql&gt; CREATE TABLE Brands(Id INTEGER, BrandName VARCHAR(30) UNIQUE);
Query OK, 0 rows affected (0.08 sec)

Here we create a table Brands. The BrandName column is set to be UNIQUE. There cannot be two brands with the same name.

mysql&gt; INSERT INTO Brands VALUES(1, 'Coca Cola');
Query OK, 1 row affected (0.03 sec)

mysql&gt; INSERT INTO Brands VALUES(2, 'Pepsi');
Query OK, 1 row affected (0.00 sec)

mysql&gt; INSERT INTO Brands VALUES(3, 'Pepsi');
ERROR 1062 (23000): Duplicate entry 'Pepsi' for key 'BrandName'

We get an SQL error Duplicate entry 'Pepsi' for key 'BrandName'. There can only be one Pepsi brand.

Note that a PRIMARY KEY constraint automatically has a UNIQUE constraint defined on it.
Primary key

The PRIMARY KEY constraint uniquely identifies each record in a database table. It is a special case of unique keys. Primary keys cannot be NULL, unique keys can be. There can be more UNIQUE columns, but only one primary key in a table. Primary keys are important when designing the database tables. Primary keys are unique ids. We use them to refer to table rows. Primary keys become foreign keys in other tables, when creating relations among tables.

mysql&gt; DROP TABLE Brands;
mysql&gt; CREATE TABLE Brands(Id INTEGER PRIMARY KEY, BrandName VARCHAR(30) UNIQUE);

The Id column of the Brands table becomes a primary key.

mysql&gt; DESCRIBE Brands;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| Id        | int(11)     | NO   | PRI | NULL    |       |
| BrandName | varchar(30) | YES  | UNI | NULL    |       |
+-----------+-------------+------+-----+---------+-------+

The DESCRIBE statement shows information about the columns in a table. We can see that the Id column has a PRIMARY KEY defined and the BrandName has UNIQUE constraint set. The primary key is used to uniquely identify the row in a table, when dealing with a specific table. The unique key enforces that all data in a column are not duplicate.
Foreign key

A FOREIGN KEY in one table points to a PRIMARY KEY in another table. It is a referential constraint between two tables. The foreign key identifies a column or a set of columns in one (referencing) table that refers to a column or set of columns in another (referenced) table.

We will be demonstrating this constraint on two tables: Authors and Books.

mysql&gt; CREATE TABLE Authors(AuthorId INTEGER PRIMARY KEY, Name VARCHAR(70))
    -&gt; type=InnoDB;

Here we create the Authors table. In MySQL, the referencing and the referenced tables must be of InnoDB or BDB storage engines. In the MyISAM storage engines the foreign keys are parsed, but they are not enforced.

mysql&gt; CREATE TABLE Books(BookId INTEGER PRIMARY KEY, Title VARCHAR(50),
    -&gt; AuthorId INTEGER, FOREIGN KEY(AuthorId) REFERENCES Authors(AuthorId))
    -&gt; type=InnoDB;

We create the Books table. Here we have an AuthorId column name, which acts as a foreign key. It references to the primary key of the Authors table.

What would foreign key enforcement mean in our example? We could not insert a row into the Books table with an AuthorId, which is not present in Authors book.
ENUM constraint

An ENUM is a string object with a value chosen from a list of permitted values. They are enumerated explicitly in the column specification at table creation time.

mysql&gt; CREATE TABLE Shops(Id INTEGER, Name VARCHAR(55), 
    -&gt; Quality ENUM('High', 'Average', 'Low'));

We have a Shops table. The table has an Id, Name, and Quality columns defined. The Quality column is an ENUM. It permits to have one of three specified values: High, Average, or Low.

mysql&gt; INSERT INTO Shops VALUES(1, 'Boneys', 'High');
mysql&gt; INSERT INTO Shops VALUES(2, 'AC River', 'Average');
mysql&gt; INSERT INTO Shops VALUES(3, 'AT 34', '**');
mysql&gt; SELECT * FROM Shops;
+------+----------+---------+
| Id   | Name     | Quality |
+------+----------+---------+
|    1 | Boneys   | High    |
|    2 | AC River | Average |
|    3 | AT 34    |         |
+------+----------+---------+

In the first two statements, we have inserted two rows. In the third case, the value is not available in the ENUM. In this case an empty string is inserted.
SET constraint

A SET can have zero or more values. Each of the values must be chosen from a list of permitted values.

mysql&gt; CREATE TABLE Students(Id INTEGER, Name VARCHAR(55), 
    -&gt; Certificates SET('A1', 'A2', 'B1', 'C1')); 

We have a Students table. In this table, we have a Certificates column. Each student can have 0, 1 or more of these certificates. This is different from the ENUM constraint, where you can have only one distinct value from the list of permitted values.

mysql&gt; INSERT INTO Students VALUES(1, 'Paul', 'A1,B1');
mysql&gt; INSERT INTO Students VALUES(2, 'Jane', 'A1,B1,A2');
mysql&gt; INSERT INTO Students VALUES(3, 'Mark', 'A1,A2,D1,D2');
mysql&gt; SELECT * FROM Students;
+------+------+--------------+
| Id   | Name | Certificates |
+------+------+--------------+
|    1 | Paul | A1,B1        |
|    2 | Jane | A1,A2,B1     |
|    3 | Mark | A1,A2        |
+------+------+--------------+

Paul has two certificates, Jane has three, Mark has four, but only two of them are recognised, so only the first two were written to the table. The certificates are separated by commas. No spaces are allowed.

In this part of the MySQL tutorial, we have covered constraints supported by MySQL. 

</t>
<t tx="root.20160211145428.1709">
Exporting and importing data in MySQL

:from: http://zetcode.com/databases/mysqltutorial/exportimport/

 In this part of the MySQL tutorial, we will be exporting data from MySQL database and importing data back.
Simple data export

In our first example, we will save data in a text file.

mysql&gt; SELECT * FROM Cars INTO OUTFILE '/tmp/cars';
Query OK, 8 rows affected (0.00 sec)

We select all rows (8) from the Cars table into the cars file located in the /tmp directory. We need to have permissions to write to that directory.

$ cat /tmp/cars
1       Audi    52642
2       Mercedes        57127
3       Skoda   9000
4       Volvo   29000
5       Bentley 350000
6       Citroen 21000
7       Hummer  41400
8       Volkswagen      21600

We show the contents of the file.

mysql&gt; DELETE FROM Cars;

mysql&gt; LOAD DATA INFILE '/tmp/cars' INTO TABLE Cars;

In the first statement we delete all rows from the table. In the second statement we load all data from the text file into the Cars table.

mysql&gt; SELECT * FROM Cars INTO OUTFILE '/tmp/cars.csv'
    -&gt; FIELDS TERMINATED BY ',';

In the above SQL statement, we dump all data from the Cars table into a cars.csv file. The FIELDS TERMINATED BY clause controls, how the data will be terminated in the text file. We have chosen a comma character. The CSV stands for Comma Separated Values and it is a very common and very portable file format. It can be imported by numerous other applications like OpenOffice, other databases etc.

$ cat /tmp/cars.csv 
1,Audi,52642
2,Mercedes,57127
3,Skoda,9000
4,Volvo,29000
5,Bentley,350000
6,Citroen,21000
7,Hummer,41400
8,Volkswagen,21600

This is the contents of the cars.csv file.

mysql&gt; DELETE FROM Cars;

mysql&gt; LOAD DATA INFILE '/tmp/cars.csv' INTO TABLE Cars
    -&gt; FIELDS TERMINATED BY ',';

mysql&gt; SELECT * FROM Cars;
+----+------------+--------+
| Id | Name       | Cost   |
+----+------------+--------+
|  1 | Audi       |  52642 |
|  2 | Mercedes   |  57127 |
|  3 | Skoda      |   9000 |
|  4 | Volvo      |  29000 |
|  5 | Bentley    | 350000 |
|  6 | Citroen    |  21000 |
|  7 | Hummer     |  41400 |
|  8 | Volkswagen |  21600 |
+----+------------+--------+

We delete all the data and restore it from the cars.csv file.
Exporting to XML files

It is possible to export and import XML data using the mysql monitor.

$ mysql -uroot -p --xml -e 'SELECT * FROM mydb.Cars' &gt; /tmp/cars.xml

The mysql monitor has an --xml option, which enables us to dump data in XML format. The -e option executes a statement and quits the monitor.

$ cat /tmp/cars.xml 
&lt;?xml version="1.0"?&gt;

&lt;resultset statement="SELECT * FROM mydb.Cars
" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"&gt;
  &lt;row&gt;
        &lt;field name="Id"&gt;1&lt;/field&gt;
        &lt;field name="Name"&gt;Audi&lt;/field&gt;
        &lt;field name="Cost"&gt;52642&lt;/field&gt;
  &lt;/row&gt;

  &lt;row&gt;
        &lt;field name="Id"&gt;2&lt;/field&gt;
        &lt;field name="Name"&gt;Mercedes&lt;/field&gt;
        &lt;field name="Cost"&gt;57127&lt;/field&gt;
  &lt;/row&gt;

  &lt;row&gt;
        &lt;field name="Id"&gt;3&lt;/field&gt;
        &lt;field name="Name"&gt;Skoda&lt;/field&gt;
        &lt;field name="Cost"&gt;9000&lt;/field&gt;
  &lt;/row&gt;

  &lt;row&gt;
        &lt;field name="Id"&gt;4&lt;/field&gt;
        &lt;field name="Name"&gt;Volvo&lt;/field&gt;
        &lt;field name="Cost"&gt;29000&lt;/field&gt;
  &lt;/row&gt;

  &lt;row&gt;
        &lt;field name="Id"&gt;5&lt;/field&gt;
        &lt;field name="Name"&gt;Bentley&lt;/field&gt;
        &lt;field name="Cost"&gt;350000&lt;/field&gt;
  &lt;/row&gt;

  &lt;row&gt;
        &lt;field name="Id"&gt;6&lt;/field&gt;
        &lt;field name="Name"&gt;Citroen&lt;/field&gt;
        &lt;field name="Cost"&gt;21000&lt;/field&gt;
  &lt;/row&gt;

  &lt;row&gt;
        &lt;field name="Id"&gt;7&lt;/field&gt;
        &lt;field name="Name"&gt;Hummer&lt;/field&gt;
        &lt;field name="Cost"&gt;41400&lt;/field&gt;
  &lt;/row&gt;

  &lt;row&gt;
        &lt;field name="Id"&gt;8&lt;/field&gt;
        &lt;field name="Name"&gt;Volkswagen&lt;/field&gt;
        &lt;field name="Cost"&gt;21600&lt;/field&gt;
  &lt;/row&gt;
&lt;/resultset&gt;

This is the XML file generated by the mysql monitor.

mysql&gt; TRUNCATE Cars;

mysql&gt; LOAD XML /tmp/cars.xml INTO TABLE Cars;

We truncate the Cars table. We load data from the XML file. Note that LOAD XML statement is available for MySQL 5.5 and newer.
Using mysqldump tool

The mysqldump is a command tool to create backups for MySQL. The word dump is used when we transfer data from one place to another. From a database file to a text file. From a memory to a file. And similar.
Dumping table structures

mysqldump -u root -p --no-data mydb &gt; bkp1.sql

The above command dumps table structures of all tables in the mydb database to the bkq1.sql file. The --no-data option causes that the data is not saved, only the table structures.

--
-- Table structure for table `Cars`
--

DROP TABLE IF EXISTS `Cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cars` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Cost` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

Here we see a portion of the bkp1.sql file. This is the SQL for the creation of the Cars table.
Dumping data only

$ mysqldump -uroot -p --no-create-info mydb &gt; bkp2.sql

This command dumps all data from all tables of the mydb databases. It omits the table structures. The omission of the table structures is caused by the --no-create-info option.

--
-- Dumping data for table `Cars`
--

LOCK TABLES `Cars` WRITE;
/*!40000 ALTER TABLE `Cars` DISABLE KEYS */;
INSERT INTO `Cars` VALUES (1,'Audi',52642),(2,'Mercedes',57127),(3,'Skoda',9000),
(4,'Volvo',29000),(5,'Bentley',350000),(6,'Citroen',21000),
(7,'Hummer',41400),(8,'Volkswagen',21600);
/*!40000 ALTER TABLE `Cars` ENABLE KEYS */;
UNLOCK TABLES;

Here we can see the data for the Cars table.
Dumping the whole database

$ mysqldump -uroot -p mydb &gt; bkp3.sql

This command dumps all tables from the mydb database to the bkp3.sql file.
Restoring data

We show, how to restore the database from the backup SQL files.

mysql&gt; DROP DATABASE mydb;
ERROR 1010 (HY000): Error dropping database (can't rmdir './mydb/', errno: 17)

mysql&gt; SHOW TABLES;
Empty set (0.00 sec)

We drop the mydb database. An error is shown. The tables were dropped but not the database.

$ sudo ls /var/lib/mysql/mydb
cars  cars.txt
$ sudo rm /var/lib/mysql/mydb/cars
$ sudo rm /var/lib/mysql/mydb/cars.txt

The reason is that (in my case) while doing backups, some of the data were written in the mydb directory, in which MySQL stores the mydb database. These two alien files could not be removed, hence the above error. By removing the files the error is fixed.

mysql&gt; DROP DATABASE mydb;
Query OK, 0 rows affected (0.04 sec)

mysql&gt; SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| testdb             |
| world              |
+--------------------+
4 rows in set (0.00 sec)

The mydb database was fully removed.

mysql&gt; CREATE DATABASE mydb;

mysql&gt; USE mydb;

mysql&gt; source bkp3.sql

We create the mydb database. Change to the database. And use the source command to execute the bkp3.sql script. The database is recreated.

mysql&gt; SHOW TABLES;
+----------------+
| Tables_in_mydb |
+----------------+
| AA             |
| Ages           |
| Animals        |
| Authors        |
| BB             |
| Books          |
| Books2         |
| Brands         |
| Cars           |
...

mysql&gt; SELECT * FROM Cars;
+----+------------+--------+
| Id | Name       | Cost   |
+----+------------+--------+
|  1 | Audi       |  52642 |
|  2 | Mercedes   |  57127 |
|  3 | Skoda      |   9000 |
|  4 | Volvo      |  29000 |
|  5 | Bentley    | 350000 |
|  6 | Citroen    |  21000 |
|  7 | Hummer     |  41400 |
|  8 | Volkswagen |  21600 |
+----+------------+--------+

The data is verified.

In this part of the MySQL tutorial, we have shown several ways how we can export and import data in MySQL. 

</t>
<t tx="root.20160211145428.1710">
Joining tables in MySQL

:from: http://zetcode.com/databases/mysqltutorial/joins/

 In this part of the MySQL tutorial, we will join tables in MySQL.

The real power and benefits from relational databases come from joining tables. The SQL JOIN clause combines records from two or more tables in a database. There are basically two types of joins: INNER and OUTER.

In this part of the tutorial, we will work with Customers and Reservations tables.

mysql&gt; SELECT * FROM Customers;
+------------+-------------+
| CustomerId | Name        |
+------------+-------------+
|          1 | Paul Novak  |
|          2 | Terry Neils |
|          3 | Jack Fonda  |
|          4 | Tom Willis  |
+------------+-------------+

These are values from the Customers table.

mysql&gt; SELECT * FROM Reservations;
+----+------------+------------+
| Id | CustomerId | Day        |
+----+------------+------------+
|  1 |          1 | 2009-11-22 |
|  2 |          2 | 2009-11-28 |
|  3 |          2 | 2009-11-29 |
|  4 |          1 | 2009-11-29 |
|  5 |          3 | 2009-12-02 |
+----+------------+------------+

These are values from the Reservations tables.

The Customers and Reservations have both a CustomerId column. It is the relationship column. If it has the same name in both tables, we can use USING (CustomerId) syntax. If the name differs, say we had CustomerId and CId, we would use the ON Customers.CustomerId = Reservations.CId syntax.
Inner joins

The inner join is the most common type of joins. It is the default join also. The inner join selects only those records from database tables that have matching values. We have three types of INNER JOINS: INNER JOIN, NATURAL INNER JOIN, and CROSS INNER JOIN. The INNER keyword can be omitted.
INNER JOIN

mysql&gt; SELECT Name, Day FROM Customers AS C JOIN Reservations 
    -&gt; AS R ON C.CustomerId=R.CustomerId;
+-------------+------------+
| Name        | Day        |
+-------------+------------+
| Paul Novak  | 2009-11-22 |
| Terry Neils | 2009-11-28 |
| Terry Neils | 2009-11-29 |
| Paul Novak  | 2009-11-29 |
| Jack Fonda  | 2009-12-02 |
+-------------+------------+
5 rows in set (0.00 sec)

In this SELECT statement, we have selected all customers that have made some reservations. Paul Novak and Terry Neils made two reservations. Jack Fonda has made one. Tom Willis is missing, he has not yet made any reservations. Note that we have omitted the INNER keyword.

The statement is equivalent to the following one:

mysql&gt; SELECT Name, Day FROM Customers, Reservations
    -&gt; WHERE Customers.CustomerId=Reservations.CustomerId;
+-------------+------------+
| Name        | Day        |
+-------------+------------+
| Paul Novak  | 2009-11-22 |
| Terry Neils | 2009-11-28 |
| Terry Neils | 2009-11-29 |
| Paul Novak  | 2009-11-29 |
| Jack Fonda  | 2009-12-02 |
+-------------+------------+

We get the same data.
CROSS INNER JOIN

The CROSS INNER JOIN combines all records from one table with all records from another table. This type of join has little practical value. It is also called a Cartesian product of records.

mysql&gt; SELECT Name, Day FROM Customers CROSS JOIN Reservations;
+-------------+------------+
| Name        | Day        |
+-------------+------------+
| Paul Novak  | 2009-11-22 |
| Paul Novak  | 2009-11-28 |
| Paul Novak  | 2009-11-29 |
| Paul Novak  | 2009-11-29 |
| Paul Novak  | 2009-12-02 |
| Terry Neils | 2009-11-22 |
| Terry Neils | 2009-11-28 |
| Terry Neils | 2009-11-29 |
| Terry Neils | 2009-11-29 |
| Terry Neils | 2009-12-02 |
| Jack Fonda  | 2009-11-22 |
...

The same result can be achieved with the following SQL statement:

SELECT Name, Day FROM Customers, Reservations;

Outer joins

An outer join does not require each record in the two joined tables to have a matching record. There are three types of outer joins. Left outer joins, right outer joins, and full outer joins. MySQL does not support full outer joins at the time of the tutorial creation.

As we have already stated above, the inner joins are the most common ones. Outer joins may be useful to find out orphaned records. Is a person a customer if he has not made any reservations? Is a reservation valid if we cannot match it with a customer?
LEFT OUTER JOIN

The LEFT OUTER JOIN returns all values from the left table, even if there is no match with the right table. In such rows, there will be NULL values. In other words, left outer join returns all the values from the left table, plus matched values from the right table. Note that the OUTER keyword can be omitted.

mysql&gt; SELECT Name, Day FROM Customers LEFT JOIN Reservations
    -&gt; ON Customers.CustomerId=Reservations.CustomerId;
+-------------+------------+
| Name        | Day        |
+-------------+------------+
| Paul Novak  | 2009-11-22 |
| Paul Novak  | 2009-11-29 |
| Terry Neils | 2009-11-28 |
| Terry Neils | 2009-11-29 |
| Jack Fonda  | 2009-12-02 |
| Tom Willis  | NULL       |
+-------------+------------+

Here we have all customers with their reservations, plus a customer, who has no reservation. There is NULL value in his row.

We can use the USING keyword to achieve the same result. This is because the relationship column has the same name in both tables. The SQL statement will be less verbose.

mysql&gt; SELECT Name, Day FROM Customers LEFT JOIN Reservations
    -&gt; USING (CustomerId);
+-------------+------------+
| Name        | Day        |
+-------------+------------+
| Paul Novak  | 2009-11-22 |
| Paul Novak  | 2009-11-29 |
| Terry Neils | 2009-11-28 |
| Terry Neils | 2009-11-29 |
| Jack Fonda  | 2009-12-02 |
| Tom Willis  | NULL       |
+-------------+------------+

Same result, with shorter SQL statement.
RIGHT OUTER JOIN

RIGHT OUTER JOIN and RIGHT JOIN are the same. It gives all the records match in both tables and all possibilities of the right table. Orphaned right records show NULL on the left.

mysql&gt; SELECT Name, Day FROM Customers RIGHT JOIN
    -&gt; Reservations USING (CustomerId);
+-------------+------------+
| Name        | Day        |
+-------------+------------+
| Paul Novak  | 2009-11-22 |
| Terry Neils | 2009-11-28 |
| Terry Neils | 2009-11-29 |
| Paul Novak  | 2009-11-29 |
| Jack Fonda  | 2009-12-02 |
+-------------+------------+

This is an output for the right join of two tables. All the records of the table on the right side (Reservations) have a matching record on the left side (Customers).
Natural Joins

A natural join links all columns in two tables with the same name. In our ustomers and Reservations tables, we have a column named CustomerId.
NATURAL INNER JOIN

The NATURAL INNER JOIN automatically uses all the matching column names for the join. In our tables, we have a column named CustomerId in both tables.

mysql&gt; SELECT Name, Day FROM Customers NATURAL JOIN Reservations;
+-------------+------------+
| Name        | Day        |
+-------------+------------+
| Paul Novak  | 2009-11-22 |
| Terry Neils | 2009-11-28 |
| Terry Neils | 2009-11-29 |
| Paul Novak  | 2009-11-29 |
| Jack Fonda  | 2009-12-02 |
+-------------+------------+

We get the same data. The SQL statement is less verbose.
NATURAL LEFT OUTER JOIN

The NATURAL LEFT OUTER JOIN gives all the matching records from the tables and all other records on the left table. It automatically uses all the matching column names for the join.

mysql&gt; SELECT Name, Day FROM Customers 
    -&gt; NATURAL LEFT JOIN Reservations;
+-------------+------------+
| Name        | Day        |
+-------------+------------+
| Paul Novak  | 2009-11-22 |
| Paul Novak  | 2009-11-29 |
| Terry Neils | 2009-11-28 |
| Terry Neils | 2009-11-29 |
| Jack Fonda  | 2009-12-02 |
| Tom Willis  | NULL       |
+-------------+------------+

Same result, but with fewer key strokes.
NATURAL RIGHT OUTER JOIN

The NATURAL RIGHT OUTER JOIN gives all the matching records from the tables and all other records on the right table. It automatically uses matching column names for the join.

mysql&gt; SELECT Name, Day FROM Customers
    -&gt; NATURAL RIGHT JOIN Reservations;
+-------------+------------+
| Name        | Day        |
+-------------+------------+
| Paul Novak  | 2009-11-22 |
| Terry Neils | 2009-11-28 |
| Terry Neils | 2009-11-29 |
| Paul Novak  | 2009-11-29 |
| Jack Fonda  | 2009-12-02 |
+-------------+------------+

Quick recap

Next we will create two small tables to recap what we have learned here.

mysql&gt; CREATE TABLE AA(A INTEGER);
mysql&gt; CREATE TABLE BB(B INTEGER);
mysql&gt; INSERT INTO AA VALUES(1);
mysql&gt; INSERT INTO AA VALUES(2);
mysql&gt; INSERT INTO AA VALUES(3);
mysql&gt; INSERT INTO AA VALUES(4);
mysql&gt; INSERT INTO BB VALUES(3);
mysql&gt; INSERT INTO BB VALUES(4);
mysql&gt; INSERT INTO BB VALUES(5);
mysql&gt; INSERT INTO BB VALUES(6);

mysql&gt; SELECT * FROM AA;
+------+
| A    |
+------+
|    1 |
|    2 |
|    3 |
|    4 |
+------+

mysql&gt; SELECT * FROM BB;
+------+
| B    |
+------+
|    3 |
|    4 |
|    5 |
|    6 |
+------+

We have created and populated two tables with numerical data. Table AA has two unique numbers (1, 2), table BB has also two unique numbers (5, 6). They share two numbers (3, 4).
INNER JOIN

mysql&gt; SELECT * FROM AA JOIN BB ON A = B;
+------+------+
| A    | B    |
+------+------+
|    3 |    3 |
|    4 |    4 |
+------+------+

This is a INNER JOIN on both tables. We get only the matching values from both tables.
LEFT OUTER JOIN

mysql&gt; SELECT * FROM AA LEFT JOIN BB ON A = B;
+------+------+
| A    | B    |
+------+------+
|    1 | NULL |
|    2 | NULL |
|    3 |    3 |
|    4 |    4 |
+------+------+

This is a LEFT OUTER JOIN on both tables. We get the matching values plus the values from the left table that do not have a mathing record.
RIGHT OUTER JOIN

mysql&gt; SELECT * FROM AA RIGHT JOIN BB ON A = B;
+------+------+
| A    | B    |
+------+------+
|    3 |    3 |
|    4 |    4 |
| NULL |    5 |
| NULL |    6 |
+------+------+

This is a RIGHT OUTER JOIN on both tables. We get the matching values plus the values from the right table that do not have a matching record.

In this part of the MySQL tutorial, we were joining tables. 

</t>
<t tx="root.20160211145428.1711">MySQL functions

:FROM: http://zetcode.com/databases/mysqltutorial/functions/

 In this part of the MySQL tutorial, we will cover MySQL built-in functions.

MySQL built-in functions can be categorised into several groups.

    Mathematical functions
    Aggregate functions
    String functions
    Date and time functions
    System Functions

Here we show only a portion of all MySQL functions. To get the full list of available functions, consult the MySQL reference manual.
Mathematical functions

MySQL supports multiple mathematical functions.

mysql&gt; SELECT RAND();
+-------------------+
| RAND()            |
+-------------------+
| 0.786536605829873 |
+-------------------+

The RAND() function returns a random number from the &lt;0, 1&gt; interval.

mysql&gt; SELECT ABS(-3), PI(), SIN(0.5);
+---------+----------+-------------------+
| ABS(-3) | PI()     | SIN(0.5)          |
+---------+----------+-------------------+
|       3 | 3.141593 | 0.479425538604203 |
+---------+----------+-------------------+

The ABS() function returns the absolute value of a number. The PI() function gives the value of PI. And the SIN() function computes the sine of an argument.

mysql&gt; SELECT BIN(22), OCT(22), HEX(22);
+---------+---------+---------+
| BIN(22) | OCT(22) | HEX(22) |
+---------+---------+---------+
| 10110   | 26      | 16      |
+---------+---------+---------+

We use functions to give binary, octal and hexadecimal representation of decimal 22.

mysql&gt; SELECT CEIL(11.256), FLOOR(11.256), ROUND(11.256, 2);
+--------------+---------------+------------------+
| CEIL(11.256) | FLOOR(11.256) | ROUND(11.256, 2) |
+--------------+---------------+------------------+
|           12 |            11 |            11.26 |
+--------------+---------------+------------------+

The CEIL() function rounds the value to the smallest following integer. The FLOOR() function rounds the value to the largest previous integer. The ROUND() returns a number rounded to a specified number of decimal places.

mysql&gt; SELECT POW(3, 3), SQRT(9);
+-----------+---------+
| POW(3, 3) | SQRT(9) |
+-----------+---------+
|        27 |       3 |
+-----------+---------+

The power and the square root functions.

mysql&gt; SELECT DEGREES(2*PI());
+-----------------+
| DEGREES(2*PI()) |
+-----------------+
|             360 |
+-----------------+

The DEGREES() function computes degrees from radians.
Aggregate functions

Aggregate functions operate on sets of values.

mysql&gt; SELECT * FROM Cars;
+----+------------+--------+
| Id | Name       | Cost   |
+----+------------+--------+
|  1 | Audi       |  52642 |
|  2 | Mercedes   |  57127 |
|  3 | Skoda      |   9000 |
|  4 | Volvo      |  29000 |
|  5 | Bentley    | 350000 |
|  6 | Citroen    |  21000 |
|  7 | Hummer     |  41400 |
|  8 | Volkswagen |  21600 |
+----+------------+--------+

We have the Cars table.

mysql&gt; SELECT MIN(Cost), MAX(Cost), AVG(Cost)
    -&gt; FROM Cars;
+-----------+-----------+------------+
| MIN(Cost) | MAX(Cost) | AVG(Cost)  |
+-----------+-----------+------------+
|      9000 |    350000 | 72721.1250 |
+-----------+-----------+------------+

We use the MIN(), MAX() and AVG() aggregate functions to compute the minimal price, maximal price and the average price of cars in the table.

mysql&gt; SELECT SUM(Cost), COUNT(Id), STD(Cost), 
    -&gt; VARIANCE(Cost) FROM Cars;
+-----------+-----------+-------------+------------------+
| SUM(Cost) | COUNT(Id) | STD(Cost)   | VARIANCE(Cost)   |
+-----------+-----------+-------------+------------------+
|    581769 |         8 | 105931.1676 | 11221412265.3594 |
+-----------+-----------+-------------+------------------+

We use the SUM() function to get the sum of all values in the Cost column. We count the number of cars in the table with the COUNT() function. Finally, we get the standard deviation and variance using the STD() and VARIANCE() functions.
String functions

In this group we have various strings related functions.

mysql&gt; SELECT LENGTH('ZetCode'), UPPER('ZetCode'), LOWER('ZetCode');
+-------------------+------------------+------------------+
| LENGTH('ZetCode') | UPPER('ZetCode') | LOWER('ZetCode') |
+-------------------+------------------+------------------+
|                 7 | ZETCODE          | zetcode          |
+-------------------+------------------+------------------+

The LENGTH() function returns the length of a string. The UPPER() function converts characters into upper-case letters. The LOWER() function converts characters into lower-case letters.

ysql&gt; SELECT LPAD(RPAD("ZetCode", 10, "*"), 13, "*");
+-----------------------------------------+
| LPAD(RPAD("ZetCode", 10, "*"), 13, "*") |
+-----------------------------------------+
| ***ZetCode***                           |
+-----------------------------------------+

We use the LPAD() and RPAD() functions to append and prepend characters to a specified string. The "ZetCode" string has 7 characters. The RPAD() function appends 3 '*' characters to the string, which will be now 10 characters long.

mysql&gt; SELECT REVERSE('ZetCode'), REPEAT('*', 6);
+--------------------+----------------+
| REVERSE('ZetCode') | REPEAT('*', 6) |
+--------------------+----------------+
| edoCteZ            | ******         |
+--------------------+----------------+

The REVERSE() function reverses the characters in a string. The REPEAT() function repeats a string specified number of times.

mysql&gt; SELECT LEFT('ZetCode', 3), RIGHT('ZetCode', 3), 
    -&gt; SUBSTRING('ZetCode', 3, 3);
+--------------------+---------------------+----------------------------+
| LEFT('ZetCode', 3) | RIGHT('ZetCode', 3) | SUBSTRING('ZetCode', 3, 3) |
+--------------------+---------------------+----------------------------+
| Zet                | ode                 | tCo                        |
+--------------------+---------------------+----------------------------+

The LEFT() function returns 3 leftmost characters, the RIGHT() function returns 3 characters from the right. The SUBSTRING() function returns three characters from the third position of the string.

mysql&gt; SELECT STRCMP('byte', 'byte'), CONCAT('three', ' apples');
+------------------------+----------------------------+
| STRCMP('byte', 'byte') | CONCAT('three', ' apples') |
+------------------------+----------------------------+
|                      0 | three apples               |
+------------------------+----------------------------+

The STRCMP() compares two strings and returns 0 if they are the same. The CONCAT() function concatenates two strings.

mysql&gt; SELECT REPLACE('basketball', 'basket', 'foot');
+-----------------------------------------+
| REPLACE('basketball', 'basket', 'foot') |
+-----------------------------------------+
| football                                |
+-----------------------------------------+

The REPLACE() function returns a string, in which we have replaced some text. The first parameter is the original string. The second parameter is a string, we want to replace. And the last parameter is the new replacing string.
Date &amp; time functions

In this group we have various date and time functions.

mysql&gt; SELECT DAYNAME('2011-01-23'), YEAR('2011/01/23'),
    -&gt; MONTHNAME('110123');
+-----------------------+--------------------+---------------------+
| DAYNAME('2011-01-23') | YEAR('2011/01/23') | MONTHNAME('110123') |
+-----------------------+--------------------+---------------------+
| Sunday                |               2011 | January             |
+-----------------------+--------------------+---------------------+

In MySQL, date is written in the format YYYY-MM-DD. Year is followed by month and day. They can be separated by slash or by hyphen. MySQL also supports a shortened date format, without separators. Time is written in a standard form, HH:MM:SS. Hours followed by minutes and seconds.

mysql&gt; SELECT NOW();
+---------------------+
| NOW()               |
+---------------------+
| 2011-01-22 00:24:49 |
+---------------------+

The NOW() function returns the current date and time.

mysql&gt; SELECT CURTIME(), CURDATE();
+-----------+------------+
| CURTIME() | CURDATE()  |
+-----------+------------+
| 00:25:03  | 2011-01-22 |
+-----------+------------+

The CURTIME() returns the current time and the CURDATE() returns the current date.

mysql&gt; SELECT DATEDIFF('2011-3-12', '2011-1-12');
+------------------------------------+
| DATEDIFF('2011-3-12', '2011-1-12') |
+------------------------------------+
|                                 59 |
+------------------------------------+

With the DATEDIFF() we get the number of days between two dates.

mysql&gt; SELECT DAYNAME('1982-4-12'), MONTHNAME('1982-4-12') ;
+----------------------+------------------------+
| DAYNAME('1982-4-12') | MONTHNAME('1982-4-12') |
+----------------------+------------------------+
| Monday               | April                  |
+----------------------+------------------------+

The DAYNAME() function returns the day name of a date. The MONTHNAME() function returns a month name of a date.

mysql&gt; SELECT WEEKOFYEAR('110123'), WEEKDAY('110123'),
    -&gt; QUARTER('110123');
+----------------------+-------------------+-------------------+
| WEEKOFYEAR('110123') | WEEKDAY('110123') | QUARTER('110123') |
+----------------------+-------------------+-------------------+
|                    3 |                 6 |                 1 |
+----------------------+-------------------+-------------------+

January 23, 2011 can be written in a shortened date format, 110123. We use the WEEKOFYEAR() to find out the week of the year. The WEEKDAY() returns 6, which is Sunday. And the QUARTER() function returns the quarter of the year.

mysql&gt; SELECT DATE_FORMAT('110123', '%d-%m-%Y');
+-----------------------------------+
| DATE_FORMAT('110123', '%d-%m-%Y') |
+-----------------------------------+
| 23-01-2011                        |
+-----------------------------------+

To display date in a different format, we use the DATE_FORMAT().

mysql&gt; SELECT DATE_ADD('110123', INTERVAL 45 DAY), 
    -&gt; SUBDATE('110309', INTERVAL 45 DAY);
+-------------------------------------+------------------------------------+
| DATE_ADD('110123', INTERVAL 45 DAY) | SUBDATE('110309', INTERVAL 45 DAY) |
+-------------------------------------+------------------------------------+
| 2011-03-09                          | 2011-01-23                         |
+-------------------------------------+------------------------------------+

We can use DATE_ADD() to add time intervals to a date and SUBDATE() to subtract time intervals from a date.
System functions

System functions provide some system information about MySQL database.

mysql&gt; SELECT VERSION(), DATABASE();
+--------------------+------------+
| VERSION()          | DATABASE() |
+--------------------+------------+
| 5.1.41-3ubuntu12.8 | mydb       |
+--------------------+------------+

We get the version of the MySQL database and the current database name.

mysql&gt; SELECT USER();
+----------------+
| USER()         |
+----------------+
| root@localhost |
+----------------+

The USER() function returns the user name and the host name provided by the client.

mysql&gt; SELECT CHARSET('ZetCode'), COLLATION('ZetCode');
+--------------------+----------------------+
| CHARSET('ZetCode') | COLLATION('ZetCode') |
+--------------------+----------------------+
| utf8               | utf8_general_ci      |
+--------------------+----------------------+

The CHARSET() function returns the character set of the argument. The COLLATION() returns the collation of the current string argument. They depend on the charset and collation of the client in use.

In this part of the MySQL tutorial, we worked with the built-in MySQL functions. 


</t>
</tnodes>
</leo_file>
