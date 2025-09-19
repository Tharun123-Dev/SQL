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
Your MySQL connection id is 9 (X protocol)
Server version: 8.0.43 MySQL Community Server - GPL
No default schema selected; type \use <schema> to set one.
 MySQL  localhost:33060+ ssl  SQL > show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| joins              |
| mysql              |
| nani               |
| performance_schema |
| sys                |
| tharun             |
| trigger            |
| triggers           |
+--------------------+
9 rows in set (0.0162 sec)
 MySQL  localhost:33060+ ssl  SQL > use joins
Default schema set to `joins`.
Fetching global names, object names from `joins` for auto-completion... Press ^C to stop.
 MySQL  localhost:33060+ ssl  joins  SQL > select* from emp;
+-------+--------+-----------+------------+------+---------+---------+--------+
| empno | ename  | job       | hiredate   | mgr  | sal     | comm    | deptno |
+-------+--------+-----------+------------+------+---------+---------+--------+
|  7369 | smith  | clerk     | 1980-12-17 | 7902 |  800.00 |    NULL |     20 |
|  7499 | allen  | salesman  | 1981-02-20 | 7698 | 1600.00 |  300.00 |     30 |
|  7521 | ward   | salesman  | 1981-02-22 | 7698 | 1250.00 |  500.00 |     30 |
|  7566 | jones  | manager   | 1981-04-02 | 7839 | 2975.00 |    NULL |     20 |
|  7654 | martin | salesman  | 1981-09-28 | 7698 | 1250.00 | 1400.00 |     30 |
|  7698 | blake  | manager   | 1981-05-01 | 7839 | 2850.00 |    NULL |     30 |
|  7782 | clark  | manager   | 1981-06-09 | 7839 | 2450.00 |    NULL |     10 |
|  7788 | scott  | analyst   | 1987-04-19 | 7566 | 3000.00 |    NULL |     20 |
|  7839 | king   | president | 1981-11-17 | NULL | 5000.00 |    NULL |     10 |
|  7844 | turner | salesman  | 1981-09-08 | 7698 | 1500.00 |    0.00 |     30 |
|  7876 | adams  | clerk     | 1987-05-23 | 7788 | 1100.00 |    NULL |     20 |
|  7900 | james  | clerk     | 1981-12-03 | 7698 |  950.00 |    NULL |     30 |
|  7902 | ford   | analyst   | 1981-12-03 | 7566 | 3000.00 |    NULL |     20 |
|  7934 | miller | clerk     | 1982-01-23 | 7782 | 1300.00 |    NULL |     10 |
+-------+--------+-----------+------------+------+---------+---------+--------+
14 rows in set (0.0229 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > slect min(sal) from emp;
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'slect min(sal) from emp' at line 1
 MySQL  localhost:33060+ ssl  joins  SQL > select min(sal) from emp;
+----------+
| min(sal) |
+----------+
|   800.00 |
+----------+
1 row in set (0.0012 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select count(sal) from emp;
+------------+
| count(sal) |
+------------+
|         14 |
+------------+
1 row in set (0.0013 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select avg(sal) from emp;
+-------------+
| avg(sal)    |
+-------------+
| 2073.214286 |
+-------------+
1 row in set (0.0013 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select sum(sal) from emp;
+----------+
| sum(sal) |
+----------+
| 29025.00 |
+----------+
1 row in set (0.0012 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select max(sal) from emp;
+----------+
| max(sal) |
+----------+
|  5000.00 |
+----------+
1 row in set (0.0012 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select avg(sal) from emp group by deptno;
+-------------+
| avg(sal)    |
+-------------+
| 2916.666667 |
| 2175.000000 |
| 1566.666667 |
+-------------+
3 rows in set (0.0247 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select deptno,avg(sal) from emp group by deptno;
+--------+-------------+
| deptno | avg(sal)    |
+--------+-------------+
|     10 | 2916.666667 |
|     20 | 2175.000000 |
|     30 | 1566.666667 |
+--------+-------------+
3 rows in set (0.0014 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select deptno,max(sal) from emp group by job;
ERROR: 1055: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'joins.emp.deptno' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
 MySQL  localhost:33060+ ssl  joins  SQL > select job,max(sal) from emp group by job;
+-----------+----------+
| job       | max(sal) |
+-----------+----------+
| clerk     |  1300.00 |
| salesman  |  1600.00 |
| manager   |  2975.00 |
| analyst   |  3000.00 |
| president |  5000.00 |
+-----------+----------+
5 rows in set (0.0015 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select job,min(sal) from emp group by job;
+-----------+----------+
| job       | min(sal) |
+-----------+----------+
| clerk     |   800.00 |
| salesman  |  1250.00 |
| manager   |  2450.00 |
| analyst   |  3000.00 |
| president |  5000.00 |
+-----------+----------+
5 rows in set (0.0016 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select job,min(sal) from emp group by job having sal=1250;
ERROR: 1054: Unknown column 'sal' in 'having clause'
 MySQL  localhost:33060+ ssl  joins  SQL > select job,min(sal) from emp group by job having sal>1000;
ERROR: 1054: Unknown column 'sal' in 'having clause'
 MySQL  localhost:33060+ ssl  joins  SQL > select job,count(sal) from emp group by job;
+-----------+------------+
| job       | count(sal) |
+-----------+------------+
| clerk     |          4 |
| salesman  |          4 |
| manager   |          3 |
| analyst   |          2 |
| president |          1 |
+-----------+------------+
5 rows in set (0.0013 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select job,count(*) from emp group by job;
+-----------+----------+
| job       | count(*) |
+-----------+----------+
| clerk     |        4 |
| salesman  |        4 |
| manager   |        3 |
| analyst   |        2 |
| president |        1 |
+-----------+----------+
5 rows in set (0.0014 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select job,count(*) from emp group by job having job=;
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
 MySQL  localhost:33060+ ssl  joins  SQL > select job,count(*) from emp group by job having job="clerk";
+-------+----------+
| job   | count(*) |
+-------+----------+
| clerk |        4 |
+-------+----------+
1 row in set (0.0012 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select job,avg(sal) from emp group by job having avg(sal)>2000;
+-----------+-------------+
| job       | avg(sal)    |
+-----------+-------------+
| manager   | 2758.333333 |
| analyst   | 3000.000000 |
| president | 5000.000000 |
+-----------+-------------+
3 rows in set (0.0259 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select * from emp having sal>2000;
+-------+-------+-----------+------------+------+---------+------+--------+
| empno | ename | job       | hiredate   | mgr  | sal     | comm | deptno |
+-------+-------+-----------+------------+------+---------+------+--------+
|  7566 | jones | manager   | 1981-04-02 | 7839 | 2975.00 | NULL |     20 |
|  7698 | blake | manager   | 1981-05-01 | 7839 | 2850.00 | NULL |     30 |
|  7782 | clark | manager   | 1981-06-09 | 7839 | 2450.00 | NULL |     10 |
|  7788 | scott | analyst   | 1987-04-19 | 7566 | 3000.00 | NULL |     20 |
|  7839 | king  | president | 1981-11-17 | NULL | 5000.00 | NULL |     10 |
|  7902 | ford  | analyst   | 1981-12-03 | 7566 | 3000.00 | NULL |     20 |
+-------+-------+-----------+------------+------+---------+------+--------+
6 rows in set (0.0249 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select * from emp having sal>20000;
Empty set (0.0013 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select * from emp having sal>200;
+-------+--------+-----------+------------+------+---------+---------+--------+
| empno | ename  | job       | hiredate   | mgr  | sal     | comm    | deptno |
+-------+--------+-----------+------------+------+---------+---------+--------+
|  7369 | smith  | clerk     | 1980-12-17 | 7902 |  800.00 |    NULL |     20 |
|  7499 | allen  | salesman  | 1981-02-20 | 7698 | 1600.00 |  300.00 |     30 |
|  7521 | ward   | salesman  | 1981-02-22 | 7698 | 1250.00 |  500.00 |     30 |
|  7566 | jones  | manager   | 1981-04-02 | 7839 | 2975.00 |    NULL |     20 |
|  7654 | martin | salesman  | 1981-09-28 | 7698 | 1250.00 | 1400.00 |     30 |
|  7698 | blake  | manager   | 1981-05-01 | 7839 | 2850.00 |    NULL |     30 |
|  7782 | clark  | manager   | 1981-06-09 | 7839 | 2450.00 |    NULL |     10 |
|  7788 | scott  | analyst   | 1987-04-19 | 7566 | 3000.00 |    NULL |     20 |
|  7839 | king   | president | 1981-11-17 | NULL | 5000.00 |    NULL |     10 |
|  7844 | turner | salesman  | 1981-09-08 | 7698 | 1500.00 |    0.00 |     30 |
|  7876 | adams  | clerk     | 1987-05-23 | 7788 | 1100.00 |    NULL |     20 |
|  7900 | james  | clerk     | 1981-12-03 | 7698 |  950.00 |    NULL |     30 |
|  7902 | ford   | analyst   | 1981-12-03 | 7566 | 3000.00 |    NULL |     20 |
|  7934 | miller | clerk     | 1982-01-23 | 7782 | 1300.00 |    NULL |     10 |
+-------+--------+-----------+------------+------+---------+---------+--------+
14 rows in set (0.0014 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > slect * from emp where "1981-01-01"<hiredate;
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'slect * from emp where "1981-01-01"<hiredate' at line 1
 MySQL  localhost:33060+ ssl  joins  SQL > slect * from emp where hiredate>"1981-01-01;
                                        "> select * from emp having sal>200;^C
 MySQL  localhost:33060+ ssl  joins  SQL > select * from emp where "1981-01-01"<hiredate;
+-------+--------+-----------+------------+------+---------+---------+--------+
| empno | ename  | job       | hiredate   | mgr  | sal     | comm    | deptno |
+-------+--------+-----------+------------+------+---------+---------+--------+
|  7499 | allen  | salesman  | 1981-02-20 | 7698 | 1600.00 |  300.00 |     30 |
|  7521 | ward   | salesman  | 1981-02-22 | 7698 | 1250.00 |  500.00 |     30 |
|  7566 | jones  | manager   | 1981-04-02 | 7839 | 2975.00 |    NULL |     20 |
|  7654 | martin | salesman  | 1981-09-28 | 7698 | 1250.00 | 1400.00 |     30 |
|  7698 | blake  | manager   | 1981-05-01 | 7839 | 2850.00 |    NULL |     30 |
|  7782 | clark  | manager   | 1981-06-09 | 7839 | 2450.00 |    NULL |     10 |
|  7788 | scott  | analyst   | 1987-04-19 | 7566 | 3000.00 |    NULL |     20 |
|  7839 | king   | president | 1981-11-17 | NULL | 5000.00 |    NULL |     10 |
|  7844 | turner | salesman  | 1981-09-08 | 7698 | 1500.00 |    0.00 |     30 |
|  7876 | adams  | clerk     | 1987-05-23 | 7788 | 1100.00 |    NULL |     20 |
|  7900 | james  | clerk     | 1981-12-03 | 7698 |  950.00 |    NULL |     30 |
|  7902 | ford   | analyst   | 1981-12-03 | 7566 | 3000.00 |    NULL |     20 |
|  7934 | miller | clerk     | 1982-01-23 | 7782 | 1300.00 |    NULL |     10 |
+-------+--------+-----------+------------+------+---------+---------+--------+
13 rows in set (0.0247 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select * from emp order by asc;
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'asc' at line 1
 MySQL  localhost:33060+ ssl  joins  SQL > select * from emp order by sal(asc);
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'asc)' at line 1
 MySQL  localhost:33060+ ssl  joins  SQL > select * from emp order by sal;
+-------+--------+-----------+------------+------+---------+---------+--------+
| empno | ename  | job       | hiredate   | mgr  | sal     | comm    | deptno |
+-------+--------+-----------+------------+------+---------+---------+--------+
|  7369 | smith  | clerk     | 1980-12-17 | 7902 |  800.00 |    NULL |     20 |
|  7900 | james  | clerk     | 1981-12-03 | 7698 |  950.00 |    NULL |     30 |
|  7876 | adams  | clerk     | 1987-05-23 | 7788 | 1100.00 |    NULL |     20 |
|  7521 | ward   | salesman  | 1981-02-22 | 7698 | 1250.00 |  500.00 |     30 |
|  7654 | martin | salesman  | 1981-09-28 | 7698 | 1250.00 | 1400.00 |     30 |
|  7934 | miller | clerk     | 1982-01-23 | 7782 | 1300.00 |    NULL |     10 |
|  7844 | turner | salesman  | 1981-09-08 | 7698 | 1500.00 |    0.00 |     30 |
|  7499 | allen  | salesman  | 1981-02-20 | 7698 | 1600.00 |  300.00 |     30 |
|  7782 | clark  | manager   | 1981-06-09 | 7839 | 2450.00 |    NULL |     10 |
|  7698 | blake  | manager   | 1981-05-01 | 7839 | 2850.00 |    NULL |     30 |
|  7566 | jones  | manager   | 1981-04-02 | 7839 | 2975.00 |    NULL |     20 |
|  7788 | scott  | analyst   | 1987-04-19 | 7566 | 3000.00 |    NULL |     20 |
|  7902 | ford   | analyst   | 1981-12-03 | 7566 | 3000.00 |    NULL |     20 |
|  7839 | king   | president | 1981-11-17 | NULL | 5000.00 |    NULL |     10 |
+-------+--------+-----------+------------+------+---------+---------+--------+
14 rows in set (0.0017 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select * from emp order by sal desc;
+-------+--------+-----------+------------+------+---------+---------+--------+
| empno | ename  | job       | hiredate   | mgr  | sal     | comm    | deptno |
+-------+--------+-----------+------------+------+---------+---------+--------+
|  7839 | king   | president | 1981-11-17 | NULL | 5000.00 |    NULL |     10 |
|  7788 | scott  | analyst   | 1987-04-19 | 7566 | 3000.00 |    NULL |     20 |
|  7902 | ford   | analyst   | 1981-12-03 | 7566 | 3000.00 |    NULL |     20 |
|  7566 | jones  | manager   | 1981-04-02 | 7839 | 2975.00 |    NULL |     20 |
|  7698 | blake  | manager   | 1981-05-01 | 7839 | 2850.00 |    NULL |     30 |
|  7782 | clark  | manager   | 1981-06-09 | 7839 | 2450.00 |    NULL |     10 |
|  7499 | allen  | salesman  | 1981-02-20 | 7698 | 1600.00 |  300.00 |     30 |
|  7844 | turner | salesman  | 1981-09-08 | 7698 | 1500.00 |    0.00 |     30 |
|  7934 | miller | clerk     | 1982-01-23 | 7782 | 1300.00 |    NULL |     10 |
|  7521 | ward   | salesman  | 1981-02-22 | 7698 | 1250.00 |  500.00 |     30 |
|  7654 | martin | salesman  | 1981-09-28 | 7698 | 1250.00 | 1400.00 |     30 |
|  7876 | adams  | clerk     | 1987-05-23 | 7788 | 1100.00 |    NULL |     20 |
|  7900 | james  | clerk     | 1981-12-03 | 7698 |  950.00 |    NULL |     30 |
|  7369 | smith  | clerk     | 1980-12-17 | 7902 |  800.00 |    NULL |     20 |
+-------+--------+-----------+------------+------+---------+---------+--------+
14 rows in set (0.0013 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select job,avg(sal) from emp group by job;
+-----------+-------------+
| job       | avg(sal)    |
+-----------+-------------+
| clerk     | 1037.500000 |
| salesman  | 1400.000000 |
| manager   | 2758.333333 |
| analyst   | 3000.000000 |
| president | 5000.000000 |
+-----------+-------------+
5 rows in set (0.0015 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select deptno, avg(sal) from emp where avg(sal)>2000;
ERROR: 1111: Invalid use of group function
 MySQL  localhost:33060+ ssl  joins  SQL > select deptno,avg(sal) from emp group by deptno having avg(sal)>2000;
+--------+-------------+
| deptno | avg(sal)    |
+--------+-------------+
|     10 | 2916.666667 |
|     20 | 2175.000000 |
+--------+-------------+
2 rows in set (0.0014 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select * from emp limit 5;
+-------+--------+----------+------------+------+---------+---------+--------+
| empno | ename  | job      | hiredate   | mgr  | sal     | comm    | deptno |
+-------+--------+----------+------------+------+---------+---------+--------+
|  7369 | smith  | clerk    | 1980-12-17 | 7902 |  800.00 |    NULL |     20 |
|  7499 | allen  | salesman | 1981-02-20 | 7698 | 1600.00 |  300.00 |     30 |
|  7521 | ward   | salesman | 1981-02-22 | 7698 | 1250.00 |  500.00 |     30 |
|  7566 | jones  | manager  | 1981-04-02 | 7839 | 2975.00 |    NULL |     20 |
|  7654 | martin | salesman | 1981-09-28 | 7698 | 1250.00 | 1400.00 |     30 |
+-------+--------+----------+------------+------+---------+---------+--------+
5 rows in set (0.0018 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select * from emp limit 5 offset 1;
+-------+--------+----------+------------+------+---------+---------+--------+
| empno | ename  | job      | hiredate   | mgr  | sal     | comm    | deptno |
+-------+--------+----------+------------+------+---------+---------+--------+
|  7499 | allen  | salesman | 1981-02-20 | 7698 | 1600.00 |  300.00 |     30 |
|  7521 | ward   | salesman | 1981-02-22 | 7698 | 1250.00 |  500.00 |     30 |
|  7566 | jones  | manager  | 1981-04-02 | 7839 | 2975.00 |    NULL |     20 |
|  7654 | martin | salesman | 1981-09-28 | 7698 | 1250.00 | 1400.00 |     30 |
|  7698 | blake  | manager  | 1981-05-01 | 7839 | 2850.00 |    NULL |     30 |
+-------+--------+----------+------------+------+---------+---------+--------+
5 rows in set (0.0012 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select ename,sal order by sal desc limit 5 offset 3;
ERROR: 1054: Unknown column 'ename' in 'field list'
 MySQL  localhost:33060+ ssl  joins  SQL > select ename,sal from emp order by sal desc limit 5 offset 3;
+--------+---------+
| ename  | sal     |
+--------+---------+
| jones  | 2975.00 |
| blake  | 2850.00 |
| clark  | 2450.00 |
| allen  | 1600.00 |
| turner | 1500.00 |
+--------+---------+
5 rows in set (0.0015 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select deptno,count(*) from emp group by deptno order by count desc;
ERROR: 1054: Unknown column 'count' in 'order clause'
 MySQL  localhost:33060+ ssl  joins  SQL > select deptno,count(*) from emp group by deptno order by count(*) desc;
+--------+----------+
| deptno | count(*) |
+--------+----------+
|     30 |        6 |
|     20 |        5 |
|     10 |        3 |
+--------+----------+
3 rows in set (0.0014 sec)
 MySQL  localhost:33060+ ssl  joins  SQL >