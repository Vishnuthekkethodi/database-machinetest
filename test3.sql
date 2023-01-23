  --test 3

1)select sum(int_quantity*int_price) as totalcost from tbl_stock;

--output 
machinetest=# select sum(int_quantity*int_price) as totalcost from tbl_stock;
 totalcost
-----------
   63865.5


2)select sum(int_quantity) as total_no_products from tbl_stock;

--output
machinetest=# select sum(int_quantity) as total_no_products from tbl_stock;
 total_no_products
------------------
                77


3)select upper (vchr_name) from tbl_stock;

--output

machinetest=# select upper (vchr_name) from tbl_stock;
   upper
-----------
 MOUSE
 KEYBOARD
 MODEM
 HEADPHONE
 MEMORY
(5 rows)

select round (int_price)from tbl_stock;
machinetest=# select round (int_price)from tbl_stock;
 round
-------
   502
   452
  1202
   752
  3502
(5 rows)


4)select count (vchr_name) as items from tbl_stock;





5) select vchr_name,int_price from tbl_stock where int_price = (select max(int_price) from tbl_stock);


--output

machinetest=# select vchr_name,int_price from tbl_stock where int_price = (select max(int_price) from tbl_stock);
 vchr_name | int_price
-----------+-----------
 memory    |    3501.5
 


 6)insert into tbl_classes (pk_int_class_id,vchr_class_name,fk_int_dept_id) values (1,'CS100',1),(2,'CS101',1),(3,'CS102',1),(4,'CS103',1),(5,'EC200',2),(6,'CC300',3),(7,'AT400',4)
 --output

 machinetest=# select * from tbl_classes;
 pk_int_class_id | vchr_class_name | fk_int_dept_id
-----------------+-----------------+----------------
               1 | CS100           |              1
               2 | CS101           |              1
               3 | CS102           |              1
               4 | CS103           |              1
               5 | EC200           |              2
               6 | CC300           |              3
               7 | AT400           |              4
(7 rows)

INSERT INTO tbl_enrollment (int_count,fk_int_class_id) VALUES (40,1),(15,2),(10,3),(12,4),(60,2),(14,6),(200,7);

--output

machinetest=# INSERT INTO tbl_enrollment (int_count,fk_int_class_id) VALUES (40,1),(15,2),(10,3),(12,4),(60,2),(14,6),(200,7);
INSERT 0 7
machinetest=# select * from tbl_enrollment;
 pk_int_enrollment_id | int_count | fk_int_class_id
----------------------+-----------+-----------------
                    1 |        40 |               1
                    2 |        15 |               2
                    3 |        10 |               3
                    4 |        12 |               4
                    5 |        60 |               2
                    6 |        14 |               6
                    7 |       200 |               7
(7 rows)



6)select sum(int_count) as total_enrollment from tbl_enrollment;
                  --//outpuut

                  
machinetest=# select sum(int_count) as total_enrollment from tbl_enrollment;
 total_enrollment
------------------
              351
(1 row)

7)machinetest=# select count (*) as no_of_classes from tbl_classes;

--output

 no_of_classes
---------------
             7

8)delete from tbl_stock where fk_int_supplier = 5;

--output

machinetest=# select * from tbl_stock;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
              19 | Mouse     |           10 |     501.5 |               1
              20 | keyboard  |            5 |     451.5 |               3
              21 | modem     |           10 |    1201.5 |               2
              23 | headphone |           50 |     751.5 |               4
              24 | memory    |            2 |    3501.5 |               4
(5 rows)

9)select concat(vchr_name,int_price) as Product_price from tbl_stock;

--output
 product_price
----------------
 Mouse501.5
 keyboard451.5
 modem1201.5
 headphone751.5
 memory3501.5
(5 rows)



10) create table tbl_student(
    EnRI_no varchar(100),
    Roll_no serial primary key,
    Name varchar(50),
    City varchar(100),
    Mobile varchar(15),
    Dob date
);
insert into tbl_student(enri_no,roll_no,name,city,mobile,dob)
values(11,2,'akhil','delhi',98756579,'12-01-1989');

insert into tbl_student(enri_no,roll_no,name,city,mobile,dob)
values(6,4,'maya','bangalore',98734534,'12-01-1987');

insert into tbl_student(enri_no,roll_no,name,city,mobile,dob)
values(1,8,'anoop','bangalore',93456535,'12-01-1990');

insert into tbl_student(enri_no,roll_no,name,city,mobile,dob)
values(20,1,'paul','cochin',96754555,'13-03-1991');

insert into tbl_student(enri_no,roll_no,name,city,mobile,dob)
values(3,5,'sandeep','delhi',84865644,'14-06-1993');

              ---//output
              machinetest=# select * from tbl_student;
 enri_no | roll_no |  name   |   city    |  mobile  |    dob
---------+---------+---------+-----------+----------+------------
 11      |       2 | akhil   | delhi     | 98756579 | 1989-01-12
 6       |       4 | maya    | bangalore | 98734534 | 1987-01-12
 1       |       8 | anoop   | bangalore | 93456535 | 1990-01-12
 20      |       1 | paul    | cochin    | 96754555 | 1991-03-13
 3       |       5 | sandeep | delhi     | 84865644 | 1993-06-14
(5 rows)

create table tbl_grade(
    roll_no int,
    foreign key (roll_no) references tbl_student(roll_no) on delete cascade on update cascade,
    course varchar(50),
    grade varchar(50)
     );

     insert into tbl_grade (roll_no,course,grade)
     values(2,'C','A');
     
        insert into tbl_grade (roll_no,course,grade)
     values(2,'Java','B');

        insert into tbl_grade (roll_no,course,grade)
     values(1,'C','B');

        insert into tbl_grade (roll_no,course,grade)
     values(1,'Java','A');

        insert into tbl_grade (roll_no,course,grade)
     values(4,'PHP','A');

        insert into tbl_grade (roll_no,course,grade)
     values(4,'Java','A');

        insert into tbl_grade (roll_no,course,grade)
     values(4,'C','B');

        insert into tbl_grade (roll_no,course,grade)
     values(8,'Java','B');

        insert into tbl_grade (roll_no,course,grade)
     values(5,'PHP','A');

        insert into tbl_grade (roll_no,course,grade)
     values(5,'Java','D');

                        --//output

machinetest=# select * from tbl_grade;
 roll_no | course | grade
---------+--------+-------
       2 | C      | A
       2 | Java   | B
       1 | C      | B
       1 | Java   | A
       4 | PHP    | A
       4 | Java   | A
       4 | C      | B
       8 | Java   | B
       5 | PHP    | A
       5 | Java   | D
(10 rows)



10)
select tbl_student.enri_no,tbl_student.roll_no,tbl_student.name,tbl_student.city,tbl_student.mobile,tbl_student.dob,tbl_grade.course,tbl_grade.grade
from tbl_student inner join tbl_grade on tbl_student.roll_no = tbl_grade.roll_no WHERE tbl_grade.grade = 'A';
--output

 enri_no | roll_no |  name   |   city   |  mobile  |    dob     | course | grade
---------+---------+---------+----------+----------+------------+--------+-------
 11      |       2 | akhil   | delhi    | 98756579 | 1986-01-12 | C      | A
 6       |       4 | maya    | banglore | 98734534 | 1987-11-12 | Java   | A
 6       |       4 | maya    | banglore | 98734534 | 1987-11-12 | php    | A
 20      |       1 | paul    | cochin   | 96754555 | 1991-03-13 | Java   | A
 3       |       5 | sandeep | delhi    | 84865644 | 1993-06-14 | php    | A
(5 rows)




11)
select tbl_student.enri_no,tbl_student.roll_no,tbl_student.name,tbl_student.city,tbl_student.mobile,tbl_student.dob,tbl_grade.course,tbl_grade.grade
from tbl_student inner join tbl_grade on tbl_student.roll_no = tbl_grade.roll_no WHERE tbl_grade.grade = 'B';

--output
 enri_no | roll_no | name  |   city   |  mobile  |    dob     | course | grade
---------+---------+-------+----------+----------+------------+--------+-------
 11      |       2 | akhil | delhi    | 98756579 | 1986-01-12 | Java   | B
 6       |       4 | maya  | banglore | 98734534 | 1987-11-12 | C      | B
 1       |       8 | anoop | banglore | 93456535 | 1990-12-22 | Java   | B
 20      |       1 | paul  | cochin   | 96754555 | 1991-03-13 | C      | B
(4 rows)



12)select tbl_student.name, count(tbl_grade.course) as no_of_course from tbl_grade inner join tbl_student on tbl_student.roll_no=tbl_grade.roll_no group by tbl_student.name,tbl_student.name,tbl_student.roll_no order by tbl_student.name;

--output

  name   | no_of_course
---------+--------------
 akhil   |            2
 anoop   |            1
 maya    |            3
 paul    |            2
 sandeep |            2







13)SELECT * FROM tbl_student 
WHERE city = 'banglore' AND roll_no in (SELECT roll_no FROM tbl_grade WHERE course='Java');

                           --//output
                           machinetest=#  SELECT * FROM tbl_student
machinetest-# WHERE city = 'bangalore' AND roll_no in (SELECT roll_no FROM tbl_grade WHERE course='Java');
 enri_no | roll_no | name  |   city    |  mobile  |    dob
---------+---------+-------+-----------+----------+------------
 6       |       4 | maya  | bangalore | 98734534 | 1987-01-12
 1       |       8 | anoop | bangalore | 93456535 | 1990-01-12
(2 rows)





14)machinetest=# select tbl_student.name,tbl_grade.course from tbl_student inner join tbl_grade on tbl_student."roll_no"=tbl_grade."roll_no" where name like 'a%';
 name  | course
      
                      --//output
-------+--------
 akhil | C
 akhil | Java
 anoop | Java
(3 rows)




15)SELECT name, date_part('year',age(dob)) AS age FROM tbl_student;
                               --/output
 name   | age                                
---------+-----
 akhil   |  34
 maya    |  36
 anoop   |  33
 paul    |  31
 sandeep |  29
(5 rows)






16)SELECT name, to_char("dob", 'DD-Mon-YYYY') FROM tbl_student;
                 
                 --//output

                 name   |   to_char
---------+-------------
 akhil   | 12-Jan-1989
 maya    | 12-Jan-1987
 anoop   | 12-Jan-1990
 paul    | 13-Mar-1991
 sandeep | 14-Jun-1993
(5 rows)

