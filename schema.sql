/*
create a database named flipkart_db and then create a table with.
product id-serial
name=string
sku_code 8 digit-string
price max(99999999)-number
stock_quantity must be greater than 0-number
is available default true-boolean
category not null-string
added_on-date
last_update-date
*/

create table products(
product_ID serial primary key,
name varchar(100) not null,
sku_code char(8) unique not null check(char_length(sku_code)=8),
price numeric(10,2) check(price>=0),
stock_quantity int default 0 check(stock_quantity>=0),
is_available boolean default TRUE,
category text not null,
added_on date default current_date,
last_update timestamp default now()
);
