 create table dept (
     ->     deptno int primary key,
     ->     dname varchar(50) not null,
     ->     loc varchar(50) not null
    -> );

    insert into dept (deptno, dname, loc) values (10, 'accounting', 'new york'), (20, 'research', 'dallas'), (30, 'sales', 'chicago'), (40, 'operations', 'boston');
    > create table emp (
                                        ->     empno int primary key,
                                        ->     ename varchar(50),
                                        ->     job varchar(40),
                                        ->     hiredate date,
                                        ->     mgr int,
                                        ->     sal decimal(10,2),
                                        ->     comm decimal(10,2),
                                        ->     deptno int,
                                        ->     foreign key (deptno) references dept(deptno)
                                        -> );
Query OK, 0 rows affected (0.0661 sec)

 insert into emp (empno, ename, job, hiredate, mgr, sal, comm, deptno) values
                                        -> (7369, 'smith', 'clerk', '1980-12-17', 7902, 800, null, 20),
                                        -> (7499, 'allen', 'salesman', '1981-02-20', 7698, 1600, 300, 30),
                                        -> (7521, 'ward', 'salesman', '1981-02-22', 7698, 1250, 500, 30),
                                        -> (7566, 'jones', 'manager', '1981-04-02', 7839, 2975, null, 20),
                                        -> (7654, 'martin', 'salesman', '1981-09-28', 7698, 1250, 1400, 30),
                                        -> (7698, 'blake', 'manager', '1981-05-01', 7839, 2850, null, 30),
                                        -> (7782, 'clark', 'manager', '1981-06-09', 7839, 2450, null, 10),
                                        -> (7788, 'scott', 'analyst', '1987-04-19', 7566, 3000, null, 20),
                                        -> (7839, 'king', 'president', '1981-11-17', null, 5000, null, 10),
                                        -> (7844, 'turner', 'salesman', '1981-09-08', 7698, 1500, 0, 30),
                                        -> (7876, 'adams', 'clerk', '1987-05-23', 7788, 1100, null, 20),
                                        -> (7900, 'james', 'clerk', '1981-12-03', 7698, 950, null, 30),
                                        -> (7902, 'ford', 'analyst', '1981-12-03', 7566, 3000, null, 20),
                                        -> (7934, 'miller', 'clerk', '1982-01-23', 7782, 1300, null, 10);
Query OK, 14 rows affected (0.0323 sec)

Records: 14  Duplicates: 0  Warnings: 0
 MySQL  localhost:33060+ ssl  joins  SQL > select * from emp;


  select * from emp;
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

select * from dept;
+--------+------------+----------+
| DEPTNO | DNAME      | LOC      |
+--------+------------+----------+
|     10 | accounting | new york |
|     20 | research   | dallas   |
|     30 | sales      | chicago  |
|     40 | operations | boston   |
+--------+------------+----------+

#innerjoin

select e.ename, e.deptno, e.job, d.dname, d.deptno from emp e inner join dept d on e.deptno = d.deptno;
+--------+--------+-----------+------------+--------+
| ename  | deptno | job       | dname      | deptno |
+--------+--------+-----------+------------+--------+
| clark  |     10 | manager   | accounting |     10 |
| king   |     10 | president | accounting |     10 |
| miller |     10 | clerk     | accounting |     10 |
| smith  |     20 | clerk     | research   |     20 |
| jones  |     20 | manager   | research   |     20 |
| scott  |     20 | analyst   | research   |     20 |
| adams  |     20 | clerk     | research   |     20 |
| ford   |     20 | analyst   | research   |     20 |
| allen  |     30 | salesman  | sales      |     30 |
| ward   |     30 | salesman  | sales      |     30 |
| martin |     30 | salesman  | sales      |     30 |
| blake  |     30 | manager   | sales      |     30 |
| turner |     30 | salesman  | sales      |     30 |
| james  |     30 | clerk     | sales      |     30 |

#left joins

 select e.empno, e.ename, e.job, d.dname, d.deptno, d.loc from emp e left join dept d on e.deptno = d.deptno;
+-------+--------+-----------+------------+--------+----------+
| empno | ename  | job       | dname      | deptno | loc      |
+-------+--------+-----------+------------+--------+----------+
|  7369 | smith  | clerk     | research   |     20 | dallas   |
|  7499 | allen  | salesman  | sales      |     30 | chicago  |
|  7521 | ward   | salesman  | sales      |     30 | chicago  |
|  7566 | jones  | manager   | research   |     20 | dallas   |
|  7654 | martin | salesman  | sales      |     30 | chicago  |
|  7698 | blake  | manager   | sales      |     30 | chicago  |
|  7782 | clark  | manager   | accounting |     10 | new york |
|  7788 | scott  | analyst   | research   |     20 | dallas   |
|  7839 | king   | president | accounting |     10 | new york |
|  7844 | turner | salesman  | sales      |     30 | chicago  |
|  7876 | adams  | clerk     | research   |     20 | dallas   |
|  7900 | james  | clerk     | sales      |     30 | chicago  |
|  7902 | ford   | analyst   | research   |     20 | dallas   |
|  7934 | miller | clerk     | accounting |     10 | new york |
+-------+--------+-----------+------------+--------+----------+

select e.*, d.* from emp e left join dept d on e.deptno = d.deptno;
+-------+--------+-----------+------------+------+---------+---------+--------+--------+------------+----------+
| empno | ename  | job       | hiredate   | mgr  | sal     | comm    | deptno | DEPTNO | DNAME      | LOC      |
+-------+--------+-----------+------------+------+---------+---------+--------+--------+------------+----------+
|  7369 | smith  | clerk     | 1980-12-17 | 7902 |  800.00 |    NULL |     20 |     20 | research   | dallas   |
|  7499 | allen  | salesman  | 1981-02-20 | 7698 | 1600.00 |  300.00 |     30 |     30 | sales      | chicago  |
|  7521 | ward   | salesman  | 1981-02-22 | 7698 | 1250.00 |  500.00 |     30 |     30 | sales      | chicago  |
|  7566 | jones  | manager   | 1981-04-02 | 7839 | 2975.00 |    NULL |     20 |     20 | research   | dallas   |
|  7654 | martin | salesman  | 1981-09-28 | 7698 | 1250.00 | 1400.00 |     30 |     30 | sales      | chicago  |
|  7698 | blake  | manager   | 1981-05-01 | 7839 | 2850.00 |    NULL |     30 |     30 | sales      | chicago  |
|  7782 | clark  | manager   | 1981-06-09 | 7839 | 2450.00 |    NULL |     10 |     10 | accounting | new york |
|  7788 | scott  | analyst   | 1987-04-19 | 7566 | 3000.00 |    NULL |     20 |     20 | research   | dallas   |
|  7839 | king   | president | 1981-11-17 | NULL | 5000.00 |    NULL |     10 |     10 | accounting | new york |
|  7844 | turner | salesman  | 1981-09-08 | 7698 | 1500.00 |    0.00 |     30 |     30 | sales      | chicago  |
|  7876 | adams  | clerk     | 1987-05-23 | 7788 | 1100.00 |    NULL |     20 |     20 | research   | dallas   |
|  7900 | james  | clerk     | 1981-12-03 | 7698 |  950.00 |    NULL |     30 |     30 | sales      | chicago  |
|  7902 | ford   | analyst   | 1981-12-03 | 7566 | 3000.00 |    NULL |     20 |     20 | research   | dallas   |
|  7934 | miller | clerk     | 1982-01-23 | 7782 | 1300.00 |    NULL |     10 |     10 | accounting | new york |
+-------+--------+-----------+------------+------+---------+---------+--------+--------+------------+----------+


#right  join

select e.empno, e.ename, d.dname, d.loc from emp e right join dept d on e.deptno = d.deptno;
+-------+--------+------------+----------+
| empno | ename  | dname      | loc      |
+-------+--------+------------+----------+
|  7782 | clark  | accounting | new york |
|  7839 | king   | accounting | new york |
|  7934 | miller | accounting | new york |
|  7369 | smith  | research   | dallas   |
|  7566 | jones  | research   | dallas   |
|  7788 | scott  | research   | dallas   |
|  7876 | adams  | research   | dallas   |
|  7902 | ford   | research   | dallas   |
|  7499 | allen  | sales      | chicago  |
|  7521 | ward   | sales      | chicago  |
|  7654 | martin | sales      | chicago  |
|  7698 | blake  | sales      | chicago  |
|  7844 | turner | sales      | chicago  |
|  7900 | james  | sales      | chicago  |
|  NULL | NULL   | operations | boston   |
+-------+--------+------------+----------+

#full join
 select e.ename, e.job, d.dname, d.loc from emp e left join dept d on e.deptno = d.deptno union select e.ename, e.job, d.dname, d.loc from emp e right join dept d on e.deptno = d.deptno;
+--------+-----------+------------+----------+
| ename  | job       | dname      | loc      |
+--------+-----------+------------+----------+
| smith  | clerk     | research   | dallas   |
| allen  | salesman  | sales      | chicago  |
| ward   | salesman  | sales      | chicago  |
| jones  | manager   | research   | dallas   |
| martin | salesman  | sales      | chicago  |
| blake  | manager   | sales      | chicago  |
| clark  | manager   | accounting | new york |
| scott  | analyst   | research   | dallas   |
| king   | president | accounting | new york |
| turner | salesman  | sales      | chicago  |
| adams  | clerk     | research   | dallas   |
| james  | clerk     | sales      | chicago  |
| ford   | analyst   | research   | dallas   |
| miller | clerk     | accounting | new york |
| NULL   | NULL      | operations | boston   |
+--------+-----------+------------+----------+

#self join

 select * from emp;
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
14 rows in set (0.0018 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select e.ename as employee, m.ename as manager from emp e left join emp m on e.empno = m.mgr;
+----------+---------+
| employee | manager |
+----------+---------+
| smith    | NULL    |
| allen    | NULL    |
| ward     | NULL    |
| jones    | ford    |
| jones    | scott   |
| martin   | NULL    |
| blake    | james   |
| blake    | turner  |
| blake    | martin  |
| blake    | ward    |
| blake    | allen   |
| clark    | miller  |
| scott    | adams   |
| king     | clark   |
| king     | blake   |
| king     | jones   |
| turner   | NULL    |
| adams    | NULL    |
| james    | NULL    |
| ford     | smith   |
| miller   | NULL    |
+----------+---------+
21 rows in set (0.0023 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select e.ename as employee, m.ename as manager from emp e left join emp m on e.mgr = .empno;
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '.empno' at line 1
 MySQL  localhost:33060+ ssl  joins  SQL > select e.ename as employee, m.ename as manager from emp e left join emp m on e.mgr = m.empno;
+----------+---------+
| employee | manager |
+----------+---------+
| smith    | ford    |
| allen    | blake   |
| ward     | blake   |
| jones    | king    |
| martin   | blake   |
| blake    | king    |
| clark    | king    |
| scott    | jones   |
| king     | NULL    |
| turner   | blake   |
| adams    | scott   |
| james    | blake   |
| ford     | jones   |
| miller   | clark   |
+----------+---------+

#cross join 

select * from teacher;
+-----------+--------------+------------------+------------+----------------------------+----------+
| TeacherID | Name         | Subject          | Phone      | Email                      | Salary   |
+-----------+--------------+------------------+------------+----------------------------+----------+
|         1 | Ravi Kumar   | Mathematics      | 9876543210 | ravi.maths@example.com     | 45000.00 |
|         2 | Sita Rani    | English          | 9123456780 | sita.english@example.com   | 42000.00 |
|         3 | Arjun Singh  | Science          | 9988776655 | arjun.science@example.com  | 48000.00 |
|         4 | Lakshmi Devi | Social Studies   | 9090909090 | lakshmi.social@example.com | 40000.00 |
|         5 | Kiran Kumar  | Computer Science | 9876501234 | kiran.cs@example.com       | 50000.00 |
+-----------+--------------+------------------+------------+----------------------------+----------+
5 rows in set (0.0017 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select * from student;
+-----------+--------------+-------+-----+------------+--------------------------+
| StudentID | Name         | Class | Age | Phone      | Email                    |
+-----------+--------------+-------+-----+------------+--------------------------+
|       101 | Amit Sharma  | 10th  |  15 | 9876001111 | amit.sharma@example.com  |
|       102 | Priya Reddy  | 9th   |  14 | 9876002222 | priya.reddy@example.com  |
|       103 | Rahul Mehta  | 10th  |  16 | 9876003333 | rahul.mehta@example.com  |
|       104 | Sneha Rao    | 8th   |  13 | 9876004444 | sneha.rao@example.com    |
|       105 | Vikram Singh | 9th   |  14 | 9876005555 | vikram.singh@example.com |
+-----------+--------------+-------+-----+------------+--------------------------+
5 rows in set (0.0017 sec)
 MySQL  localhost:33060+ ssl  joins  SQL > select e.*, d.* from student e cross join teacher d;
+-----------+--------------+-------+-----+------------+--------------------------+-----------+--------------+------------------+------------+----------------------------+----------+
| StudentID | Name         | Class | Age | Phone      | Email                    | TeacherID | Name         | Subject          | Phone      | Email                      | Salary   |
+-----------+--------------+-------+-----+------------+--------------------------+-----------+--------------+------------------+------------+----------------------------+----------+
|       105 | Vikram Singh | 9th   |  14 | 9876005555 | vikram.singh@example.com |         1 | Ravi Kumar   | Mathematics      | 9876543210 | ravi.maths@example.com     | 45000.00 |
|       104 | Sneha Rao    | 8th   |  13 | 9876004444 | sneha.rao@example.com    |         1 | Ravi Kumar   | Mathematics      | 9876543210 | ravi.maths@example.com     | 45000.00 |
|       103 | Rahul Mehta  | 10th  |  16 | 9876003333 | rahul.mehta@example.com  |         1 | Ravi Kumar   | Mathematics      | 9876543210 | ravi.maths@example.com     | 45000.00 |
|       102 | Priya Reddy  | 9th   |  14 | 9876002222 | priya.reddy@example.com  |         1 | Ravi Kumar   | Mathematics      | 9876543210 | ravi.maths@example.com     | 45000.00 |
|       101 | Amit Sharma  | 10th  |  15 | 9876001111 | amit.sharma@example.com  |         1 | Ravi Kumar   | Mathematics      | 9876543210 | ravi.maths@example.com     | 45000.00 |
|       105 | Vikram Singh | 9th   |  14 | 9876005555 | vikram.singh@example.com |         2 | Sita Rani    | English          | 9123456780 | sita.english@example.com   | 42000.00 |
|       104 | Sneha Rao    | 8th   |  13 | 9876004444 | sneha.rao@example.com    |         2 | Sita Rani    | English          | 9123456780 | sita.english@example.com   | 42000.00 |
|       103 | Rahul Mehta  | 10th  |  16 | 9876003333 | rahul.mehta@example.com  |         2 | Sita Rani    | English          | 9123456780 | sita.english@example.com   | 42000.00 |
|       102 | Priya Reddy  | 9th   |  14 | 9876002222 | priya.reddy@example.com  |         2 | Sita Rani    | English          | 9123456780 | sita.english@example.com   | 42000.00 |
|       101 | Amit Sharma  | 10th  |  15 | 9876001111 | amit.sharma@example.com  |         2 | Sita Rani    | English          | 9123456780 | sita.english@example.com   | 42000.00 |
|       105 | Vikram Singh | 9th   |  14 | 9876005555 | vikram.singh@example.com |         3 | Arjun Singh  | Science          | 9988776655 | arjun.science@example.com  | 48000.00 |
|       104 | Sneha Rao    | 8th   |  13 | 9876004444 | sneha.rao@example.com    |         3 | Arjun Singh  | Science          | 9988776655 | arjun.science@example.com  | 48000.00 |
|       103 | Rahul Mehta  | 10th  |  16 | 9876003333 | rahul.mehta@example.com  |         3 | Arjun Singh  | Science          | 9988776655 | arjun.science@example.com  | 48000.00 |
|       102 | Priya Reddy  | 9th   |  14 | 9876002222 | priya.reddy@example.com  |         3 | Arjun Singh  | Science          | 9988776655 | arjun.science@example.com  | 48000.00 |
|       101 | Amit Sharma  | 10th  |  15 | 9876001111 | amit.sharma@example.com  |         3 | Arjun Singh  | Science          | 9988776655 | arjun.science@example.com  | 48000.00 |
|       105 | Vikram Singh | 9th   |  14 | 9876005555 | vikram.singh@example.com |         4 | Lakshmi Devi | Social Studies   | 9090909090 | lakshmi.social@example.com | 40000.00 |
|       104 | Sneha Rao    | 8th   |  13 | 9876004444 | sneha.rao@example.com    |         4 | Lakshmi Devi | Social Studies   | 9090909090 | lakshmi.social@example.com | 40000.00 |
|       103 | Rahul Mehta  | 10th  |  16 | 9876003333 | rahul.mehta@example.com  |         4 | Lakshmi Devi | Social Studies   | 9090909090 | lakshmi.social@example.com | 40000.00 |
|       102 | Priya Reddy  | 9th   |  14 | 9876002222 | priya.reddy@example.com  |         4 | Lakshmi Devi | Social Studies   | 9090909090 | lakshmi.social@example.com | 40000.00 |
|       101 | Amit Sharma  | 10th  |  15 | 9876001111 | amit.sharma@example.com  |         4 | Lakshmi Devi | Social Studies   | 9090909090 | lakshmi.social@example.com | 40000.00 |
|       105 | Vikram Singh | 9th   |  14 | 9876005555 | vikram.singh@example.com |         5 | Kiran Kumar  | Computer Science | 9876501234 | kiran.cs@example.com       | 50000.00 |
|       104 | Sneha Rao    | 8th   |  13 | 9876004444 | sneha.rao@example.com    |         5 | Kiran Kumar  | Computer Science | 9876501234 | kiran.cs@example.com       | 50000.00 |
|       103 | Rahul Mehta  | 10th  |  16 | 9876003333 | rahul.mehta@example.com  |         5 | Kiran Kumar  | Computer Science | 9876501234 | kiran.cs@example.com       | 50000.00 |
|       102 | Priya Reddy  | 9th   |  14 | 9876002222 | priya.reddy@example.com  |         5 | Kiran Kumar  | Computer Science | 9876501234 | kiran.cs@example.com       | 50000.00 |
|       101 | Amit Sharma  | 10th  |  15 | 9876001111 | amit.sharma@example.com  |         5 | Kiran Kumar  | Computer Science | 9876501234 | kiran.cs@example.com       | 50000.00 |
+-----------+--------------+-------+-----+------------+--------------------------+-----------+--------------+------------------+------------+----------------------------+----------+
25 rows in set (0.0022 sec)

