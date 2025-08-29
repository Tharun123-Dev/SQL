
Copyright (c) 2016, 2025, Oracle and/or its affiliates.
Oracle is a registered trademark of Oracle Corporation and/or its affiliates.
Other names may be trademarks of their respective owners.

Type '\help' or '\?' for help; '\quit' to exit.
 MySQL  JS > \sql
Switching to SQL mode... Commands end with ;
 MySQL  SQL > \c root@localhost
Creating a session to 'root@localhost'
Fetching global names for auto-completion... Press ^C to stop.
Your MySQL connection id is 58 (X protocol)
Server version: 8.0.43 MySQL Community Server - GPL
No default schema selected; type \use <schema> to set one.
 MySQL  localhost:33060+ ssl  SQL > use joins
Default schema set to `joins`.
Fetching global names, object names from `joins` for auto-completion... Press ^C to stop.
 MySQL  localhost:33060+ ssl  joins  SQL > select *from emp;
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
14 rows in set (0.0020 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select name, sal from emp where sal > (select avg(sal) from emp);
ERROR: 1054: Unknown column 'name' in 'field list'
 MySQL  localhost:33060+ ssl  joins  SQL > select ename, sal from emp where sal > (select avg(sal) from emp);
+-------+---------+
| ename | sal     |
+-------+---------+
| jones | 2975.00 |
| blake | 2850.00 |
| clark | 2450.00 |
| scott | 3000.00 |
| king  | 5000.00 |
| ford  | 3000.00 |
+-------+---------+
6 rows in set (0.0017 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select avg(sal) from emp;
+-------------+
| avg(sal)    |
+-------------+
| 2073.214286 |
+-------------+
1 row in set (0.0011 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select * from dept;
+--------+------------+----------+
| DEPTNO | DNAME      | LOC      |
+--------+------------+----------+
|     10 | accounting | new york |
|     20 | research   | dallas   |
|     30 | sales      | chicago  |
|     40 | operations | boston   |
+--------+------------+----------+
4 rows in set (0.0023 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select ename, deptno from emp where deptno in (select deptno from dept where loc in ("chicago", "new york"));
+--------+--------+
| ename  | deptno |
+--------+--------+
| clark  |     10 |
| king   |     10 |
| miller |     10 |
| allen  |     30 |
| ward   |     30 |
| martin |     30 |
| blake  |     30 |
| turner |     30 |
| james  |     30 |
+--------+--------+
9 rows in set (0.0021 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select ename, sal from emp where sal > all (select deptno from dept where dept=30);
ERROR: 1054: Unknown column 'dept' in 'where clause'
 MySQL  localhost:33060+ ssl  joins  SQL > select ename, sal from emp where sal > all (select deptno from dept where deptno=30);
+--------+---------+
| ename  | sal     |
+--------+---------+
| smith  |  800.00 |
| allen  | 1600.00 |
| ward   | 1250.00 |
| jones  | 2975.00 |
| martin | 1250.00 |
| blake  | 2850.00 |
| clark  | 2450.00 |
| scott  | 3000.00 |
| king   | 5000.00 |
| turner | 1500.00 |
| adams  | 1100.00 |
| james  |  950.00 |
| ford   | 3000.00 |
| miller | 1300.00 |
+--------+---------+
14 rows in set (0.0018 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select ename, sal from emp where sal > any (select deptno from dept where deptno=30);
+--------+---------+
| ename  | sal     |
+--------+---------+
| smith  |  800.00 |
| allen  | 1600.00 |
| ward   | 1250.00 |
| jones  | 2975.00 |
| martin | 1250.00 |
| blake  | 2850.00 |
| clark  | 2450.00 |
| scott  | 3000.00 |
| king   | 5000.00 |
| turner | 1500.00 |
| adams  | 1100.00 |
| james  |  950.00 |
| ford   | 3000.00 |
| miller | 1300.00 |
+--------+---------+
14 rows in set (0.0244 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select e.ename, e.sal, e.deptno from emp e where e.sal > (select avg(sal) from emp where deptno=e.deptno);
+-------+---------+--------+
| ename | sal     | deptno |
+-------+---------+--------+
| allen | 1600.00 |     30 |
| jones | 2975.00 |     20 |
| blake | 2850.00 |     30 |
| scott | 3000.00 |     20 |
| king  | 5000.00 |     10 |
| ford  | 3000.00 |     20 |
+-------+---------+--------+
6 rows in set (0.0027 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > selecet * from dept;
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'selecet * from dept' at line 1
 MySQL  localhost:33060+ ssl  joins  SQL > select * from dept;
+--------+------------+----------+
| DEPTNO | DNAME      | LOC      |
+--------+------------+----------+
|     10 | accounting | new york |
|     20 | research   | dallas   |
|     30 | sales      | chicago  |
|     40 | operations | boston   |
+--------+------------+----------+
4 rows in set (0.0014 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select * from emp;
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
 MySQL  localhost:33060+ ssl  joins  SQL > select ename, sal from emp where sal = (select max(sal) from emp where sal < (select max(sal) from emp ));
+-------+---------+
| ename | sal     |
+-------+---------+
| scott | 3000.00 |
| ford  | 3000.00 |
+-------+---------+
2 rows in set (0.0093 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select name, sal from emp where sal > (select avg(sal) from emp);
ERROR: 1054: Unknown column 'name' in 'field list'
 MySQL  localhost:33060+ ssl  joins  SQL > select ename, sal from emp where sal > (select avg(sal) from emp);
+-------+---------+
| ename | sal     |
+-------+---------+
| jones | 2975.00 |
| blake | 2850.00 |
| clark | 2450.00 |
| scott | 3000.00 |
| king  | 5000.00 |
| ford  | 3000.00 |
+-------+---------+
6 rows in set (0.0014 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select name, sal comm from emp where (sal, comm) in (select sal, comm from emp where deptno=20);
ERROR: 1054: Unknown column 'name' in 'field list'
 MySQL  localhost:33060+ ssl  joins  SQL > select ename, sal comm from emp where (sal, comm) in (select sal, comm from emp where deptno=20);
Empty set (0.0019 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select ename, sal comm from emp where (sal, comm) in (select sal, comm from emp where deptno=10);
Empty set (0.0010 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select ename, sal comm from emp where (sal, comm) in (select sal, comm from emp where deptno=30);
+--------+---------+
| ename  | comm    |
+--------+---------+
| allen  | 1600.00 |
| ward   | 1250.00 |
| martin | 1250.00 |
| turner | 1500.00 |
+--------+---------+
4 rows in set (0.0018 sec)
 MySQL  localhost:33060+ ssl  joins  SQL >



