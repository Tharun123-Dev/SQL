 \sql
Switching to SQL mode... Commands end with ;
 MySQL  SQL > \c root@localhost
Creating a session to 'root@localhost'
Fetching global names for auto-completion... Press ^C to stop.
Your MySQL connection id is 62 (X protocol)
Server version: 8.0.43 MySQL Community Server - GPL
No default schema selected; type \use <schema> to set one.
 MySQL  localhost:33060+ ssl  SQL > use joins;
Default schema set to `joins`.
Fetching global names, object names from `joins` for auto-completion... Press ^C to stop.
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
14 rows in set (0.0341 sec)

##1
select ename, sal, rank() over (order by sal desc) as rnk from emp;
+--------+---------+-----+
| ename  | sal     | rnk |
+--------+---------+-----+
| king   | 5000.00 |   1 |
| scott  | 3000.00 |   2 |
| ford   | 3000.00 |   2 |
| jones  | 2975.00 |   4 |
| blake  | 2850.00 |   5 |
| clark  | 2450.00 |   6 |
| allen  | 1600.00 |   7 |
| turner | 1500.00 |   8 |
| miller | 1300.00 |   9 |
| ward   | 1250.00 |  10 |
| martin | 1250.00 |  10 |
| adams  | 1100.00 |  12 |
| james  |  950.00 |  13 |
| smith  |  800.00 |  14 |
+--------+---------+-----+
14 rows in set (0.0026 sec)

#2
select ename, deptno, sal, dense_rank() over (partition by deptno order by sal desc) as dept_rank from emp;
+--------+--------+---------+-----------+
| ename  | deptno | sal     | dept_rank |
+--------+--------+---------+-----------+
| king   |     10 | 5000.00 |         1 |
| clark  |     10 | 2450.00 |         2 |
| miller |     10 | 1300.00 |         3 |
| scott  |     20 | 3000.00 |         1 |
| ford   |     20 | 3000.00 |         1 |
| jones  |     20 | 2975.00 |         2 |
| adams  |     20 | 1100.00 |         3 |
| smith  |     20 |  800.00 |         4 |
| blake  |     30 | 2850.00 |         1 |
| allen  |     30 | 1600.00 |         2 |
| turner |     30 | 1500.00 |         3 |
| ward   |     30 | 1250.00 |         4 |
| martin |     30 | 1250.00 |         4 |
| james  |     30 |  950.00 |         5 |
+--------+--------+---------+-----------+

#3

 MySQL  localhost:33060+ ssl  joins  SQL > SELECT ename, deptno, sal,
                                        ->        AVG(sal) OVER (PARTITION BY deptno) AS avg_dept_sal
                                        -> FROM emp;
+--------+--------+---------+--------------+
| ename  | deptno | sal     | avg_dept_sal |
+--------+--------+---------+--------------+
| clark  |     10 | 2450.00 |  2916.666667 |
| king   |     10 | 5000.00 |  2916.666667 |
| miller |     10 | 1300.00 |  2916.666667 |
| smith  |     20 |  800.00 |  2175.000000 |
| jones  |     20 | 2975.00 |  2175.000000 |
| scott  |     20 | 3000.00 |  2175.000000 |
| adams  |     20 | 1100.00 |  2175.000000 |
| ford   |     20 | 3000.00 |  2175.000000 |
| allen  |     30 | 1600.00 |  1566.666667 |
| ward   |     30 | 1250.00 |  1566.666667 |
| martin |     30 | 1250.00 |  1566.666667 |
| blake  |     30 | 2850.00 |  1566.666667 |
| turner |     30 | 1500.00 |  1566.666667 |
| james  |     30 |  950.00 |  1566.666667 |
+--------+--------+---------+--------------+
14 rows in set (0.0029 sec)

###4
  localhost:33060+ ssl  joins  SQL > select ename,sal,deptno,max(sal) over (partition by deptno) as High_sal from emp;
+--------+---------+--------+----------+
| ename  | sal     | deptno | High_sal |
+--------+---------+--------+----------+
| clark  | 2450.00 |     10 |  5000.00 |
| king   | 5000.00 |     10 |  5000.00 |
| miller | 1300.00 |     10 |  5000.00 |
| smith  |  800.00 |     20 |  3000.00 |
| jones  | 2975.00 |     20 |  3000.00 |
| scott  | 3000.00 |     20 |  3000.00 |
| adams  | 1100.00 |     20 |  3000.00 |
| ford   | 3000.00 |     20 |  3000.00 |
| allen  | 1600.00 |     30 |  2850.00 |
| ward   | 1250.00 |     30 |  2850.00 |
| martin | 1250.00 |     30 |  2850.00 |
| blake  | 2850.00 |     30 |  2850.00 |
| turner | 1500.00 |     30 |  2850.00 |
| james  |  950.00 |     30 |  2850.00 |
+--------+---------+--------+----------+

#5
 select ename, sal, deptno,sum(sal) over (order by sal) as cum_sum_sal from emp;
+--------+---------+--------+-------------+
| ename  | sal     | deptno | cum_sum_sal |
+--------+---------+--------+-------------+
| smith  |  800.00 |     20 |      800.00 |
| james  |  950.00 |     30 |     1750.00 |
| adams  | 1100.00 |     20 |     2850.00 |
| ward   | 1250.00 |     30 |     5350.00 |
| martin | 1250.00 |     30 |     5350.00 |
| miller | 1300.00 |     10 |     6650.00 |
| turner | 1500.00 |     30 |     8150.00 |
| allen  | 1600.00 |     30 |     9750.00 |
| clark  | 2450.00 |     10 |    12200.00 |
| blake  | 2850.00 |     30 |    15050.00 |
| jones  | 2975.00 |     20 |    18025.00 |
| scott  | 3000.00 |     20 |    24025.00 |
| ford   | 3000.00 |     20 |    24025.00 |
| king   | 5000.00 |     10 |    29025.00 |
+--------+---------+--------+-------------+

#6
 select ename,sal,deptno,sal-avg(sal) over (partition by deptno) as avg_sal from emp;
+--------+---------+--------+--------------+
| ename  | sal     | deptno | avg_sal      |
+--------+---------+--------+--------------+
| clark  | 2450.00 |     10 |  -466.666667 |
| king   | 5000.00 |     10 |  2083.333333 |
| miller | 1300.00 |     10 | -1616.666667 |
| smith  |  800.00 |     20 | -1375.000000 |
| jones  | 2975.00 |     20 |   800.000000 |
| scott  | 3000.00 |     20 |   825.000000 |
| adams  | 1100.00 |     20 | -1075.000000 |
| ford   | 3000.00 |     20 |   825.000000 |
| allen  | 1600.00 |     30 |    33.333333 |
| ward   | 1250.00 |     30 |  -316.666667 |
| martin | 1250.00 |     30 |  -316.666667 |
| blake  | 2850.00 |     30 |  1283.333333 |
| turner | 1500.00 |     30 |   -66.666667 |
| james  |  950.00 |     30 |  -616.666667 |
+--------+---------+--------+--------------+
14 rows in set (0.0029 sec)

##7
select ename,sal,deptno, min(sal) over (partition by deptno) as min_sal, max(sal) over (partition by deptno) as max_sal from emp;
+--------+---------+--------+---------+---------+
| ename  | sal     | deptno | min_sal | max_sal |
+--------+---------+--------+---------+---------+
| clark  | 2450.00 |     10 | 1300.00 | 5000.00 |
| king   | 5000.00 |     10 | 1300.00 | 5000.00 |
| miller | 1300.00 |     10 | 1300.00 | 5000.00 |
| smith  |  800.00 |     20 |  800.00 | 3000.00 |
| jones  | 2975.00 |     20 |  800.00 | 3000.00 |
| scott  | 3000.00 |     20 |  800.00 | 3000.00 |
| adams  | 1100.00 |     20 |  800.00 | 3000.00 |
| ford   | 3000.00 |     20 |  800.00 | 3000.00 |
| allen  | 1600.00 |     30 |  950.00 | 2850.00 |
| ward   | 1250.00 |     30 |  950.00 | 2850.00 |
| martin | 1250.00 |     30 |  950.00 | 2850.00 |
| blake  | 2850.00 |     30 |  950.00 | 2850.00 |
| turner | 1500.00 |     30 |  950.00 | 2850.00 |
| james  |  950.00 |     30 |  950.00 | 2850.00 |
+--------+---------+--------+---------+---------+

##8
 select ename,hiredate,sal,row_number() over (order by hiredate desc) as early_hire from emp;
+--------+------------+---------+------------+
| ename  | hiredate   | sal     | early_hire |
+--------+------------+---------+------------+
| adams  | 1987-05-23 | 1100.00 |          1 |
| scott  | 1987-04-19 | 3000.00 |          2 |
| miller | 1982-01-23 | 1300.00 |          3 |
| james  | 1981-12-03 |  950.00 |          4 |
| ford   | 1981-12-03 | 3000.00 |          5 |
| king   | 1981-11-17 | 5000.00 |          6 |
| martin | 1981-09-28 | 1250.00 |          7 |
| turner | 1981-09-08 | 1500.00 |          8 |
| clark  | 1981-06-09 | 2450.00 |          9 |
| blake  | 1981-05-01 | 2850.00 |         10 |
| jones  | 1981-04-02 | 2975.00 |         11 |
| ward   | 1981-02-22 | 1250.00 |         12 |
| allen  | 1981-02-20 | 1600.00 |         13 |
| smith  | 1980-12-17 |  800.00 |         14 |
+--------+------------+---------+------------+
14 rows in set (0.0015 sec)

##9
 select ename, sal from (select ename, sal, row_number() over (order by sal desc) as rn from emp) as new_one where rn=2;
+-------+---------+
| ename | sal     |
+-------+---------+
| scott | 3000.00 |
+-------+---------+
1 row in set (0.0020 sec)

#using rank
 select ename, sal from (select ename, sal, rank() over (order by sal desc) as rn from emp) as new_one where rn=2;
+-------+---------+
| ename | sal     |
+-------+---------+
| scott | 3000.00 |
| ford  | 3000.00 |
+-------+---------+
2 rows in set (0.0016 sec)

##10

 select ename, sal, deptno, percent_rank() over (partition by deptno order by sal) as pct_rnk from emp;
+--------+---------+--------+---------+
| ename  | sal     | deptno | pct_rnk |
+--------+---------+--------+---------+
| miller | 1300.00 |     10 |       0 |
| clark  | 2450.00 |     10 |     0.5 |
| king   | 5000.00 |     10 |       1 |
| smith  |  800.00 |     20 |       0 |
| adams  | 1100.00 |     20 |    0.25 |
| jones  | 2975.00 |     20 |     0.5 |
| scott  | 3000.00 |     20 |    0.75 |
| ford   | 3000.00 |     20 |    0.75 |
| james  |  950.00 |     30 |       0 |
| ward   | 1250.00 |     30 |     0.2 |
| martin | 1250.00 |     30 |     0.2 |
| turner | 1500.00 |     30 |     0.6 |
| allen  | 1600.00 |     30 |     0.8 |
| blake  | 2850.00 |     30 |       1 |
+--------+---------+--------+---------+
14 rows in set (0.0023 sec)