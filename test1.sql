--   machinetest

1)postgres=# create database machinetest;
CREATE DATABASE

postgres=# \c machinetest
You are now connected to database "machinetest" as user "postgres".

machinetest=# create table tbl_stock(Pk_int_stock_id serial primary key,vchr_name varchar(20),int_quantity int,int_price
 int);
CREATE TABLE

-- output

machinetest=# \d tbl_stock;
                                              Table "public.tbl_stock"
     Column      |         Type          | Collation | Nullable |                      Default
-----------------+-----------------------+-----------+----------+----------------------------------------------------
 pk_int_stock_id | integer               |           | not null | nextval('tbl_stock_pk_int_stock_id_seq'::regclass)
 vchr_name       | character varying(20) |           |          |
 int_quantity    | integer               |           |          |
 int_price       | integer               |           |          |
Indexes:
    "tbl_stock_pkey" PRIMARY KEY, btree (pk_int_stock_id)




2)
machinetest=# alter table tbl_stock alter column int_price type float;
ALTER TABLE
--  output
machinetest=# \d tbl_stock;
                                              Table "public.tbl_stock"
     Column      |         Type          | Collation | Nullable |                      Default
-----------------+-----------------------+-----------+----------+----------------------------------------------------
 pk_int_stock_id | integer               |           | not null | nextval('tbl_stock_pk_int_stock_id_seq'::regclass)
 vchr_name       | character varying(20) |           |          |
 int_quantity    | integer               |           |          |
 int_price       | double precision      |           |          |
Indexes:
    "tbl_stock_pkey" PRIMARY KEY, btree (pk_int_stock_id)


3)
machinetest=# create table tbl_supplier(pk_int_supplier_id serial primary key,vchr_supplier_name varchar(25));
    --  output

    machinetest=# \d tbl_supplier;
                                                 Table "public.tbl_supplier"
       Column       |         Type          | Collation | Nullable |                         Default

--------------------+-----------------------+-----------+----------+----------------------------------------------------------
 pk_int_supplier_id | integer               |           | not null | nextval('tbl_supplier_pk_int_supplier_id_seq'::regclass)
 vchr_supplier_name | character varying(25) |           |          |
Indexes:
    "tbl_supplier_pkey" PRIMARY KEY, btree (pk_int_supplier_id)


4)machinetest=# 
alter table tbl_stock add fk_int_supplier int;

--   output

machinetest=# \d tbl_stock;
                                              Table "public.tbl_stock"
     Column      |         Type          | Collation | Nullable |                      Default
-----------------+-----------------------+-----------+----------+----------------------------------------------------
 pk_int_stock_id | integer               |           | not null | nextval('tbl_stock_pk_int_stock_id_seq'::regclass)
 vchr_name       | character varying(20) |           |          |
 int_quantity    | integer               |           |          |
 int_price       | double precision      |           |          |
 fk_int_supplier | integer               |           |          |
Indexes:
    "tbl_stock_pkey" PRIMARY KEY, btree (pk_int_stock_id)



5)
ALTER TABLE tbl_stock ADD CONSTRAINT fk_int_supplier FOREIGN KEY(fk_int_supplier) REFERENCES tbl_supplier(pk_int_supplier_id);
   
    --  output
    machinetest=# select * from tbl_stock;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
(0 rows)





6)
create table tbl_dept(pk_int_dept_id serial primary key,vchr_dept_name varchar(25));

    --  output

    CREATE TABLE
machinetest=# \d tbl_dept;
                                             Table "public.tbl_dept"
     Column     |         Type          | Collation | Nullable |                     Default
----------------+-----------------------+-----------+----------+--------------------------------------------------
 pk_int_dept_id | integer               |           | not null | nextval('tbl_dept_pk_int_dept_id_seq'::regclass)
 vchr_dept_name | character varying(25) |           |          |
Indexes:
    "tbl_dept_pkey" PRIMARY KEY, btree (pk_int_dept_id)





7)
create table tbl_classes(pk_int_class_id serial primary key,vchr_class_name varchar(20),fk_int_dept_id int, foreign key(fk_int_dept_id) REFERENCES tbl_dept(pk_int_dept_id)on delete cascade on update cascade);


    --  output

    machinetest=# \d tbl_classes;
                                              Table "public.tbl_classes"
     Column      |         Type          | Collation | Nullable |                       Default
-----------------+-----------------------+-----------+----------+------------------------------------------------------
 pk_int_class_id | integer               |           | not null | nextval('tbl_classes_pk_int_class_id_seq'::regclass)
 vchr_class_name | character varying(20) |           |          |
 fk_int_dept_id  | integer               |           |          |
Indexes:
    "tbl_classes_pkey" PRIMARY KEY, btree (pk_int_class_id)
Foreign-key constraints:
    "tbl_classes_fk_int_dept_id_fkey" FOREIGN KEY (fk_int_dept_id) REFERENCES tbl_dept(pk_int_dept_id) ON UPDATE CASCADE ON DELETE CASCADE




8)
  create table tbl_enrollment(pk_int_enrollment_id serial primary key, int_count int, fk_int_class_id int, foreign key(fk_int_class_id) REFERENCES tbl_classes(fk_int_class_id)on delete cascade on update cascade);

--    output

machinetest=# \d tbl_enrollment;
                                            Table "public.tbl_enrollment"
        Column        |  Type   | Collation | Nullable |                           Default
----------------------+---------+-----------+----------+--------------------------------------------------------------
 pk_int_enrollment_id | integer |           | not null | nextval('tbl_enrollment_pk_int_enrollment_id_seq'::regclass)
 int_count            | integer |           |          |
 fk_int_class_id      | integer |           |          |
Indexes:
    "tbl_enrollment_pkey" PRIMARY KEY, btree (pk_int_enrollment_id)
Foreign-key constraints:
    "tbl_enrollment_fk_int_class_id_fkey" FOREIGN KEY (fk_int_class_id) REFERENCES tbl_classes(pk_int_class_id) ON UPDATE CASCADE ON DELETE CASCADE


9)
alter table tbl_classes add unique(vchr_class_name);

machinetest=# \d tbl_enrollment;
                                            Table "public.tbl_enrollment"
        Column        |  Type   | Collation | Nullable |                           Default
----------------------+---------+-----------+----------+--------------------------------------------------------------
 pk_int_enrollment_id | integer |           | not null | nextval('tbl_enrollment_pk_int_enrollment_id_seq'::regclass)
 int_count            | integer |           |          |
 fk_int_class_id      | integer |           |          |
Indexes:
    "tbl_enrollment_pkey" PRIMARY KEY, btree (pk_int_enrollment_id)
Foreign-key constraints:
    "tbl_enrollment_fk_int_class_id_fkey" FOREIGN KEY (fk_int_class_id) REFERENCES tbl_classes(pk_int_class_id) ON UPDATE CASCADE ON DELETE CASCADE

10)alter table tbl_dept add vchr_dept_description int;

    --   output

machinetest=# \d tbl_dept;
                                                 Table "public.tbl_dept"
        Column         |         Type          | Collation | Nullable |                     Default

-----------------------+-----------------------+-----------+----------+--------------------------------------------------
 pk_int_dept_id        | integer               |           | not null | nextval('tbl_dept_pk_int_dept_id_seq'::regclass) vchr_dept_name        | character varying(25) |           |          |
 vchr_dept_description | integer               |           |          |
Indexes:
    "tbl_dept_pkey" PRIMARY KEY, btree (pk_int_dept_id)
Referenced by:
    TABLE "tbl_classes" CONSTRAINT "tbl_classes_fk_int_dept_id_fkey" FOREIGN KEY (fk_int_dept_id) REFERENCES tbl_dept(pk_int_dept_id) ON UPDATE CASCADE ON DELETE CASCADE


11)

insert into tbl_supplier values(1,'logitech'),(2,'samsung'),(3,'iball'),(4,'lg'),(5,'creative');

12)
insert into tbl_stock values

