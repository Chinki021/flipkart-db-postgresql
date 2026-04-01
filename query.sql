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

--clause with operators

select * from products where price between 400 and 1000;

select * from products where category in ('Electronics','Accessories');

select * from products where sku_code like 'W%';
select * from products where sku_code like '%123';
select * from products where sku_code like '_B%';

select * from products where not category='Electronics';

--aggregation functions

select count(stock_quantity) from products;
select sum(price) from products;

/* Q1. Display the name and price of the cheapest product in the
entire table.
Q2.Find the average price of products that belong to the 'Home &
Kitchen' or 'Fitness' category.
Q3. Show product names and stock quantity where the product is
available, stock is more than 50, and price is not equal to ₹299.
Q4. Find the most expensive product in each category (name and
price).
Q5. Show all unique categories in uppercase, sorted in descending
order.*/

select name , price from products where price=(select min(price) from products);
select avg(price) from products where category in ('Home & Kitchen', 'Fitness');
select  name , stock_quantity from products where is_available=true and stock_quantity>50 and price!=299;
select category , Max(price) from products 
Group by category;
select  distinct upper(category) from products order by  upper(category)DESC;

/*Best way to learn the case is using a simple example
where you will add a custom column in which you will
have price_tag. 
If the price is above 1000 you will say it is expensive. 
If the price is between 500 and 1000 you will say it is
moderate. 
and If the price is below 500 it is cheap.*/

select name , price,
case
 WHEN price > 1000 then 'expensive'
 WHEN price between 500 and 1000 then 'moderate'
	else 'cheap'
end as price_tag
from products;

--THIS WAS JUST A SNAPSHOT , NOT PERMANENT CHANGE IN TABLE

--LETS create a permanent column for this

alter table products
add column price_tag text;

update products
set price_tag=
case
 WHEN price > 1000 then 'expensive'
 WHEN price between 500 and 1000 then 'moderate'
	else 'cheap'
end;
select name , price , price_tag from products;



/*Ok now lets do one important question inside is available
column you have boolean true and false show case a new
column to with in_stock and out of stock.*/

select name,
case
	when is_available=true then 'in_stock'
	else 'out_of_stock'
end as availability_status
from products;

SELECT name, is_available FROM products;

/*HIGHLIGHT STOCK STATUS
“ Show product name, stock quantity, and label:
"High Stock" if quantity > 100
"Medium Stock" if between 30 and 100
"Low Stock" otherwise*/

select name,stock_quantity,
case
	WHEN stock_quantity>100 then 'high stock'
	WHEN stock_quantity between 30 and 100 then 'Medium stock'
	else 'low stock'
end as label
from products;




