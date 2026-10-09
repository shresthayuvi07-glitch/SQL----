create database joins;
use joins;

create table members 
(member_id int primary key, 
mname varchar (50), 
city varchar (30)
); 

create table loans 
(loan_id int primary key,
member_id int, 
book_title varchar(80), 
fine int, 
foreign key (member_id) references members (member_id)
); 

insert into members
values
(101, "James", "Vienna"), 
(102, "John", "Paris"), 
(103, "Peter", "Madrid"), 
(104, "Jude", "London"), 
(105, "Lilly", "Helsinki"); 

select * from members;

insert into loans
values
(1, 101, "Harry potter", 0), 
(2, 101, "The Alchemist", 50), 
(3, 102, "The Atomic Habit", 0), 
(4, 102, "The Hobbit", 100), 
(5, 103, "The Holy Bible", 0), 
(6, 103, "The Propose Driven Life", 50), 
(7, 104, "The 48 Laws of Power", 0), 
(8, 104, "The Lord of Ring", 0); 

select * from loans;

-- Q1. INNER JOIN members and loans. Predict the row count before running. 
select m.mname, l.book_title 
from members as m
inner join loans as l
on m.member_id = l.member_id; 

-- Predict the row count before running. 
			-- 5 members, 8 loans, member_id 105 "Lilly" has no matching loans so, she will not appear. 

-- Q2. LEFT JOIN showing all members with their books. Who shows NULL and Why? 
select m.mname, m.member_id, m.city, l.book_title
from members as m
left join loans as l
on m.member_id = l.member_id;

-- Who shows NULL and Why?
			-- member_id 105 shows Null in book_title because it has no matching loans. 
            
-- Q3. Swap the two tables in the LEFT JOIN. Which earlier join does it now behave like?
select m.mname, m.member_id, m.city, l.book_title
from loans as l
left join members as m 
on l.member_id = m.member_id; 

-- Earlier the member_id 105 was appeared though it has no matching loan. However, this time member_id 105 did not appear 
-- because we swap the table and this time it only look at book_title and member_id. 

-- Q4. RIGHT JOIN from members. what appears, and is any row NULL? Why not? 
select m.mname, m.member_id, m.city, l.book_title
from members as m 
right join loans as l 
on m.member_id = l.member_id; 

-- There is no row as Null. Though we did right join from members but still it matched the book_title and memeber_id
-- from loans to members so member_id 105 has no matching loans. Therefore it did not appear. 

-- Q5. Write the FULL JOIN using UNION. How many rows? 
select m.mname, m.member_id, m.city, l.book_title
from members as m 
left join loans as l 
on m.member_id = l.member_id
union 
select m.mname, m.member_id, m.city, l.book_title
from members as m 
right join loans as l 
on m.member_id = l.member_id; 

-- Total 9 rows. 

-- Q6. Exclusive join: members who borrowed nothing. Which is NULL check? 
select m.mname, m.member_id, m.city, l.book_title
from members as m 
left join  loans as l
on m.member_id = l.member_id
where l.book_title is NUll; 

-- member_id 105 is null and has borrowed nothing. 

-- Q7. Show member names with book titles only for the fine above 50 (join + where)
select m.mname, l.fine, l.book_title
from members as m 
right join loans as l
on m.member_id = l.member_id 
where l.fine >50; 

-- Q8. Delete one loan, run the INNER JOIN again. Which rows disappeared? 
delete from loans 
where loan_id =  3; 

select m.mname, m.member_id, m.city, l.book_title, l.loan_id
from members as m 
inner join loans as l 
on m.member_id = l.member_id;

-- The loan_id 3 is disappeared with book title "Atomic Habit". 

-- Q9. In your own words; When do you choose LEFT over INNER? Give a library example. 
-- I choose LEFT to see the everything from main table, even if there is Null matching with second table.
-- I choose Inner to see only matching records in both tables. 

-- For LEFT JOIN:
select m.mname, l.book_title 
from members as m 
left join loans as l 
on m.member_id = l.member_id; 

-- For INNER JOIN; 
select m.mname, l.book_title 
from members as m 
inner join loans as l
on m.member_id = l.member_id; 

-- Q10. Bonus self join: add a referred_by column to members (who invited whom) and list inviter with invited.

alter table members 
add referred_by int; 

update members 
set referred_by = 1
where member_id in (2,3); 

update members 
set referred_by = 2 
where member_id = 4; 

select inviter.mname as inviter, 
invited.mname as invited 
from members invited 
inner join members inviter 
on invited.referred_by = inviter.member_id;

select * from members;