-- Q1. Create shop database and the products table exactly as shown and confirm with SHOW TABLES;
create database shop;
use shop; 

create table products
(
id int primary key, 
pname varchar (50), 
price int,
category varchar (30), 
stock int
);

-- Q2. Insert all 6 products in one single INSERT statement.

insert into products
values
(1, "Rice Bag", 2200, "Grocery", 50),
(2, "Laptop", 85000, "Electronics", 10),
(3, "Mobile", 30000, "Electronics", 25), 
(4, "Noodles", 25, "Grocery", 500), 
(5, "Shampoo", 350 , "Beauty", 80), 
(6, "TV", 55000, "Electronics", 8);
 
 select * from products;
 
 -- Q3. Insert product 7, giving only product_id and pname ("Pen"). which columns become NULL?
 
 insert into products (id, pname)
 values 
 (7, "Pen");
 
 -- The Columns "price", "category", and "stock" become NULL.
 
 select * from products;
 
 -- Q4. Try to insert another product with product_id = 3. Write down the exact error and explain why it happened.

insert into products (id, pname, price, category, stock)
values 
(3, "keyboard", 2500, "Electronics", 10);

-- Error code 1062: Duplicate entry '3' for key 'products.PRIMARY'. 
-- because the product_id = 3 is already exits in database and Primary key cannot be duplicated or repeated. 

-- Q5. Insert two more products of your choice in one statement: one Grocery item, and one Beauty item.

insert into products 
values 
(8, "Eggs", 450, "Grocery", 100), 
(9, "Face Wash", 400, "Beauty", 50);

-- Q6. Show all columns of all products. 

select * from products;

-- Q7. Show only pname and price. 
select pname, price from products; 

-- Q8. Show products with price above 1000

select * from products where price > 1000; 

-- Q9. Show Electronics products with the stock less than 20 (AND)
select pname, category, stock from products 
where category = "Electronics" and stock < 20 ; 

-- Q10. Show products that are Grocery or cost less than 500 (OR)
select pname, category, price from products 
where category = "Grocery" or price < 500; 

-- Q11. Show products in categories Grocery and Beauty, using IN. 
select pname, category from products
where category in ("Grocery" , "Beauty"); 

-- Q12. Show products with price between 300 and 40000. Is 350 inculded? why? 
select pname, price from products 
where price between 300 and 40000;

-- Yes, 350 is included, because 350 is come in a range between 3000 and 40000. 

-- Q13. Show products whose name starts with "M". 
select pname from products where pname like "M%"; 

-- Q14. Show products whose name contains the letter "o". 
select pname from products where pname like "%o%"; 

-- Q15. Show the 2 most expensive products (Which two keywords together?). 
select pname, price from products order by price desc limit 2;

-- Q16. The Laptop price is dropped to 79000. Update it using id. 
update products 
set price = 79000 
where id = 2; 
-- The laptop price was 85000 before and after updating the price drop to 79000. 
select * from products;

-- Q17. Festival offer: reduce the price of every Electornics products by 10%. Hint: set price = price*0.9. 
update products 
set price = price *0.9
where id in (2, 3, 6);

select * from products;

-- Q18. Ten Rice bags were sold. Decrease its stock by 10 with one query. 
update products 
set stock = stock - 10
where id = 1; 
-- Before the stock of Rice Bag was 50 and now after updating to reduce by 10, it become 40.
select * from products;

-- Q19. Delete the product name "Pen". 
delete from products where id = 7; 

-- Then delete all products with stock below 10. How many rows did each query removed?
delete from products 
where id = 6; 

select * from products;

-- Q20. Run select to check the final table. 
select * from products;

-- Then answer, which command would empty the table but keep it, and which would remove the table completely.
-- Empty the table but keep the table we use command: 
			-- truncate table table_name; 
            
-- To remove the table completely: 
			-- drop table table_name;

