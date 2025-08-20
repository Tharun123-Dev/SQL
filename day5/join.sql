

Copyright (c) 2016, 2025, Oracle and/or its affiliates.
Oracle is a registered trademark of Oracle Corporation and/or its affiliates.
Other names may be trademarks of their respective owners.

Type '\help' or '\?' for help; '\quit' to exit.
 MySQL  JS > \sql
Switching to SQL mode... Commands end with ;
 MySQL  SQL > \ c root@localhost
Unknown command: '\ c root@localhost'
 MySQL  SQL > \c root@localhost
Creating a session to 'root@localhost'
Fetching global names for auto-completion... Press ^C to stop.
Your MySQL connection id is 32 (X protocol)
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
6 rows in set (0.0028 sec)
 MySQL  localhost:33060+ ssl  SQL > use nani
Default schema set to `nani`.
Fetching global names, object names from `nani` for auto-completion... Press ^C to stop.
 MySQL  localhost:33060+ ssl  nani  SQL > show tables
                                       -> ;
+----------------+
| Tables_in_nani |
+----------------+
| employees      |
| std            |
+----------------+
2 rows in set (0.0030 sec)
 MySQL  localhost:33060+ ssl  nani  SQL > select * from employees;
+--------+-----+---------+------------+
| name   | id  | salary  | dob        |
+--------+-----+---------+------------+
| nani   | 234 |    NULL | NULL       |
| tharun | 343 |  300000 | NULL       |
| Arun   | 424 | 2433234 | NULL       |
| rakhi  | 455 |  567899 | 2025-05-02 |
+--------+-----+---------+------------+
4 rows in set (0.0517 sec)
 MySQL  localhost:33060+ ssl  nani  SQL > -- Create table
Query OK, 0 rows affected (0.0008 sec)
 MySQL  localhost:33060+ ssl  nani  SQL > CREATE TABLE EMP (
                                       ->     EMPNO INT PRIMARY KEY,
                                       ->     ENAME VARCHAR(20),
                                       ->     JOB VARCHAR(20),
                                       ->     HIREDATE DATE,
                                       ->     MGR INT,
                                       ->     SAL DECIMAL(10,2),
                                       ->     COMM DECIMAL(10,2),
                                       ->     DEPTNO INT
                                       -> );
Query OK, 0 rows affected (0.0483 sec)
 MySQL  localhost:33060+ ssl  nani  SQL >
 MySQL  localhost:33060+ ssl  nani  SQL > -- Insert data
Query OK, 0 rows affected (0.0008 sec)
 MySQL  localhost:33060+ ssl  nani  SQL > INSERT INTO EMP (EMPNO, ENAME, JOB, HIREDATE, MGR, SAL, COMM, DEPTNO) VALUES
                                       -> (7369, 'SMITH', 'CLERK', '1980-12-17', 7902, 800,  NULL, 20),
                                       -> (7499, 'ALLEN', 'SALESMAN', '1981-02-20', 7698, 1600, 300, 30),
                                       -> (7521, 'WARD', 'SALESMAN', '1981-02-22', 7698, 1250, 500, 30),
                                       -> (7566, 'JONES', 'MANAGER', '1981-04-02', 7839, 2975, NULL, 20),
                                       -> (7654, 'MARTIN', 'SALESMAN', '1981-09-28', 7698, 1250, 1400, 30),
                                       -> (7698, 'BLAKE', 'MANAGER', '1981-05-01', 7839, 2850, NULL, 30),
                                       -> (7782, 'CLARK', 'MANAGER', '1981-06-09', 7839, 2450, NULL, 10),
                                       -> (7788, 'SCOTT', 'ANALYST', '1987-04-19', 7566, 3000, NULL, 20),
                                       -> (7839, 'KING', 'PRESIDENT', '1981-11-17', NULL, 5000, NULL, 10),
                                       -> (7844, 'TURNER', 'SALESMAN', '1981-09-08', 7698, 1500, 0, 30),
                                       -> (7876, 'ADAMS', 'CLERK', '1987-05-23', 7788, 1100, NULL, 20),
                                       -> (7900, 'JAMES', 'CLERK', '1981-12-03', 7698, 950, NULL, 30),
                                       -> (7902, 'FORD', 'ANALYST', '1981-12-03', 7566, 3000, NULL, 20),
                                       -> (7934, 'MILLER', 'CLERK', '1982-01-23', 7782, 1300, NULL, 10);
Query OK, 14 rows affected (0.0343 sec)

Records: 14  Duplicates: 0  Warnings: 0
 MySQL  localhost:33060+ ssl  nani  SQL > select * from emp;
+-------+--------+-----------+------------+------+---------+---------+--------+
| EMPNO | ENAME  | JOB       | HIREDATE   | MGR  | SAL     | COMM    | DEPTNO |
+-------+--------+-----------+------------+------+---------+---------+--------+
|  7369 | SMITH  | CLERK     | 1980-12-17 | 7902 |  800.00 |    NULL |     20 |
|  7499 | ALLEN  | SALESMAN  | 1981-02-20 | 7698 | 1600.00 |  300.00 |     30 |
|  7521 | WARD   | SALESMAN  | 1981-02-22 | 7698 | 1250.00 |  500.00 |     30 |
|  7566 | JONES  | MANAGER   | 1981-04-02 | 7839 | 2975.00 |    NULL |     20 |
|  7654 | MARTIN | SALESMAN  | 1981-09-28 | 7698 | 1250.00 | 1400.00 |     30 |
|  7698 | BLAKE  | MANAGER   | 1981-05-01 | 7839 | 2850.00 |    NULL |     30 |
|  7782 | CLARK  | MANAGER   | 1981-06-09 | 7839 | 2450.00 |    NULL |     10 |
|  7788 | SCOTT  | ANALYST   | 1987-04-19 | 7566 | 3000.00 |    NULL |     20 |
|  7839 | KING   | PRESIDENT | 1981-11-17 | NULL | 5000.00 |    NULL |     10 |
|  7844 | TURNER | SALESMAN  | 1981-09-08 | 7698 | 1500.00 |    0.00 |     30 |
|  7876 | ADAMS  | CLERK     | 1987-05-23 | 7788 | 1100.00 |    NULL |     20 |
|  7900 | JAMES  | CLERK     | 1981-12-03 | 7698 |  950.00 |    NULL |     30 |
|  7902 | FORD   | ANALYST   | 1981-12-03 | 7566 | 3000.00 |    NULL |     20 |
|  7934 | MILLER | CLERK     | 1982-01-23 | 7782 | 1300.00 |    NULL |     10 |
+-------+--------+-----------+------------+------+---------+---------+--------+
14 rows in set (0.0014 sec)
 MySQL  localhost:33060+ ssl  nani  SQL > create table department (dno int primarykey , dname varchar(60) not null, foreign key (empno) references emp (empno);
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'primarykey , dname varchar(60) not null, foreign key (empno) references emp (emp' at line 1
 MySQL  localhost:33060+ ssl  nani  SQL > create table department (dno int primarykey , dname varchar(60) not null, foreign key (empno) references emp(empno);
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'primarykey , dname varchar(60) not null, foreign key (empno) references emp(empn' at line 1
 MySQL  localhost:33060+ ssl  nani  SQL > create table department (dno int primary key , dname varchar(60) not null, foreign key (empno) references emp(empno);
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
 MySQL  localhost:33060+ ssl  nani  SQL > create table department (dno int primary key, dname varchar(60) not null, foreign key (empno) references emp(empno);
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
 MySQL  localhost:33060+ ssl  nani  SQL > create table department(dno int primary key, dname varchar(60) not null, foreign key (empno) references emp(empno);
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
 MySQL  localhost:33060+ ssl  nani  SQL > create table department(dno int primary key, dname varchar(60) not null, empnoint  foreign key (empno) references emp (empno);
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'foreign key (empno) references emp (empno)' at line 1
 MySQL  localhost:33060+ ssl  nani  SQL > create table department(dno int primary key, dname varchar(60) not null, empnoint, foreign key (empno) references emp (empno);
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ', foreign key (empno) references emp (empno)' at line 1
 MySQL  localhost:33060+ ssl  nani  SQL > create table department(dno int primary key, dname varchar(60) not null, empnoint, foreign key (empno) references emp(empno);
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ', foreign key (empno) references emp(empno)' at line 1
 MySQL  localhost:33060+ ssl  nani  SQL > create table department(dno int primary key, dname varchar(60) not null, empnoint, foreign key (empno) references emp(empno));
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ', foreign key (empno) references emp(empno))' at line 1
 MySQL  localhost:33060+ ssl  nani  SQL > create table department(dno int primary key, dname varchar(60) not null, empnoint, foreign key (empno) references emp(empno));
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ', foreign key (empno) references emp(empno))' at line 1
 MySQL  localhost:33060+ ssl  nani  SQL > create table department(dno int primary key, dname varchar(60) not null, empnoint, foreign key (empno) references emp(empno) );
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ', foreign key (empno) references emp(empno) )' at line 1
 MySQL  localhost:33060+ ssl  nani  SQL > create table department(dno int primary key, dname varchar(60) not null, empnoint, foreign key (empno) references emp(empno) );
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ', foreign key (empno) references emp(empno) )' at line 1
 MySQL  localhost:33060+ ssl  nani  SQL > create table department(
                                       ->   dno int primary key,
                                       ->   dname varchar(60) not null,
                                       ->   empno int,
                                       ->   foreign key (empno) references emp(empno)
                                       -> );
Query OK, 0 rows affected (0.0645 sec)
 MySQL  localhost:33060+ ssl  nani  SQL > select * from emp;
+-------+--------+-----------+------------+------+---------+---------+--------+
| EMPNO | ENAME  | JOB       | HIREDATE   | MGR  | SAL     | COMM    | DEPTNO |
+-------+--------+-----------+------------+------+---------+---------+--------+
|  7369 | SMITH  | CLERK     | 1980-12-17 | 7902 |  800.00 |    NULL |     20 |
|  7499 | ALLEN  | SALESMAN  | 1981-02-20 | 7698 | 1600.00 |  300.00 |     30 |
|  7521 | WARD   | SALESMAN  | 1981-02-22 | 7698 | 1250.00 |  500.00 |     30 |
|  7566 | JONES  | MANAGER   | 1981-04-02 | 7839 | 2975.00 |    NULL |     20 |
|  7654 | MARTIN | SALESMAN  | 1981-09-28 | 7698 | 1250.00 | 1400.00 |     30 |
|  7698 | BLAKE  | MANAGER   | 1981-05-01 | 7839 | 2850.00 |    NULL |     30 |
|  7782 | CLARK  | MANAGER   | 1981-06-09 | 7839 | 2450.00 |    NULL |     10 |
|  7788 | SCOTT  | ANALYST   | 1987-04-19 | 7566 | 3000.00 |    NULL |     20 |
|  7839 | KING   | PRESIDENT | 1981-11-17 | NULL | 5000.00 |    NULL |     10 |
|  7844 | TURNER | SALESMAN  | 1981-09-08 | 7698 | 1500.00 |    0.00 |     30 |
|  7876 | ADAMS  | CLERK     | 1987-05-23 | 7788 | 1100.00 |    NULL |     20 |
|  7900 | JAMES  | CLERK     | 1981-12-03 | 7698 |  950.00 |    NULL |     30 |
|  7902 | FORD   | ANALYST   | 1981-12-03 | 7566 | 3000.00 |    NULL |     20 |
|  7934 | MILLER | CLERK     | 1982-01-23 | 7782 | 1300.00 |    NULL |     10 |
+-------+--------+-----------+------------+------+---------+---------+--------+
14 rows in set (0.0041 sec)
 MySQL  localhost:33060+ ssl  nani  SQL > select * from department;
Empty set (0.0027 sec)
 MySQL  localhost:33060+ ssl  nani  SQL > insert into department (dno, dname, empno)
                                       -> values (10, 'Accounts', 7902);
Query OK, 1 row affected (0.0289 sec)
 MySQL  localhost:33060+ ssl  nani  SQL >
 MySQL  localhost:33060+ ssl  nani  SQL > insert into department (dno, dname, empno)
                                       -> values (20, 'Research', 7566);
Query OK, 1 row affected (0.0053 sec)
 MySQL  localhost:33060+ ssl  nani  SQL >
 MySQL  localhost:33060+ ssl  nani  SQL > insert into department (dno, dname, empno)
                                       -> values (30, 'Sales', 7698);
Query OK, 1 row affected (0.0045 sec)
 MySQL  localhost:33060+ ssl  nani  SQL >
 MySQL  localhost:33060+ ssl  nani  SQL > insert into department (dno, dname, empno)
                                       -> values (40, 'Operations', 7782);
Query OK, 1 row affected (0.0293 sec)
 MySQL  localhost:33060+ ssl  nani  SQL > select * from department;
+-----+------------+-------+
| dno | dname      | empno |
+-----+------------+-------+
|  10 | Accounts   |  7902 |
|  20 | Research   |  7566 |
|  30 | Sales      |  7698 |
|  40 | Operations |  7782 |
+-----+------------+-------+
4 rows in set (0.0013 sec)
 MySQL  localhost:33060+ ssl  nani  SQL > select ename,job from emp join dep
                                       -> select * from department;
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'select * from department' at line 2
 MySQL  localhost:33060+ ssl  nani  SQL > select e.name, e.job from emp e
                                       -> inner join empt d
                                       -> on d.empno=e.empno;
ERROR: 1146: Table 'nani.empt' doesn't exist
 MySQL  localhost:33060+ ssl  nani  SQL > select e.name, e.job from emp e  inner join emp d on d.empno=e.empno;
ERROR: 1054: Unknown column 'e.name' in 'field list'
 MySQL  localhost:33060+ ssl  nani  SQL > select e.ename, e.job from emp e  inner join emp d on d.empno=e.empno;
+--------+-----------+
| ename  | job       |
+--------+-----------+
| SMITH  | CLERK     |
| ALLEN  | SALESMAN  |
| WARD   | SALESMAN  |
| JONES  | MANAGER   |
| MARTIN | SALESMAN  |
| BLAKE  | MANAGER   |
| CLARK  | MANAGER   |
| SCOTT  | ANALYST   |
| KING   | PRESIDENT |
| TURNER | SALESMAN  |
| ADAMS  | CLERK     |
| JAMES  | CLERK     |
| FORD   | ANALYST   |
| MILLER | CLERK     |
+--------+-----------+
14 rows in set (0.0015 sec)
 MySQL  localhost:33060+ ssl  nani  SQL > select e.ename, e.sal, d.ename, e,sal from e
                                       -> join emp m on e.mgr = m.empno;
ERROR: 1146: Table 'nani.e' doesn't exist
 MySQL  localhost:33060+ ssl  nani  SQL > select e.ename, e.sal, d.ename, e,sal from e  join emp m on e.mgr = m.deptno;
ERROR: 1146: Table 'nani.e' doesn't exist
 MySQL  localhost:33060+ ssl  nani  SQL > select e.ename, e.sal, d.ename, e,sal from emp e  join emp m on e.mgr = m.empno;
ERROR: 1054: Unknown column 'd.ename' in 'field list'
 MySQL  localhost:33060+ ssl  nani  SQL > select e.ename, e.sal, d.ename, d.sal from emp e  join emp m on e.mgr = m.empno;
ERROR: 1054: Unknown column 'd.ename' in 'field list'
 MySQL  localhost:33060+ ssl  nani  SQL > select e.ename, e.sal, d.ename, d.sal from emp e  join emp d on e.mgr = d.empno;
+--------+---------+-------+---------+
| ename  | sal     | ename | sal     |
+--------+---------+-------+---------+
| SMITH  |  800.00 | FORD  | 3000.00 |
| ALLEN  | 1600.00 | BLAKE | 2850.00 |
| WARD   | 1250.00 | BLAKE | 2850.00 |
| JONES  | 2975.00 | KING  | 5000.00 |
| MARTIN | 1250.00 | BLAKE | 2850.00 |
| BLAKE  | 2850.00 | KING  | 5000.00 |
| CLARK  | 2450.00 | KING  | 5000.00 |
| SCOTT  | 3000.00 | JONES | 2975.00 |
| TURNER | 1500.00 | BLAKE | 2850.00 |
| ADAMS  | 1100.00 | SCOTT | 3000.00 |
| JAMES  |  950.00 | BLAKE | 2850.00 |
| FORD   | 3000.00 | JONES | 2975.00 |
| MILLER | 1300.00 | CLARK | 2450.00 |
+--------+---------+-------+---------+
13 rows in set (0.0018 sec)
 MySQL  localhost:33060+ ssl  nani  SQL > select e.ename, e.sal, d.ename, d.sal from emp e  join emp d on e.mgr = d.empno where max(d.sal);
ERROR: 1111: Invalid use of group function
 MySQL  localhost:33060+ ssl  nani  SQL > select e.ename, e.sal, d.ename, d.sal from emp e  join emp d on e.mgr = d.empno where ;