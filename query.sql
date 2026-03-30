select * from products;


--clauses test

/* Q1. Show the name and price of all products.
Q2. Show all products where the category is 'Electronics'.
Q3. Group products by category. Show each category once.
Q4. Show categories that have more than 1 product. (Use after
GROUP BY)
Q5. Show all products sorted by price in ascending order.
Q6. Show only the first 3 products from the table.
Q7. Show product name as "Item_Name" and price as
"Item_Price".
Q8. Show all the unique categories from the products table.*/

select name,price from products;
select * from products where category='Electronics';
select category from products group by category;
select category, count(*) from products
group by category
having count(*)>1;

select * from products order by price;
select * from products order by price DESC;

select * from products limit 3;

select name as item_name , price as item_price from products;

select distinct category from products;
