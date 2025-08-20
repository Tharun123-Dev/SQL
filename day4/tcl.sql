MySQL Shell 8.0.43

Copyright (c) 2016, 2025, Oracle and/or its affiliates.
Oracle is a registered trademark of Oracle Corporation and/or its affiliates.
Other names may be trademarks of their respective owners.

Type '\help' or '\?' for help; '\quit' to exit.
 MySQL  JS > +
          -> \sql
          -> ^C
 MySQL  JS > \sql
Switching to SQL mode... Commands end with ;
 MySQL  SQL > \c root@localhost
Creating a session to 'root@localhost'
Fetching global names for auto-completion... Press ^C to stop.
Your MySQL connection id is 11 (X protocol)
Server version: 8.0.43 MySQL Community Server - GPL
No default schema selected; type \use <schema> to set one.
 MySQL  localhost:33060+ ssl  SQL > create user tharun@localhost identify by "12345"
                                 -> ;
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'identify by "12345"' at line 1
 MySQL  localhost:33060+ ssl  SQL > create user tharun@localhost identify by "12345";
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'identify by "12345"' at line 1
 MySQL  localhost:33060+ ssl  SQL > create user tharun@localhost identify by 12345;
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'identify by 12345' at line 1
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
6 rows in set (0.0025 sec)
 MySQL  localhost:33060+ ssl  SQL > use mysql
Default schema set to `mysql`.
Fetching global names, object names from `mysql` for auto-completion... Press ^C to stop.
 MySQL  localhost:33060+ ssl  mysql  SQL > show tables;
+------------------------------------------------------+
| Tables_in_mysql                                      |
+------------------------------------------------------+
| columns_priv                                         |
| component                                            |
| db                                                   |
| default_roles                                        |
| engine_cost                                          |
| func                                                 |
| general_log                                          |
| global_grants                                        |
| gtid_executed                                        |
| help_category                                        |
| help_keyword                                         |
| help_relation                                        |
| help_topic                                           |
| innodb_index_stats                                   |
| innodb_table_stats                                   |
| ndb_binlog_index                                     |
| password_history                                     |
| plugin                                               |
| procs_priv                                           |
| proxies_priv                                         |
| replication_asynchronous_connection_failover         |
| replication_asynchronous_connection_failover_managed |
| replication_group_configuration_version              |
| replication_group_member_actions                     |
| role_edges                                           |
| server_cost                                          |
| servers                                              |
| slave_master_info                                    |
| slave_relay_log_info                                 |
| slave_worker_info                                    |
| slow_log                                             |
| tables_priv                                          |
| time_zone                                            |
| time_zone_leap_second                                |
| time_zone_name                                       |
| time_zone_transition                                 |
| time_zone_transition_type                            |
| user                                                 |
+------------------------------------------------------+
38 rows in set (0.0047 sec)
 MySQL  localhost:33060+ ssl  mysql  SQL > select user,host from user;
+------------------+-----------+
| user             | host      |
+------------------+-----------+
| mysql.infoschema | localhost |
| mysql.session    | localhost |
| mysql.sys        | localhost |
| root             | localhost |
+------------------+-----------+
4 rows in set (0.0013 sec)
 MySQL  localhost:33060+ ssl  mysql  SQL > use tharun;
Default schema set to `tharun`.
Fetching global names, object names from `tharun` for auto-completion... Press ^C to stop.
 MySQL  localhost:33060+ ssl  tharun  SQL > show tables;
+------------------+
| Tables_in_tharun |
+------------------+
| bool             |
| date_time        |
| info             |
| numeric_v        |
| profile          |
| shop             |
| strings          |
| studentpro       |
| students         |
+------------------+
9 rows in set (0.0029 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > select * from students;
+------+------+-----+--------+------+-----+--------+
| num  | age  | id  | name   | sal  | job | mobile |
+------+------+-----+--------+------+-----+--------+
| NULL | NULL | 100 | nani   | NULL | dev |   NULL |
| NULL | NULL | 101 | tharun | NULL | dev |   NULL |
| NULL | NULL | 102 | NULL   | 2000 | dev |   NULL |
+------+------+-----+--------+------+-----+--------+
3 rows in set (0.0027 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > select * from shop;
+---------+-----------+--------+--------+------------+-----------+
| shop_id | shop_name | income | name   | address    | mob       |
+---------+-----------+--------+--------+------------+-----------+
|       1 | nani      |   2000 | tharun | venkatapur |  23565556 |
|       2 | mobile    |  30000 | tharun | mulugu     |      NULL |
|       3 | electric  |   NULL | tharun | NULL       | 136754467 |
+---------+-----------+--------+--------+------------+-----------+
3 rows in set (0.0590 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > insert into  shop values(4,"rohith", 20000, "tharun", "ven", 6783738);
Query OK, 1 row affected (0.0136 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > savepoint a;
Query OK, 0 rows affected (0.0011 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > insert into  shop values(5,"rohithhh", 200500, "tharunnn", "venka", 689783738);
Query OK, 1 row affected (0.0315 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > savepoint b;
Query OK, 0 rows affected (0.0008 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > select *from shop;
+---------+-----------+--------+----------+------------+-----------+
| shop_id | shop_name | income | name     | address    | mob       |
+---------+-----------+--------+----------+------------+-----------+
|       1 | nani      |   2000 | tharun   | venkatapur |  23565556 |
|       2 | mobile    |  30000 | tharun   | mulugu     |      NULL |
|       3 | electric  |   NULL | tharun   | NULL       | 136754467 |
|       4 | rohith    |  20000 | tharun   | ven        |   6783738 |
|       5 | rohithhh  | 200500 | tharunnn | venka      | 689783738 |
+---------+-----------+--------+----------+------------+-----------+
5 rows in set (0.0013 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > rollback to a;
ERROR: 1305: SAVEPOINT a does not exist
 MySQL  localhost:33060+ ssl  tharun  SQL > rollback to savepoint a;
ERROR: 1305: SAVEPOINT a does not exist
 MySQL  localhost:33060+ ssl  tharun  SQL > set autocommit=0;
Query OK, 0 rows affected (0.0273 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > insert into  shop values(5,"rohithhh", 200500, "tharunnn", "venka", 689783738);
ERROR: 1062: Duplicate entry '5' for key 'shop.PRIMARY'
 MySQL  localhost:33060+ ssl  tharun  SQL > rollback to savepoint a;
ERROR: 1305: SAVEPOINT a does not exist
 MySQL  localhost:33060+ ssl  tharun  SQL > insert into  shop values(6,"rohithhhhh", 24500500, "ttharunnn", "vvenka", 6689783738);
ERROR: 1264: Out of range value for column 'mob' at row 1
 MySQL  localhost:33060+ ssl  tharun  SQL > insert into  shop values(6,"rohithhhhh", 24500500, "ttharunnn", "vvenka", 9783738);
Query OK, 1 row affected (0.0015 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > savepoint a;
Query OK, 0 rows affected (0.0240 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > insert into  shop values(7,"rohithharunhhh", 500, "nnn", "vveka", 83738);
ERROR: 3819: Check constraint 'shop_chk_1' is violated.
 MySQL  localhost:33060+ ssl  tharun  SQL > insert into  shop values(7,"rohithharunhhh", 5000, "nnn", "vveka", 83738);
Query OK, 1 row affected (0.0013 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > savepoint b;
Query OK, 0 rows affected (0.0010 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > rollback to a;
Query OK, 0 rows affected (0.0012 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > select *from shop
                                         -> ;
+---------+------------+----------+-----------+------------+-----------+
| shop_id | shop_name  | income   | name      | address    | mob       |
+---------+------------+----------+-----------+------------+-----------+
|       1 | nani       |     2000 | tharun    | venkatapur |  23565556 |
|       2 | mobile     |    30000 | tharun    | mulugu     |      NULL |
|       3 | electric   |     NULL | tharun    | NULL       | 136754467 |
|       4 | rohith     |    20000 | tharun    | ven        |   6783738 |
|       5 | rohithhh   |   200500 | tharunnn  | venka      | 689783738 |
|       6 | rohithhhhh | 24500500 | ttharunnn | vvenka     |   9783738 |
+---------+------------+----------+-----------+------------+-----------+
6 rows in set (0.0013 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > create user nani@localhost identified by "12345"
                                         -> ;
Query OK, 0 rows affected (0.0800 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > grant all on shop .* to nani@localhost;
Query OK, 0 rows affected (0.0415 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > \c nani@localhost
Creating a session to 'nani@localhost'
Please provide the password for 'nani@localhost': *****
Save password for 'nani@localhost'? [Y]es/[N]o/Ne[v]er (default No): yes
Fetching global names for auto-completion... Press ^C to stop.
Error during auto-completion cache update: Access denied; you need (at least one of) the PROCESS privilege(s) for this operation
Closing old connection...
Your MySQL connection id is 12 (X protocol)
Server version: 8.0.43 MySQL Community Server - GPL
No default schema selected; type \use <schema> to set one.
 MySQL  localhost:33060+ ssl  SQL > show databses;
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'databses' at line 1
 MySQL  localhost:33060+ ssl  SQL > show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| performance_schema |
+--------------------+
2 rows in set (0.0024 sec)
 MySQL  localhost:33060+ ssl  SQL > grant all on tharun.* to nani@localhost;
ERROR: 1044: Access denied for user 'nani'@'localhost' to database 'tharun'
 MySQL  localhost:33060+ ssl  SQL > grant all on tharun .* to nani@localhost;
ERROR: 1044: Access denied for user 'nani'@'localhost' to database 'tharun'
 MySQL  localhost:33060+ ssl  SQL > \c root@localhost
Creating a session to 'root@localhost'
Fetching global names for auto-completion... Press ^C to stop.
Closing old connection...
Your MySQL connection id is 13 (X protocol)
Server version: 8.0.43 MySQL Community Server - GPL
No default schema selected; type \use <schema> to set one.
 MySQL  localhost:33060+ ssl  SQL > grant all on tharun .* to nani@localhost;
Query OK, 0 rows affected (0.0385 sec)
 MySQL  localhost:33060+ ssl  SQL > \c nani@localhost
Creating a session to 'nani@localhost'
Fetching global names for auto-completion... Press ^C to stop.
Error during auto-completion cache update: Access denied; you need (at least one of) the PROCESS privilege(s) for this operation
Closing old connection...
Your MySQL connection id is 14 (X protocol)
Server version: 8.0.43 MySQL Community Server - GPL
No default schema selected; type \use <schema> to set one.
 MySQL  localhost:33060+ ssl  SQL > show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| performance_schema |
| tharun             |
+--------------------+
3 rows in set (0.0021 sec)
 MySQL  localhost:33060+ ssl  SQL > revoke create on tharun .* from nani@localhost;
ERROR: 1044: Access denied for user 'nani'@'localhost' to database 'tharun'
 MySQL  localhost:33060+ ssl  SQL > \c root@localhost
Creating a session to 'root@localhost'
Fetching global names for auto-completion... Press ^C to stop.
Closing old connection...
Your MySQL connection id is 15 (X protocol)
Server version: 8.0.43 MySQL Community Server - GPL
No default schema selected; type \use <schema> to set one.
 MySQL  localhost:33060+ ssl  SQL > revoke create on tharun .* from nani@localhost;
Query OK, 0 rows affected (0.0383 sec)
 MySQL  localhost:33060+ ssl  SQL > \c nani@localhost
Creating a session to 'nani@localhost'
Fetching global names for auto-completion... Press ^C to stop.
Error during auto-completion cache update: Access denied; you need (at least one of) the PROCESS privilege(s) for this operation
Closing old connection...
Your MySQL connection id is 16 (X protocol)
Server version: 8.0.43 MySQL Community Server - GPL
No default schema selected; type \use <schema> to set one.
 MySQL  localhost:33060+ ssl  SQL > show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| performance_schema |
| tharun             |
+--------------------+
3 rows in set (0.0022 sec)
 MySQL  localhost:33060+ ssl  SQL > \c root@localhost
Creating a session to 'root@localhost'
Fetching global names for auto-completion... Press ^C to stop.
Closing old connection...
Your MySQL connection id is 17 (X protocol)
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
| bool             |
| date_time        |
| info             |
| numeric_v        |
| profile          |
| shop             |
| strings          |
| studentpro       |
| students         |
+------------------+
9 rows in set (0.0036 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > select * from profile;
Empty set (0.0217 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > select * from info;
+-----------+-----+
| iname     | id  |
+-----------+-----+
| tharunn   | 100 |
| nanii     | 101 |
| tharunnnn | 102 |
+-----------+-----+
3 rows in set (0.0052 sec)
 MySQL  localhost:33060+ ssl  tharun  SQL > alter table info modify id int where iname=tharunn primarykey;
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where iname=tharunn primarykey' at line 1
 MySQL  localhost:33060+ ssl  tharun  SQL > alter table info modify id int primarykey;
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'primarykey' at line 1
 MySQL  localhost:33060+ ssl  tharun  SQL > alter table info modify id int primarykey;
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'primarykey' at line 1
 MySQL  localhost:33060+ ssl  tharun  SQL > alter table info modify id int primary key;
Query OK, 0 rows affected (0.1444 sec)

Records: 0  Duplicates: 0  Warnings: 0
 MySQL  localhost:33060+ ssl  tharun  SQL >