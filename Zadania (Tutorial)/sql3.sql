use employees;
describe employees;
/*Numeric Function*/
select abs(-40); /*Wartość bezwzgledna*/
select abs(40);
select sqrt(4); /*pierwiastek kwadratowy z liczby*/
select mod(5,2); /*reszta z dzielenie*/
/*Aggregate Functions*/
describe salaries;
select * from salaries
limit 100;
/*AVG - średnia*/
select from_date, avg(salary) from salaries
where year(from_date) = 1990;
/*SUM - suma*/
select sum(salary) from salaries
where emp_no = 10001;
/*min - minimum*/
select min(salary) from salaries;
/*MAX - maksimum*/
select max(salary) from salaries;
/*Count*/
select count(salary) from salaries
where emp_no = 10001;
/*Group by - Grupowanie danych polega na tworzeniu grup rekordów 
w oparciu o definicję grupowania (klauzulę GROUP BY).*/
select emp_no, sum(salary) from salaries
group by emp_no;
select * from titles
limit 10;
select title, count(emp_no) from titles
group by title
having count(emp_no) > 90000 
order by title;

select title, count(emp_no) from titles
where title like 'S%'
group by title
having count(emp_no) > 90000 
order by title;

select emp_no, max(salary), min(salary) from salaries
where emp_no > 10200
group by emp_no
order by emp_no; 

select dept_no, count(emp_no) from dept_emp
group by dept_no
having count(emp_no)>20000
order by dept_no;

use employees;

select * from dept_emp
inner join dept_manager
on dept_emp.emp_no=dept_manager.emp_no
group by dept_no
order by dept_no;

select first_name, last_name, hire_date, dept_manager.dept_no from employees
left outer join dept_manager
on employees.emp_no=dept_manager.emp_no
where dept_no is not null
order by first_name;

select salaries.emp_no, dept_no, salaries.salary from dept_manager
right outer join salaries
on dept_manager.emp_no=salaries.emp_no;

/*Full JOIN - alternatywne rozwązanie*/
select * from salaries
right join employees
on salaries.emp_no=employees.emp_no
union
select * from salaries
left join employees
on salaries.emp_no=employees.emp_no;

/*SUB QUERIES*/
/*Display employees whose salary is less than the of Ellen*/
select * from employees
limit 10;
select max(salary) from salaries where emp_no=10006;
select emp_no, salary from salaries where salary<(select max(salary) from salaries where emp_no=10006)
group by emp_no;

/*Display 2nd max salary from employees*/
select max(salary) from salaries;
select max(salary) from salaries where salary<(select max(salary) from salaries);

/*Display 3rd max salary from employees*/
select max(salary) from salaries where salary<(select max(salary) from salaries);
select max(salary) from salaries where salary<(select max(salary) from salaries where salary<(select max(salary) from salaries));

/*Find the salary of employees whose salary is greater then the salary of employee whose emp_no=10005*/
select max(salary) from salaries where emp_no=10005;
select emp_no, salary from salaries where salary>(select max(salary) from salaries where emp_no=10005)
group by emp_no
having max(salary);

/*Integrity Constraints*/
/*Not null*/
use employees;
create table TAB1(id int not null, name varchar(20), age int(3));
insert into TAB1 values(1,'Tomek', 20);
insert into TAB1 values(2,'Jacek', 23);
insert into TAB1 values(1,'Norbert', 21);
insert into TAB1 values(null,'Tomek', 20); /*error*/
select * from TAB1;
describe TAB1;
/*Unique*/
truncate table TAB1;
alter table TAB1 modify id int unique;
describe TAB1;
insert into TAB1 values(1,'Tomasz',25);
insert into TAB1 values(2,'Arek',29);
insert into TAB1 values(1,'Norbert',22); /*Error*/
select * from TAB1;

/*Primary key - posiada unique i not null, tylko 1 klucz w tabeli, unique można stosować wiele razy*/
truncate table TAB1;
describe TAB1;
alter table TAB1 modify column id int primary key;
insert into TAB1 values(1,'Jacek',22);
insert into TAB1 values(2,'Tomek',21);
insert into TAB1 values(1,'Bartek',12); /*error*/





