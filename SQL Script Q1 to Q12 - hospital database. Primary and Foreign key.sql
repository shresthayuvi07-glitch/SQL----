-- Q1. Create the hospital database and both tables exactly as shown. 

create database hospital; 
use hospital; 

create table doctors
(doctor_id int primary key, 
dname varchar(50) not null, 
department varchar(30)
); 

create table appointments 
(appt_id int primary key, 
doctor_id int, 
patient_name varchar (50), 
fee int,
foreign key (doctor_id) references doctors(doctor_id)
on delete cascade

); 

-- Q2. Insert 3 doctors: (1, Dr.Sharma, Heart), (2, Dr.Rai, Bone), (3, Dr.KC, Eye). 
insert into doctors 
values 
(1, "Dr.Sharma", "Heart"), 
(2, "Dr.Rai" , "Bone"), 
(3, "Dr.KC", "Eye"); 

-- Q3. Try to insert a doctor with doctor_id = 2 again. Write down the error.
insert into doctors 
values 
(2, "Dr.Shrestha", "Neuro");

-- Error Code: 1062. Duplicate entry '2' for key 'doctors.PRIMARY'.

-- Q4. Try to insert a doctor with Null id, and one with Null name. Which constraints blocks each? 
insert into doctors 
values 
("Dr.Chetri", "ENT"); 
-- Error Code: 1136. Column count doesn't match value count at row 1. It is PRIMARY KEY Constraints blocks. 

insert into doctors 
values 
(4,"Gyno"); 
-- Error Code: 1136. Column count doesn't match value count at row 1. It is NOT NULL Constraints blocks. 

-- Q5. For each real system, decide a good Primary Key and say why name is not enough: patients in this hospital, products in Daraz, citizens of Nepal. 

-- Patient in Hospital - patient_id 
-- Two or more patients can have same name, but unique ID identifies each patients seperately, which is good for PRIMARY KEY. 

-- Product in Daraz - product_id 
-- Different product can have same name and seller and buyer so for, good PRIMARY KEY - product_id can separate each product seperately. 

-- Citizens of Nepal - Citizen_number 
-- Two or more persons can have same name, but unique citizen_id identifies each person seperately, which is good for PRIMARY KEY. 

-- Q6. Insert 4 appointments for existing doctors, two of them for doctor 1. Why is the repeated doctor_id allowed? 
insert into appointments 
values
(101, 1, "James", 10000), 
(102, 1, "Jack", 8000), 
(103, 2, "Lilly", 15000), 
(104, 3, "Aaron", 20000); 

-- Because doctor_id in the appointments table is a FOREIGN KEY, not a PRIMARY KEY, and FOREIGN KEY can have many appointments.  
select * from appointments;

-- Q7. Try to insert an appointment with doctor_id = 99. What happens and why is this good? 
insert into appointments 
values 
(105, 99, "Adam", 10000); 

-- Error Code: 1452. Cannot add or update a child row: a FOREIGN KEY Constraints fails.

-- It protect data integrity. It prevents an appointment from being created for a doctor who doesnot exit in parent table. 

-- Q8. Which table is parent and which table is child? Where does the FOREIGN KEY live? 
-- Table 'doctors' is parent table and Table 'appointments' is child table. 
-- The FOREIGN KEY live in child table that is 'appointments'. 

-- Q9. Delete doctor 1. What happened to doctor 1's appointments, and which FOREIGN KEY option caused that? 
delete from doctors 
where doctor_id = 1; 

select * from appointments;
-- After we delete a data from doctors table (doctor_id 1); all the doctor_id 1's appointments in table appointments
-- delete automatically. (: Delete in parent table also delete in child table)

-- We use 'ON DELETE CASCADE' option in child table and that option cause all this automatic delete from table appointments. 

-- Q10. Recreate the FOREIGN KEY with RESTRICT instead. Now try deleting a doctor who has appointments. What happens? 
delete from doctors  
where doctor_id = 3; 

select * from appointments;
-- We get a FOREIGN KEY constraint Error, because doctor 3 is still referenced by rows in appointments. 

-- Q11. Real life: Daraz has customers and orders. Draw the parent, the child, and the FOERIGN KEY column. 
create table customers 
(customer_id int primary key, 
customer_name varchar(50), 
address varchar(30)
); 

create table orders 
(order_id int primary key, 
customer_id int, 
fee int, 
foreign key (customer_id) references customers(customer_id)
); 
select * from orders; 

-- Q12. Why can FOREIGN KEY repeat and be NULL while the PRIMARY KEY cannot? One sentence each. 
-- PRIMARY KEY cannot be repeat or Null, because it is unique to identify each data seperately for entire table. 

-- FOREIGN KEY can be repeat or Null, because it is derived from PRIMARY KEY and act as child key for entire table. 
-- It is also a secondary key which can be repeat or Null becaue PRIMARY KEY hold the unique identity for each data.  
