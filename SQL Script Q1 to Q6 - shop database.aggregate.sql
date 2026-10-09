use shop; 

select * from products;

-- Q1. Total number of products. 
select count(*) from products; 

-- Cheapest price and most expensive price in one query.
 select min(price), max(price) from products; 
 
 -- Q2. Total stock of all products. 
 select sum(stock)from products;  
 
 -- Total stock of Electronics only.
 select sum(stock) from products 
 where category = "Electronics"; 
 
 -- Q3. Average price per category (Groupby). 
 select category , avg(price) as average_price
 from products 
 group by category; 
 
 -- Q4. Count products per category, but show only categories with at least 2 products. Where or having? why? 
 select category, count(*) as product_count 
 from products
 group by category
 having count(*) >= 2; 
 
 -- Q5. Average price per category, counting only products cheaper than 60000. Which filter goes in Where?
 select category, avg(price) as average_price
 from products 
 where price < 60000
 group by category;
 
-- Note* WHERE come before GROUPBY and HAVING come after GROUPBY.
 
 -- Q6. Categories where the average price is above 1000, sorted biggest first. Use the full general order. 
 select category, avg(price) as average_price
 from products
 where price > 1000
 group by category 
 order by average_price desc; 
 
 
 