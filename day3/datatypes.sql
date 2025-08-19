

Copyright (c) 2016, 2025, Oracle and/or its affiliates.
Oracle is a registered trademark of Oracle Corporation and/or its affiliates.
Other names may be trademarks of their respective owners.

Type '\help' or '\?' for help; '\quit' to exit.
 MySQL  JS > \c
\connect [--mx|--mysqlx|--mc|--mysql] [--ssh <sshuri>] <URI>
 MySQL  JS > \C
Unknown command: '\C'
 MySQL  JS > \ c
Unknown command: '\ c'
 MySQL  JS > \sql
Switching to SQL mode... Commands end with ;
 MySQL  SQL > \c root@localhost
Creating a session to 'root@localhost'
Fetching global names for auto-completion... Press ^C to stop.
Your MySQL connection id is 10 (X protocol)
Server version: 8.0.43 MySQL Community Server - GPL
No default schema selected; type \use <schema> to set one.
 MySQL  localhost:33060+ ssl  SQL > show databses;
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'databses' at line 1
 MySQL  localhost:33060+ ssl  SQL > show database;
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'database' at line 1
 MySQL  localhost:33060+ ssl  SQL > show databases
                                 -> ;
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
6 rows in set (0.0247 sec)
 MySQL  localhost:33060+ ssl  SQL > use tharun
Default schema set to `tharun`.
Fetching global names, object names from `tharun` for auto-completion... Press ^C to stop.
 MySQL  localhost:33060+ ssl  tharun  SQL > show tables;
+------------------+
| Tables_in_tharun |
+------------------+
| info             |
| profile          |
| shop             |
| studentpro       |
| students         |
+------------------+
5 rows in set (0.0031 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > select * from students;
+------+------+-----+--------+------+-----+--------+
| num  | age  | id  | name   | sal  | job | mobile |
+------+------+-----+--------+------+-----+--------+
| NULL | NULL | 100 | nani   | NULL | dev |   NULL |
| NULL | NULL | 101 | tharun | NULL | dev |   NULL |
| NULL | NULL | 102 | NULL   | 2000 | dev |   NULL |
+------+------+-----+--------+------+-----+--------+
3 rows in set (0.0021 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > create table numeric (id int, small smallint, big bigint, price decimal, marks float ),
                                         -> ;
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'numeric (id int, small smallint, big bigint, price decimal, marks float ),' at line 1
 MySQL  localhost:33060+ ssl  tharun  SQL > create table numeric(id int, small SMALLINT, big BIGINT, price decimal(7,2), marks float ), ;
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'numeric(id int, small SMALLINT, big BIGINT, price decimal(7,2), marks float ),' at line 1
 MySQL  localhost:33060+ ssl  tharun  SQL > create table numeric(id int, small SMALLINT, big BIGINT, price decimal(7,2), marks float );
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'numeric(id int, small SMALLINT, big BIGINT, price decimal(7,2), marks float )' at line 1
 MySQL  localhost:33060+ ssl  tharun  SQL > create table numeric (id int, small SMALLINT, big BIGINT, price decimal(7,2), marks float );
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'numeric (id int, small SMALLINT, big BIGINT, price decimal(7,2), marks float )' at line 1
 MySQL  localhost:33060+ ssl  tharun  SQL > create table numeric (id INT, small_v  SMALLINT, big_v BIGINT, price DECIMAL(7,2), marks FLOAT );
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'numeric (id INT, small_v  SMALLINT, big_v BIGINT, price DECIMAL(7,2), marks FLOA' at line 1
 MySQL  localhost:33060+ ssl  tharun  SQL > create table numeric (id INT, small_v  SMALLINT, big_v BIGINT, price DECIMAL(7,2), marks FLOAT);
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'numeric (id INT, small_v  SMALLINT, big_v BIGINT, price DECIMAL(7,2), marks FLOA' at line 1
 MySQL  localhost:33060+ ssl  tharun  SQL > create table numeric_v (id INT, small_v  SMALLINT, big_v BIGINT, price DECIMAL(7,2), marks FLOAT);
Query OK, 0 rows affected (0.0801 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > desc numeric_v
                                         -> ;
+---------+--------------+------+-----+---------+-------+
| Field   | Type         | Null | Key | Default | Extra |
+---------+--------------+------+-----+---------+-------+
| id      | int          | YES  |     | NULL    |       |
| small_v | smallint     | YES  |     | NULL    |       |
| big_v   | bigint       | YES  |     | NULL    |       |
| price   | decimal(7,2) | YES  |     | NULL    |       |
| marks   | float        | YES  |     | NULL    |       |
+---------+--------------+------+-----+---------+-------+
5 rows in set (0.0050 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > insert into numeric_v  values(1, 123, 2345432345, 34552.34, 89.56);
Query OK, 1 row affected (0.0406 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > select * from numeric_v;
+----+---------+------------+----------+-------+
| id | small_v | big_v      | price    | marks |
+----+---------+------------+----------+-------+
|  1 |     123 | 2345432345 | 34552.34 | 89.56 |
+----+---------+------------+----------+-------+
1 row in set (0.0013 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > create table strings (id int, fixed_name char(6), name varchar(30), paragraph text);
Query OK, 0 rows affected (0.0722 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > insert into strings values(1, "tharun", "nani", "nani is a good boy");
Query OK, 1 row affected (0.0297 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > desc strings;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| id         | int         | YES  |     | NULL    |       |
| fixed_name | char(6)     | YES  |     | NULL    |       |
| name       | varchar(30) | YES  |     | NULL    |       |
| paragraph  | text        | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
4 rows in set (0.0037 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > select * from strings;
+----+------------+------+--------------------+
| id | fixed_name | name | paragraph          |
+----+------------+------+--------------------+
|  1 | tharun     | nani | nani is a good boy |
+----+------------+------+--------------------+
1 row in set (0.0012 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > create table date_time (id int, dob date, login_time time, creates datetime, j_year year);
Query OK, 0 rows affected (0.0563 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > desc date_time;
+------------+----------+------+-----+---------+-------+
| Field      | Type     | Null | Key | Default | Extra |
+------------+----------+------+-----+---------+-------+
| id         | int      | YES  |     | NULL    |       |
| dob        | date     | YES  |     | NULL    |       |
| login_time | time     | YES  |     | NULL    |       |
| creates    | datetime | YES  |     | NULL    |       |
| j_year     | year     | YES  |     | NULL    |       |
+------------+----------+------+-----+---------+-------+
5 rows in set (0.0045 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > insert into date_time values (1, "2001-06-30", "10:20:23", "2025-03-03 11:34:30", 2002);
Query OK, 1 row affected (0.0302 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > select * from date_time;
+----+------------+------------+---------------------+--------+
| id | dob        | login_time | creates             | j_year |
+----+------------+------------+---------------------+--------+
|  1 | 2001-06-30 | 10:20:23   | 2025-03-03 11:34:30 |   2002 |
+----+------------+------------+---------------------+--------+
1 row in set (0.0011 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > create table bool(id int primary key, is_nani boolean);
Query OK, 0 rows affected (0.0875 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > desc bool;
+---------+------------+------+-----+---------+-------+
| Field   | Type       | Null | Key | Default | Extra |
+---------+------------+------+-----+---------+-------+
| id      | int        | NO   | PRI | NULL    |       |
| is_nani | tinyint(1) | YES  |     | NULL    |       |
+---------+------------+------+-----+---------+-------+
2 rows in set (0.0040 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > insert into bool values(1,true),(2,false);
Query OK, 2 rows affected (0.0300 sec)

Records: 2  Duplicates: 0  Warnings: 0
 MySQL  localhost:33060+ ssl  tharun  SQL > select * from bool;
+----+---------+
| id | is_nani |
+----+---------+
|  1 |       1 |
|  2 |       0 |