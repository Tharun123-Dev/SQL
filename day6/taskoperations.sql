
Type '\help' or '\?' for help; '\quit' to exit.
 MySQL  JS > \sql
Switching to SQL mode... Commands end with ;
 MySQL  SQL > \c root@localhost
Creating a session to 'root@localhost'
Fetching global names for auto-completion... Press ^C to stop.
Your MySQL connection id is 36 (X protocol)
Server version: 8.0.43 MySQL Community Server - GPL
No default schema selected; type \use <schema> to set one.
 MySQL  localhost:33060+ ssl  SQL > use nani;
Default schema set to `nani`.
Fetching global names, object names from `nani` for auto-completion... Press ^C to stop.


1
 MySQL  localhost:33060+ ssl  nani  SQL > select *from emp;
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
14 rows in set (0.0042 sec)
 MySQL  localhost:33060+ ssl  nani  SQL > select sal+500 as sal from emp;
+---------+
| sal     |
+---------+
| 1300.00 |
| 2100.00 |
| 1750.00 |
| 3475.00 |
| 1750.00 |
| 3350.00 |
| 2950.00 |
| 3500.00 |
| 5500.00 |
| 2000.00 |
| 1600.00 |
| 1450.00 |
| 3500.00 |
| 1800.00 |
+---------+
14 rows in set (0.0016 sec)
 select empno, ename, job,hiredate, mgr, sal+500 as sal ,comm, deptno from emp;
+-------+--------+-----------+------------+------+---------+---------+--------+
| empno | ename  | job       | hiredate   | mgr  | sal     | comm    | deptno |
+-------+--------+-----------+------------+------+---------+---------+--------+
|  7369 | SMITH  | CLERK     | 1980-12-17 | 7902 | 1300.00 |    NULL |     20 |
|  7499 | ALLEN  | SALESMAN  | 1981-02-20 | 7698 | 2100.00 |  300.00 |     30 |
|  7521 | WARD   | SALESMAN  | 1981-02-22 | 7698 | 1750.00 |  500.00 |     30 |
|  7566 | JONES  | MANAGER   | 1981-04-02 | 7839 | 3475.00 |    NULL |     20 |
|  7654 | MARTIN | SALESMAN  | 1981-09-28 | 7698 | 1750.00 | 1400.00 |     30 |
|  7698 | BLAKE  | MANAGER   | 1981-05-01 | 7839 | 3350.00 |    NULL |     30 |
|  7782 | CLARK  | MANAGER   | 1981-06-09 | 7839 | 2950.00 |    NULL |     10 |
|  7788 | SCOTT  | ANALYST   | 1987-04-19 | 7566 | 3500.00 |    NULL |     20 |
|  7839 | KING   | PRESIDENT | 1981-11-17 | NULL | 5500.00 |    NULL |     10 |
|  7844 | TURNER | SALESMAN  | 1981-09-08 | 7698 | 2000.00 |    0.00 |     30 |
|  7876 | ADAMS  | CLERK     | 1987-05-23 | 7788 | 1600.00 |    NULL |     20 |
|  7900 | JAMES  | CLERK     | 1981-12-03 | 7698 | 1450.00 |    NULL |     30 |
|  7902 | FORD   | ANALYST   | 1981-12-03 | 7566 | 3500.00 |    NULL |     20 |
|  7934 | MILLER | CLERK     | 1982-01-23 | 7782 | 1800.00 |    NULL |     10 |
+-------+--------+-----------+------------+------+---------+---------+--------+
14 rows in set (0.0014 sec)


2
 select ename,sal, sal*sal as double_salary from emp;
+--------+---------+---------------+
| ename  | sal     | double_salary |
+--------+---------+---------------+
| SMITH  |  800.00 |   640000.0000 |
| ALLEN  | 1600.00 |  2560000.0000 |
| WARD   | 1250.00 |  1562500.0000 |
| JONES  | 2975.00 |  8850625.0000 |
| MARTIN | 1250.00 |  1562500.0000 |
| BLAKE  | 2850.00 |  8122500.0000 |
| CLARK  | 2450.00 |  6002500.0000 |
| SCOTT  | 3000.00 |  9000000.0000 |
| KING   | 5000.00 | 25000000.0000 |
| TURNER | 1500.00 |  2250000.0000 |
| ADAMS  | 1100.00 |  1210000.0000 |
| JAMES  |  950.00 |   902500.0000 |
| FORD   | 3000.00 |  9000000.0000 |
| MILLER | 1300.00 |  1690000.0000 |
+--------+---------+---------------+

3
select ename, sal, comm from emp where comm>(sal/10);
+--------+---------+---------+
| ename  | sal     | comm    |
+--------+---------+---------+
| ALLEN  | 1600.00 |  300.00 |
| WARD   | 1250.00 |  500.00 |
| MARTIN | 1250.00 | 1400.00 |
+--------+---------+---------+
3 rows in set (0.0016 sec)
 MySQL  localhost:33060+ ssl  nani  SQL > select ename, sal, comm from emp where comm>(sal*0.1);
+--------+---------+---------+
| ename  | sal     | comm    |
+--------+---------+---------+
| ALLEN  | 1600.00 |  300.00 |
| WARD   | 1250.00 |  500.00 |
| MARTIN | 1250.00 | 1400.00 |
+--------+---------+---------+

4
 select ename, sal, (sal*12) as annual_sal  from emp where (sal*12)>30000;
+-------+---------+------------+
| ename | sal     | annual_sal |
+-------+---------+------------+
| JONES | 2975.00 |   35700.00 |
| BLAKE | 2850.00 |   34200.00 |
| SCOTT | 3000.00 |   36000.00 |
| KING  | 5000.00 |   60000.00 |
| FORD  | 3000.00 |   36000.00 |
+-------+---------+------------+

5
 select ename, job, (sal+comm) as net_income from emp;
+--------+-----------+------------+
| ename  | job       | net_income |
+--------+-----------+------------+
| SMITH  | CLERK     |       NULL |
| ALLEN  | SALESMAN  |    1900.00 |
| WARD   | SALESMAN  |    1750.00 |
| JONES  | MANAGER   |       NULL |
| MARTIN | SALESMAN  |    2650.00 |
| BLAKE  | MANAGER   |       NULL |
| CLARK  | MANAGER   |       NULL |
| SCOTT  | ANALYST   |       NULL |
| KING   | PRESIDENT |       NULL |
| TURNER | SALESMAN  |    1500.00 |
| ADAMS  | CLERK     |       NULL |
| JAMES  | CLERK     |       NULL |
| FORD   | ANALYST   |       NULL |
| MILLER | CLERK     |       NULL |
+--------+-----------+------------+
14 rows in set (0.0015 sec)
 MySQL  localhost:33060+ ssl  nani  SQL > SELECT ENAME, JOB, SAL + IFNULL(COMM, 0) AS Net_Income
                                       -> FROM EMP;
+--------+-----------+------------+
| ENAME  | JOB       | Net_Income |
+--------+-----------+------------+
| SMITH  | CLERK     |     800.00 |
| ALLEN  | SALESMAN  |    1900.00 |
| WARD   | SALESMAN  |    1750.00 |
| JONES  | MANAGER   |    2975.00 |
| MARTIN | SALESMAN  |    2650.00 |
| BLAKE  | MANAGER   |    2850.00 |
| CLARK  | MANAGER   |    2450.00 |
| SCOTT  | ANALYST   |    3000.00 |
| KING   | PRESIDENT |    5000.00 |
| TURNER | SALESMAN  |    1500.00 |
| ADAMS  | CLERK     |    1100.00 |
| JAMES  | CLERK     |     950.00 |
| FORD   | ANALYST   |    3000.00 |
| MILLER | CLERK     |    1300.00 |
+--------+-----------+------------+

6
 select empno, ename, job, hiredate, mgr, sal, comm, deptno from emp where sal=3000;
+-------+-------+---------+------------+------+---------+------+--------+
| empno | ename | job     | hiredate   | mgr  | sal     | comm | deptno |
+-------+-------+---------+------------+------+---------+------+--------+
|  7788 | SCOTT | ANALYST | 1987-04-19 | 7566 | 3000.00 | NULL |     20 |
|  7902 | FORD  | ANALYST | 1981-12-03 | 7566 | 3000.00 | NULL |     20 |
+-------+-------+---------+------------+------+---------+------+--------+

7
select ename, sal from emp where sal>2500;
+-------+---------+
| ename | sal     |
+-------+---------+
| JONES | 2975.00 |
| BLAKE | 2850.00 |
| SCOTT | 3000.00 |
| KING  | 5000.00 |
| FORD  | 3000.00 |
+-------+---------+

8
 select ename, sal from emp where sal between 1000 and 2000;
+--------+---------+
| ename  | sal     |
+--------+---------+
| ALLEN  | 1600.00 |
| WARD   | 1250.00 |
| MARTIN | 1250.00 |
| TURNER | 1500.00 |
| ADAMS  | 1100.00 |
| MILLER | 1300.00 |
+--------+---------+

9
select empno, ename, job, sal from emp where job="manager";
+-------+-------+---------+---------+
| empno | ename | job     | sal     |
+-------+-------+---------+---------+
|  7566 | JONES | MANAGER | 2975.00 |
|  7698 | BLAKE | MANAGER | 2850.00 |
|  7782 | CLARK | MANAGER | 2450.00 |
+-------+-------+---------+---------+

10
select empno, ename, job, hiredate from emp where hiredate>"1981-01-01";
+-------+--------+-----------+------------+
| empno | ename  | job       | hiredate   |
+-------+--------+-----------+------------+
|  7499 | ALLEN  | SALESMAN  | 1981-02-20 |
|  7521 | WARD   | SALESMAN  | 1981-02-22 |
|  7566 | JONES  | MANAGER   | 1981-04-02 |
|  7654 | MARTIN | SALESMAN  | 1981-09-28 |
|  7698 | BLAKE  | MANAGER   | 1981-05-01 |
|  7782 | CLARK  | MANAGER   | 1981-06-09 |
|  7788 | SCOTT  | ANALYST   | 1987-04-19 |
|  7839 | KING   | PRESIDENT | 1981-11-17 |
|  7844 | TURNER | SALESMAN  | 1981-09-08 |
|  7876 | ADAMS  | CLERK     | 1987-05-23 |
|  7900 | JAMES  | CLERK     | 1981-12-03 |
|  7902 | FORD   | ANALYST   | 1981-12-03 |
|  7934 | MILLER | CLERK     | 1982-01-23 |
+-------+--------+-----------+------------+

11
select ename, job, sal from emp where job="clerk" and sal<1500;
+--------+-------+---------+
| ename  | job   | sal     |
+--------+-------+---------+
| SMITH  | CLERK |  800.00 |
| ADAMS  | CLERK | 1100.00 |
| JAMES  | CLERK |  950.00 |
| MILLER | CLERK | 1300.00 |
+--------+-------+---------+

12

 MySQL  localhost:33060+ ssl  nani  SQL > select ename, job, sal from emp where job="salesman" or job="clerk";
+--------+----------+---------+
| ename  | job      | sal     |
+--------+----------+---------+
| SMITH  | CLERK    |  800.00 |
| ALLEN  | SALESMAN | 1600.00 |
| WARD   | SALESMAN | 1250.00 |
| MARTIN | SALESMAN | 1250.00 |
| TURNER | SALESMAN | 1500.00 |
| ADAMS  | CLERK    | 1100.00 |
| JAMES  | CLERK    |  950.00 |
| MILLER | CLERK    | 1300.00 |
+--------+----------+---------+

13
select empno, ename, job, sal, deptno from emp where sal between 1000 and 2000 and deptno=30;
+-------+--------+----------+---------+--------+
| empno | ename  | job      | sal     | deptno |
+-------+--------+----------+---------+--------+
|  7499 | ALLEN  | SALESMAN | 1600.00 |     30 |
|  7521 | WARD   | SALESMAN | 1250.00 |     30 |
|  7654 | MARTIN | SALESMAN | 1250.00 |     30 |
|  7844 | TURNER | SALESMAN | 1500.00 |     30 |
+-------+--------+----------+---------+--------+

14
 select ename, empno, sal, job from emp where job != "manager";
+--------+-------+---------+-----------+
| ename  | empno | sal     | job       |
+--------+-------+---------+-----------+
| SMITH  |  7369 |  800.00 | CLERK     |
| ALLEN  |  7499 | 1600.00 | SALESMAN  |
| WARD   |  7521 | 1250.00 | SALESMAN  |
| MARTIN |  7654 | 1250.00 | SALESMAN  |
| SCOTT  |  7788 | 3000.00 | ANALYST   |
| KING   |  7839 | 5000.00 | PRESIDENT |
| TURNER |  7844 | 1500.00 | SALESMAN  |
| ADAMS  |  7876 | 1100.00 | CLERK     |
| JAMES  |  7900 |  950.00 | CLERK     |
| FORD   |  7902 | 3000.00 | ANALYST   |
| MILLER |  7934 | 1300.00 | CLERK     |
+--------+-------+---------+-----------+

15
 select ename, sal, comm from emp where comm=0;
+--------+---------+------+
| ename  | sal     | comm |
+--------+---------+------+
| TURNER | 1500.00 | 0.00 |
+--------+---------+------+

16
select ename, hiredate from emp where hiredate  between "1981-01-01" and "1981-12-31";
+--------+------------+
| ename  | hiredate   |
+--------+------------+
| ALLEN  | 1981-02-20 |
| WARD   | 1981-02-22 |
| JONES  | 1981-04-02 |
| MARTIN | 1981-09-28 |
| BLAKE  | 1981-05-01 |
| CLARK  | 1981-06-09 |
| KING   | 1981-11-17 |
| TURNER | 1981-09-08 |
| JAMES  | 1981-12-03 |
| FORD   | 1981-12-03 |
+--------+------------+

17
 select ename, sal, deptno from emp where deptno in (10,20,30);
+--------+---------+--------+
| ename  | sal     | deptno |
+--------+---------+--------+
| SMITH  |  800.00 |     20 |
| ALLEN  | 1600.00 |     30 |
| WARD   | 1250.00 |     30 |
| JONES  | 2975.00 |     20 |
| MARTIN | 1250.00 |     30 |
| BLAKE  | 2850.00 |     30 |
| CLARK  | 2450.00 |     10 |
| SCOTT  | 3000.00 |     20 |
| KING   | 5000.00 |     10 |
| TURNER | 1500.00 |     30 |
| ADAMS  | 1100.00 |     20 |
| JAMES  |  950.00 |     30 |
| FORD   | 3000.00 |     20 |
| MILLER | 1300.00 |     10 |
+--------+---------+--------+

18
 select ename from emp where ename like "s%";
+-------+
| ename |
+-------+
| SMITH |
| SCOTT |
+-------+

19
 select ename from emp where ename like "%n";
+--------+
| ename  |
+--------+
| ALLEN  |
| MARTIN |
+--------+

20
 select ename from emp where ename like "%a%";
+--------+
| ename  |
+--------+
| ALLEN  |
| WARD   |
| MARTIN |
| BLAKE  |
| CLARK  |
| ADAMS  |
| JAMES  |
+--------+

21
 select ename, mgr from emp where mgr is null;
+-------+------+
| ename | mgr  |
+-------+------+
| KING  | NULL |
+-------+------+

22

1 row in set (0.0014 sec)
 MySQL  localhost:33060+ ssl  nani  SQL > select ename, comm from emp where comm=0;
+--------+------+
| ename  | comm |
+--------+------+
| TURNER | 0.00 |
+--------+------+
1 row in set (0.0013 sec)
 MySQL  localhost:33060+ ssl  nani  SQL > select ename, comm from emp where comm=0 or comm ;                                         select ename, comm from emp where comm=0 or comm i;                                        select ename, comm from emp where comm=0 or comm is;                                       select ename, comm from emp where comm=0 or comm is ;                                      select ename, comm from emp where comm=0 or comm is n;                                     select ename, comm from emp where comm=0 or comm is nu;                                    select ename, comm from emp where comm=0 or comm is nul;                                   select ename, comm from emp where comm=0 or comm is null;                                  select ename, comm from emp where comm=0 or comm is null;
+--------+------+
| ename  | comm |
+--------+------+
| SMITH  | NULL |
| JONES  | NULL |
| BLAKE  | NULL |
| CLARK  | NULL |
| SCOTT  | NULL |
| KING   | NULL |
| TURNER | 0.00 |
| ADAMS  | NULL |
| JAMES  | NULL |
| FORD   | NULL |
| MILLER | NULL |

23

 MySQL  localhost:33060+ ssl  nani  SQL > select ename, comm from emp where  comm is not null;
+--------+---------+
| ename  | comm    |
+--------+---------+
| ALLEN  |  300.00 |
| WARD   |  500.00 |
| MARTIN | 1400.00 |
| TURNER |    0.00 |
+--------+---------+

24

select ename from emp where sal is null;
Empty set (0.0014 sec)

25
we dont have location column but insert and findout of value
select departments from dept  where loc is null;

26
select job from emp where job like "m%";
+---------+
| job     |
+---------+
| MANAGER |
| MANAGER |
| MANAGER |
+---------+
27
select ename from emp where ename like "_____";
+-------+
| ename |
+-------+
| SMITH |
| ALLEN |
| JONES |
| BLAKE |
| CLARK |
| SCOTT |
| ADAMS |
| JAMES |
+-------+

28

 MySQL  localhost:33060+ ssl  nani  SQL > select ename, job from emp where job like "%man";
+----------+
| job      |
+----------+
| SALESMAN |
| SALESMAN |
| SALESMAN |
| SALESMAN |
+----------+

29
select ename, job from emp where ename like "%s";
+-------+---------+
| ename | job     |
+-------+---------+
| JONES | MANAGER |
| ADAMS | CLERK   |
| JAMES | CLERK   |
+-------+---------+

30
 select ename from emp where ename like "%s";
+-------+
| ename |
+-------+
| JONES |
| ADAMS |
| JAMES |
+-------+
31
select ename from emp where ename like "s%h";
+-------+
| ename |
+-------+
| SMITH |
+-------+

32
 select ename sal, (sal*0.15) as bonus from emp;
+--------+----------+
| sal    | bonus    |
+--------+----------+
| SMITH  | 120.0000 |
| ALLEN  | 240.0000 |
| WARD   | 187.5000 |
| JONES  | 446.2500 |
| MARTIN | 187.5000 |
| BLAKE  | 427.5000 |
| CLARK  | 367.5000 |
| SCOTT  | 450.0000 |
| KING   | 750.0000 |
| TURNER | 225.0000 |
| ADAMS  | 165.0000 |
| JAMES  | 142.5000 |
| FORD   | 450.0000 |
| MILLER | 195.0000 |
+--------+----------+

33
 select ename, sal, (sal*83) as salary_inr from emp;

+--------+---------+------------+
| ename  | sal     | salary_inr |
+--------+---------+------------+
| SMITH  |  800.00 |   66400.00 |
| ALLEN  | 1600.00 |  132800.00 |
| WARD   | 1250.00 |  103750.00 |
| JONES  | 2975.00 |  246925.00 |
| MARTIN | 1250.00 |  103750.00 |
| BLAKE  | 2850.00 |  236550.00 |
| CLARK  | 2450.00 |  203350.00 |
| SCOTT  | 3000.00 |  249000.00 |
| KING   | 5000.00 |  415000.00 |
| TURNER | 1500.00 |  124500.00 |
| ADAMS  | 1100.00 |   91300.00 |
| JAMES  |  950.00 |   78850.00 |
| FORD   | 3000.00 |  249000.00 |
| MILLER | 1300.00 |  107900.00 |
+--------+---------+------------+
34
select ename,job, comm, sal, (comm/sal) as comm_to_salary_ratio from emp;
+--------+-----------+---------+---------+----------------------+
| ename  | job       | comm    | sal     | comm_to_salary_ratio |
+--------+-----------+---------+---------+----------------------+
| SMITH  | CLERK     |    NULL |  800.00 |                 NULL |
| ALLEN  | SALESMAN  |  300.00 | 1600.00 |             0.187500 |
| WARD   | SALESMAN  |  500.00 | 1250.00 |             0.400000 |
| JONES  | MANAGER   |    NULL | 2975.00 |                 NULL |
| MARTIN | SALESMAN  | 1400.00 | 1250.00 |             1.120000 |
| BLAKE  | MANAGER   |    NULL | 2850.00 |                 NULL |
| CLARK  | MANAGER   |    NULL | 2450.00 |                 NULL |
| SCOTT  | ANALYST   |    NULL | 3000.00 |                 NULL |
| KING   | PRESIDENT |    NULL | 5000.00 |                 NULL |
| TURNER | SALESMAN  |    0.00 | 1500.00 |             0.000000 |
| ADAMS  | CLERK     |    NULL | 1100.00 |                 NULL |
| JAMES  | CLERK     |    NULL |  950.00 |                 NULL |
| FORD   | ANALYST   |    NULL | 3000.00 |                 NULL |
| MILLER | CLERK     |    NULL | 1300.00 |                 NULL |
+--------+-----------+---------+---------+----------------------+


35
select ename, sal as monthly_sal, (sal*12) as Yearly_salary from emp;
+--------+-------------+---------------+
| ename  | monthly_sal | Yearly_salary |
+--------+-------------+---------------+
| SMITH  |      800.00 |       9600.00 |
| ALLEN  |     1600.00 |      19200.00 |
| WARD   |     1250.00 |      15000.00 |
| JONES  |     2975.00 |      35700.00 |
| MARTIN |     1250.00 |      15000.00 |
| BLAKE  |     2850.00 |      34200.00 |
| CLARK  |     2450.00 |      29400.00 |
| SCOTT  |     3000.00 |      36000.00 |
| KING   |     5000.00 |      60000.00 |
| TURNER |     1500.00 |      18000.00 |
| ADAMS  |     1100.00 |      13200.00 |
| JAMES  |      950.00 |      11400.00 |
| FORD   |     3000.00 |      36000.00 |
| MILLER |     1300.00 |      15600.00 |
+--------+-------------+---------------+

36


 MySQL  localhost:33060+ ssl  nani  SQL > SELECT ENAME, SAL, HIREDATE
                                       -> FROM EMP
                                       -> WHERE SAL > 1500
                                       ->   AND YEAR(HIREDATE) = 1981;
+-------+---------+------------+
| ENAME | SAL     | HIREDATE   |
+-------+---------+------------+
| ALLEN | 1600.00 | 1981-02-20 |
| JONES | 2975.00 | 1981-04-02 |
| BLAKE | 2850.00 | 1981-05-01 |
| CLARK | 2450.00 | 1981-06-09 |
| KING  | 5000.00 | 1981-11-17 |
| FORD  | 3000.00 | 1981-12-03 |
+-------+---------+------------+

37
SELECT ENAME, JOB, SAL
                                       -> FROM EMP
                                       -> WHERE JOB <> 'CLERK'
                                       ->   AND SAL > 2000;
+-------+-----------+---------+
| ENAME | JOB       | SAL     |
+-------+-----------+---------+
| JONES | MANAGER   | 2975.00 |
| BLAKE | MANAGER   | 2850.00 |
| CLARK | MANAGER   | 2450.00 |
| SCOTT | ANALYST   | 3000.00 |
| KING  | PRESIDENT | 5000.00 |
| FORD  | ANALYST   | 3000.00 |
+-------+-----------+---------+

38
select ename, sal, comm from emp where (comm is not null and comm>0) and sal <2000;
+--------+---------+---------+
| ename  | sal     | comm    |
+--------+---------+---------+
| ALLEN  | 1600.00 |  300.00 |
| WARD   | 1250.00 |  500.00 |
| MARTIN | 1250.00 | 1400.00 |
+--------+---------+---------+

39
select ename, hiredate from emp where hiredate>"1981-12-31";
+--------+------------+
| ename  | hiredate   |
+--------+------------+
| SCOTT  | 1987-04-19 |
| ADAMS  | 1987-05-23 |
| MILLER | 1982-01-23 |
+--------+------------+

40
 select ename, deptno from emp where deptno in (10,20);
+--------+--------+
| ename  | deptno |
+--------+--------+
| SMITH  |     20 |
| JONES  |     20 |
| CLARK  |     10 |
| SCOTT  |     20 |
| KING   |     10 |
| ADAMS  |     20 |
| FORD   |     20 |
| MILLER |     10 |
+--------+--------+