
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
14 rows in set (0.0016 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select avg(sal) from emp;
+-------------+
| avg(sal)    |
+-------------+
| 2073.214286 |
+-------------+
1 row in set (0.0014 sec)
##1 MySQL  localhost:33060+ ssl  joins  SQL > select ename, sal from emp where sal >(select avg(sal) from emp);
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
#2 select ename, deptno from emp where deptno in (select deptno from emp where ename="smith");
+-------+--------+
| ename | deptno |
+-------+--------+
| smith |     20 |
| jones |     20 |
| scott |     20 |
| adams |     20 |
| ford  |     20 |
+-------+--------+
5 rows in set (0.0024 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select ename, deptno from emp where deptno = (select deptno from emp where ename="smith");
+-------+--------+
| ename | deptno |
+-------+--------+
| smith |     20 |
| jones |     20 |
| scott |     20 |
| adams |     20 |
| ford  |     20 |
+-------+--------+
5 rows in set (0.0016 sec)

#3

 MySQL  localhost:33060+ ssl  joins  SQL >  select ename, sal from emp where sal = (select max(sal) from emp where deptno=30);
+-------+---------+
| ename | sal     |
+-------+---------+
| blake | 2850.00 |
+-------+---------+
1 row in set (0.0019 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select ename, sal from emp where sal > all (select sal from emp where deptno=30);
+-------+---------+
| ename | sal     |
+-------+---------+
| jones | 2975.00 |
| scott | 3000.00 |
| king  | 5000.00 |
| ford  | 3000.00 |
+-------+---------+
4 rows in set (0.0015 sec)

#4

 MySQL  localhost:33060+ ssl  joins  SQL > select ename, sal from emp where sal = (select max(sal) from emp );
+-------+---------+
| ename | sal     |
+-------+---------+
| king  | 5000.00 |
+-------+---------+
1 row in set (0.0014 sec)

$5
 select deptno, dname from dept where deptno not in (select distinct deptno from emp);
+--------+------------+
| deptno | dname      |
+--------+------------+
|     40 | operations |
+--------+------------+
1 row in set (0.0251 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select deptno, dname from dept where deptno not in (select deptno from emp);
+--------+------------+
| deptno | dname      |
+--------+------------+
|     40 | operations |
+--------+------------+
1 row in set (0.0017 sec)

#6
 select ename, deptno, sal from emp e where sal > (select avg(sal) from emp where deptno=e.deptno);
+-------+--------+---------+
| ename | deptno | sal     |
+-------+--------+---------+
| allen |     30 | 1600.00 |
| jones |     20 | 2975.00 |
| blake |     30 | 2850.00 |
| scott |     20 | 3000.00 |
| king  |     10 | 5000.00 |
| ford  |     20 | 3000.00 |
+-------+--------+---------+
6 rows in set (0.0024 sec)

#7
select ename, hiredate from emp where hiredate < (select min(hiredate) from emp where deptno=20);
Empty set (0.0024 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select ename, hiredate from emp where hiredate = (select min(hiredate) from emp where deptno=20);
+-------+------------+
| ename | hiredate   |
+-------+------------+
| smith | 1980-12-17 |
+-------+------------+
1 row in set (0.0017 sec)

#8
select ename, job from emp where job = any (select job from emp where deptno=10);
+--------+-----------+
| ename  | job       |
+--------+-----------+
| smith  | clerk     |
| jones  | manager   |
| blake  | manager   |
| clark  | manager   |
| king   | president |
| adams  | clerk     |
| james  | clerk     |
| miller | clerk     |
+--------+-----------+
8 rows in set (0.0248 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > /../////////////////////////////////////////////////////////////////////////////select ename, job from emp where job in (select job from emp where deptno=10);
+--------+-----------+
| ename  | job       |
+--------+-----------+
| smith  | clerk     |
| jones  | manager   |
| blake  | manager   |
| clark  | manager   |
| king   | president |
| adams  | clerk     |
| james  | clerk     |
| miller | clerk     |
+--------+-----------+
8 rows in set (0.0020 sec)

#9
select ename, sal from emp where sal > (select sal from emp where ename="allen");
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
6 rows in set (0.0016 sec)

#10

 MySQL  localhost:33060+ ssl  joins  SQL > select ename, sal from emp where sal = (select max(sal) from emp where sal  <(select max(sal) from emp));
+-------+---------+
| ename | sal     |
+-------+---------+
| scott | 3000.00 |
| ford  | 3000.00 |
+-------+---------+
2 rows in set (0.0016 sec)

#11
select deptno from emp group by deptno having avg(sal) > (select avg(sal) from emp);
+--------+
| deptno |
+--------+
|     10 |
|     20 |
+--------+
2 rows in set (0.0015 sec)

#12

 MySQL  localhost:33060+ ssl  joins  SQL > select e.ename, e.sal, m.ename as manager, m.sal as mgr_sal from emp e join emp m on e.mgr = m.empno where e.sal > m.sal;
+-------+---------+---------+---------+
| ename | sal     | manager | mgr_sal |
+-------+---------+---------+---------+
| scott | 3000.00 | jones   | 2975.00 |
| ford  | 3000.00 | jones   | 2975.00 |
+-------+---------+---------+---------+

#13
select ename, hiredate from emp where hiredate > (select max(hiredate) from emp where deptno=10);
+-------+------------+
| ename | hiredate   |
+-------+------------+
| scott | 1987-04-19 |
| adams | 1987-05-23 |
+-------+------------+
2 rows in set (0.0009 sec)

#14
 select ename, sal from emp where sal > any(select sal from emp where deptno=20);
+--------+---------+
| ename  | sal     |
+--------+---------+
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
13 rows in set (0.0015 sec)

#15
 select ename, job, deptno from emp where job = (select job from emp where ename = "ford");
+-------+---------+--------+
| ename | job     | deptno |
+-------+---------+--------+
| scott | analyst |     20 |
| ford  | analyst |     20 |
+-------+---------+--------+
2 rows in set (0.0013 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select ename, job, deptno from emp where job = (select job from emp where ename = "ford") and deptno <> (select deptno from emp where ename = "ford");;
Empty set (0.0016 sec)