0.43

Copyright (c) 2016, 2025, Oracle and/or its affiliates.
Oracle is a registered trademark of Oracle Corporation and/or its affiliates.
Other names may be trademarks of their respective owners.

Type '\help' or '\?' for help; '\quit' to exit.
 MySQL  JS > \sql
Switching to SQL mode... Commands end with ;
 MySQL  SQL > \c root@localhost
Creating a session to 'root@localhost'
Fetching global names for auto-completion... Press ^C to stop.
Your MySQL connection id is 29 (X protocol)
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
6 rows in set (0.0030 sec)
 MySQL  localhost:33060+ ssl  SQL > use tharun;
Default schema set to `tharun`.
Fetching global names, object names from `tharun` for auto-completion... Press ^C to stop.
 MySQL  localhost:33060+ ssl  tharun  SQL > show tables
                                         -> ;
+------------------+
| Tables_in_tharun |
+------------------+
| profile          |
| shop             |
| student          |
| studentpro       |
+------------------+
4 rows in set (0.0030 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > desc student;
+-------+-------------+------+-----+---------+----------------+
| Field | Type        | Null | Key | Default | Extra          |
+-------+-------------+------+-----+---------+----------------+
| id    | int         | NO   | PRI | NULL    | auto_increment |
| name  | varchar(30) | YES  |     | NULL    |                |
| sal   | int         | YES  |     | NULL    |                |
| job   | varchar(30) | YES  |     | dev     |                |
+-------+-------------+------+-----+---------+----------------+
4 rows in set (0.0035 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > create table info (iname varchar(49), id int,
                                         -> foreign key(id) references student (id);
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 2
 MySQL  localhost:33060+ ssl  tharun  SQL > create table info (iname varchar(49), id int, foreign key(id) references student (id));
Query OK, 0 rows affected (0.0814 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > select*from info;
Empty set (0.0043 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > desc info;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| iname | varchar(49) | YES  |     | NULL    |       |
| id    | int         | YES  | MUL | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.0033 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > select * from student;
+-----+--------+------+-----+
| id  | name   | sal  | job |
+-----+--------+------+-----+
| 100 | nani   | NULL | dev |
| 101 | tharun | NULL | dev |
| 102 | NULL   | 2000 | dev |
+-----+--------+------+-----+
3 rows in set (0.0039 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > insert into info values ("tharunn",100);
Query OK, 1 row affected (0.0092 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > select *from info;
+---------+-----+
| iname   | id  |
+---------+-----+
| tharunn | 100 |
+---------+-----+
1 row in set (0.0012 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > insert into info values ("naniii", 12);
ERROR: 1452: Cannot add or update a child row: a foreign key constraint fails (`tharun`.`info`, CONSTRAINT `info_ibfk_1` FOREIGN KEY (`id`) REFERENCES `student` (`id`))
 MySQL  localhost:33060+ ssl  tharun  SQL > insert into info values ("nanii", 101), ("tharunnnn", 102);
Query OK, 2 rows affected (0.0080 sec)

Records: 2  Duplicates: 0  Warnings: 0
 MySQL  localhost:33060+ ssl  tharun  SQL > select *from info;
+-----------+-----+
| iname     | id  |
+-----------+-----+
| tharunn   | 100 |
| nanii     | 101 |
| tharunnnn | 102 |
+-----------+-----+
3 rows in set (0.0012 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > select *from student
                                         -> ;
+-----+--------+------+-----+
| id  | name   | sal  | job |
+-----+--------+------+-----+
| 100 | nani   | NULL | dev |
| 101 | tharun | NULL | dev |
| 102 | NULL   | 2000 | dev |
+-----+--------+------+-----+
3 rows in set (0.0016 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > select id+100 from info;
+--------+
| id+100 |
+--------+
|    200 |
|    201 |
|    202 |
+--------+
3 rows in set (0.0037 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > select*from info;
+-----------+-----+
| iname     | id  |
+-----------+-----+
| tharunn   | 100 |
| nanii     | 101 |
| tharunnnn | 102 |
+-----------+-----+
3 rows in set (0.0012 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > show databases;
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
6 rows in set (0.0026 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > use nani;
Default schema set to `nani`.
Fetching global names, object names from `nani` for auto-completion... Press ^C to stop.
 MySQL  localhost:33060+ ssl  nani  SQL > show tables;
+----------------+
| Tables_in_nani |
+----------------+
| employees      |
| std            |
+----------------+
2 rows in set (0.0030 sec)
 MySQL  localhost:33060+ ssl  nani  SQL > select *from std;
Empty set (0.0022 sec)
 MySQL  localhost:33060+ ssl  nani  SQL > select* from employees;
+--------+-----+---------+
| name   | id  | salary  |
+--------+-----+---------+
| nani   | 234 |    NULL |
| tharun | 343 |  300000 |
| Arun   | 424 | 2433234 |
+--------+-----+---------+
3 rows in set (0.0020 sec)
 MySQL  localhost:33060+ ssl  nani  SQL > select name , id+100, salary from employees;
+--------+--------+---------+
| name   | id+100 | salary  |
+--------+--------+---------+
| nani   |    334 |    NULL |
| tharun |    443 |  300000 |
| Arun   |    524 | 2433234 |
+--------+--------+---------+
3 rows in set (0.0015 sec)
 MySQL  localhost:33060+ ssl  nani  SQL > select name , id as new id , salary from employees;
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'id , salary from employees' at line 1
 MySQL  localhost:33060+ ssl  nani  SQL > select name, id, salary+1000 as new_salary from employees;
+--------+-----+------------+
| name   | id  | new_salary |
+--------+-----+------------+
| nani   | 234 |       NULL |
| tharun | 343 |     301000 |
| Arun   | 424 |    2434234 |
+--------+-----+------------+
3 rows in set (0.0012 sec)
 MySQL  localhost:33060+ ssl  nani  SQL > select * from employees where name="nani";
+------+-----+--------+
| name | id  | salary |
+------+-----+--------+
| nani | 234 |   NULL |
+------+-----+--------+
1 row in set (0.0015 sec)
 MySQL  localhost:33060+ ssl  nani  SQL > select * from employees where name="nani" or id >="300";
+--------+-----+---------+
| name   | id  | salary  |
+--------+-----+---------+
| nani   | 234 |    NULL |
| tharun | 343 |  300000 |
| Arun   | 424 | 2433234 |
+--------+-----+---------+
3 rows in set (0.0039 sec)
 MySQL  localhost:33060+ ssl  nani  SQL > select *from employees where salary <> 300000;
+------+-----+---------+
| name | id  | salary  |
+------+-----+---------+
| Arun | 424 | 2433234 |
+------+-----+---------+
1 row in set (0.0013 sec)
 MySQL  localhost:33060+ ssl  nani  SQL > select *from employees where name not in ("tharun");
+------+-----+---------+
| name | id  | salary  |
+------+-----+---------+
| nani | 234 |    NULL |
| Arun | 424 | 2433234 |
+------+-----+---------+
2 rows in set (0.0015 sec)
 MySQL  localhost:33060+ ssl  nani  SQL > select *from employees where salary not between 3 and 5;
+--------+-----+---------+
| name   | id  | salary  |
+--------+-----+---------+
| tharun | 343 |  300000 |
| Arun   | 424 | 2433234 |
+--------+-----+---------+
2 rows in set (0.0239 sec)
 MySQL  localhost:33060+ ssl  nani  SQL > select *from employees where salary  between 3 and 5;
Empty set (0.0015 sec)
 MySQL  localhost:33060+ ssl  nani  SQL > select *from employees where name like "nani";
+------+-----+--------+
| name | id  | salary |
+------+-----+--------+
| nani | 234 |   NULL |
+------+-----+--------+
1 row in set (0.0019 sec)
 MySQL  localhost:33060+ ssl  nani  SQL > select *from employees where name not like "nani";
+--------+-----+---------+
| name   | id  | salary  |
+--------+-----+---------+
| tharun | 343 |  300000 |
| Arun   | 424 | 2433234 |
+--------+-----+---------+
2 rows in set (0.0014 sec)
 MySQL  localhost:33060+ ssl  nani  SQL > select *from employees where name in ("tharun", "nani");
+--------+-----+--------+
| name   | id  | salary |
+--------+-----+--------+
| nani   | 234 |   NULL |
| tharun | 343 | 300000 |
+--------+-----+--------+
2 rows in set (0.0016 sec)
 MySQL  localhost:33060+ ssl  nani  SQL > alter table employees add column dob date;
Query OK, 0 rows affected (0.0387 sec)

Records: 0  Duplicates: 0  Warnings: 0
 MySQL  localhost:33060+ ssl  nani  SQL > insert into employees values ("rakhi", 455, 567899, 2-5-25);

ERROR: 1292: Incorrect date value: '-28' for column 'dob' at row 1
 MySQL  localhost:33060+ ssl  nani  SQL > insert into employees values ("rakhi", 455, 567899, 2525);
ERROR: 1292: Incorrect date value: '2525' for column 'dob' at row 1
 MySQL  localhost:33060+ ssl  nani  SQL > desc employees;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| name   | varchar(40) | YES  |     | NULL    |       |
| id     | int         | YES  |     | NULL    |       |
| salary | int         | YES  |     | NULL    |       |
| dob    | date        | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
4 rows in set (0.0042 sec)
 MySQL  localhost:33060+ ssl  nani  SQL > insert into employees values ("rakhi", 455, 567899, 2-5-2025);
ERROR: 1292: Incorrect date value: '-2028' for column 'dob' at row 1
 MySQL  localhost:33060+ ssl  nani  SQL > insert into employees values ("rakhi", 455, 567899, 2025-05-02);
ERROR: 1292: Incorrect date value: '2018' for column 'dob' at row 1
 MySQL  localhost:33060+ ssl  nani  SQL > insert into employees values ("rakhi", 455, 567899, "2025-05-02");
Query OK, 1 row affected (0.0080 sec)
 MySQL  localhost:33060+ ssl  nani  SQL > select *from employees;
+--------+-----+---------+------------+
| name   | id  | salary  | dob        |
+--------+-----+---------+------------+
| nani   | 234 |    NULL | NULL       |
| tharun | 343 |  300000 | NULL       |
| Arun   | 424 | 2433234 | NULL       |
| rakhi  | 455 |  567899 | 2025-05-02 |
+--------+-----+---------+------------+
4 rows in set (0.0018 sec)
 MySQL  localhost:33060+ ssl  nani  SQL >