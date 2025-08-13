MySQL Shell 8.0.43

Copyright (c) 2016, 2025, Oracle and/or its affiliates.
Oracle is a registered trademark of Oracle Corporation and/or its affiliates.
Other names may be trademarks of their respective owners.

Type '\help' or '\?' for help; '\quit' to exit.
 MySQL  JS > \sql
Switching to SQL mode... Commands end with ;
 MySQL  SQL > \c root@localhost
Creating a session to 'root@localhost'
Fetching global names for auto-completion... Press ^C to stop.
Your MySQL connection id is 28 (X protocol)
Server version: 8.0.43 MySQL Community Server - GPL
No default schema selected; type \use <schema> to set one.
 MySQL  localhost:33060+ ssl  SQL > show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| nani               |
| performance_schema |
| sys                |
| tharun             |
+--------------------+
6 rows in set (0.0020 sec)
 MySQL  localhost:33060+ ssl  SQL > use tharun;
Default schema set to `tharun`.
Fetching global names, object names from `tharun` for auto-completion... Press ^C to stop.
 MySQL  localhost:33060+ ssl  tharun  SQL > show tables;
+------------------+
| Tables_in_tharun |
+------------------+
| profile          |
| shop             |
| student          |
| studentpro       |
+------------------+
4 rows in set (0.0032 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > select *from studentpro;
+----+-----------+-----+---------------------+------------+
| id | name      | age | email               | city       |
+----+-----------+-----+---------------------+------------+
|  2 | nani      |  20 | abc@gmail.com       | mulugu     |
|  3 | tharun    |  24 | tharun@gmail.com    | hyderabad  |
|  4 | kanna     |  21 | kanna@gmail.com     | hyderabad  |
|  5 | prash     |  25 | prash@gmail.com     | hyderabad  |
|  6 | rishu     |  19 | rishu@gmail.com     | hyderabad  |
|  7 | deepu     |  23 | deepu@gmail.com     | hyderabad  |
|  8 | kannaya   |  21 | kannaya@gmail.com   | WARANGAL   |
|  9 | prashanth |  25 | prashanth@gmail.com | karimnagar |
+----+-----------+-----+---------------------+------------+
8 rows in set (0.0017 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > alter table studentpro
                                         -> add column mob bigint unique;
Query OK, 0 rows affected (0.1792 sec)

Records: 0  Duplicates: 0  Warnings: 0
 MySQL  localhost:33060+ ssl  tharun  SQL > select * from studentpro;
+----+-----------+-----+---------------------+------------+------+
| id | name      | age | email               | city       | mob  |
+----+-----------+-----+---------------------+------------+------+
|  2 | nani      |  20 | abc@gmail.com       | mulugu     | NULL |
|  3 | tharun    |  24 | tharun@gmail.com    | hyderabad  | NULL |
|  4 | kanna     |  21 | kanna@gmail.com     | hyderabad  | NULL |
|  5 | prash     |  25 | prash@gmail.com     | hyderabad  | NULL |
|  6 | rishu     |  19 | rishu@gmail.com     | hyderabad  | NULL |
|  7 | deepu     |  23 | deepu@gmail.com     | hyderabad  | NULL |
|  8 | kannaya   |  21 | kannaya@gmail.com   | WARANGAL   | NULL |
|  9 | prashanth |  25 | prashanth@gmail.com | karimnagar | NULL |
+----+-----------+-----+---------------------+------------+------+
8 rows in set (0.0013 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > insert into studentpro values ("anju",23, "anju@gmail.com", 9947573737);
ERROR: 1136: Column count doesn't match value count at row 1
 MySQL  localhost:33060+ ssl  tharun  SQL > insert into studentpro values ("anju",23, "anju@gmail.com", "venkatapur", 9947573737);
ERROR: 1136: Column count doesn't match value count at row 1
 MySQL  localhost:33060+ ssl  tharun  SQL > insert into studentpro values (10,"anju",23, "anju@gmail.com", "venkatapur", 9947573737);
Query OK, 1 row affected (0.0313 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > select *from studentpro;
+----+-----------+-----+---------------------+------------+------------+
| id | name      | age | email               | city       | mob        |
+----+-----------+-----+---------------------+------------+------------+
|  2 | nani      |  20 | abc@gmail.com       | mulugu     |       NULL |
|  3 | tharun    |  24 | tharun@gmail.com    | hyderabad  |       NULL |
|  4 | kanna     |  21 | kanna@gmail.com     | hyderabad  |       NULL |
|  5 | prash     |  25 | prash@gmail.com     | hyderabad  |       NULL |
|  6 | rishu     |  19 | rishu@gmail.com     | hyderabad  |       NULL |
|  7 | deepu     |  23 | deepu@gmail.com     | hyderabad  |       NULL |
|  8 | kannaya   |  21 | kannaya@gmail.com   | WARANGAL   |       NULL |
|  9 | prashanth |  25 | prashanth@gmail.com | karimnagar |       NULL |
| 10 | anju      |  23 | anju@gmail.com      | venkatapur | 9947573737 |
+----+-----------+-----+---------------------+------------+------------+
9 rows in set (0.0012 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > alter table studentpro modify age smallint check (age>=18);
Query OK, 9 rows affected (0.1531 sec)

Records: 9  Duplicates: 0  Warnings: 0
 MySQL  localhost:33060+ ssl  tharun  SQL > desc studentpro;
+-------+-------------+------+-----+-----------+----------------+
| Field | Type        | Null | Key | Default   | Extra          |
+-------+-------------+------+-----+-----------+----------------+
| id    | int         | NO   | PRI | NULL      | auto_increment |
| name  | varchar(50) | NO   |     | NULL      |                |
| age   | smallint    | YES  |     | NULL      |                |
| email | varchar(50) | YES  | UNI | NULL      |                |
| city  | varchar(50) | YES  |     | hyderabad |                |
| mob   | bigint      | YES  | UNI | NULL      |                |
+-------+-------------+------+-----+-----------+----------------+
6 rows in set (0.0040 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > alter table studentpro drop column city;
Query OK, 0 rows affected (0.0567 sec)

Records: 0  Duplicates: 0  Warnings: 0
 MySQL  localhost:33060+ ssl  tharun  SQL > select *from studentpro;
+----+-----------+-----+---------------------+------------+
| id | name      | age | email               | mob        |
+----+-----------+-----+---------------------+------------+
|  2 | nani      |  20 | abc@gmail.com       |       NULL |
|  3 | tharun    |  24 | tharun@gmail.com    |       NULL |
|  4 | kanna     |  21 | kanna@gmail.com     |       NULL |
|  5 | prash     |  25 | prash@gmail.com     |       NULL |
|  6 | rishu     |  19 | rishu@gmail.com     |       NULL |
|  7 | deepu     |  23 | deepu@gmail.com     |       NULL |
|  8 | kannaya   |  21 | kannaya@gmail.com   |       NULL |
|  9 | prashanth |  25 | prashanth@gmail.com |       NULL |
| 10 | anju      |  23 | anju@gmail.com      | 9947573737 |
+----+-----------+-----+---------------------+------------+
9 rows in set (0.0012 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > insert into values (12,"rakhi', 10, "anju@gmail.com", 6309383826);
                                         "> ;
                                         ">
                                         "> ;
                                         "> select *from studentpro;
                                         "> insert into studentpro values (12,"anjali",20, "anjali@gmail.com",  9947573737);
                                         "> ^C
 MySQL  localhost:33060+ ssl  tharun  SQL > insert into studentpro values (12,"anjali",10, "anju@gmail.com", 9847573737);
ERROR: 3819: Check constraint 'studentpro_chk_1' is violated.
 MySQL  localhost:33060+ ssl  tharun  SQL > insert into studentpro values (12,"anjali",30, "anju@gmail.com", 9847573737);
ERROR: 1062: Duplicate entry 'anju@gmail.com' for key 'studentpro.email'
 MySQL  localhost:33060+ ssl  tharun  SQL >






 ####2222
 -- Create the table
CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    age INT CHECK (age >= 18),
    city VARCHAR(50) DEFAULT 'Hyderabad'
);

-- Insert 5 sample records
INSERT INTO students (name, email, age, city) 
VALUES ('Ravi Kumar', 'ravi@example.com', 21, 'Delhi');

INSERT INTO students (name, email, age) 
VALUES ('Anjali Sharma', 'anjali@example.com', 19);

INSERT INTO students (name, email, age, city) 
VALUES ('Vikram Singh', 'vikram@example.com', 25, 'Mumbai');

INSERT INTO students (name, email, age) 
VALUES ('Priya Reddy', 'priya@example.com', 22);

INSERT INTO students (name, email, age, city) 
VALUES ('Rahul Mehta', 'rahul@example.com', 28, 'Chennai');