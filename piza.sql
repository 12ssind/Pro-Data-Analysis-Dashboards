use pizza_db;
select*from pizza_sales;
select quantity , pizza_name_id from pizza_sales
where quantity > '1' ;

-- Total revenue
select sum(total_price) as Total_revenue from pizza_sales;

-- Average Order Values
select sum(total_price) / count(distinct(order_id)) as avg_order_value from pizza_sales;

-- Total pizzas sold
select sum(quantity)  as tol_piza_sold from pizza_sales;

-- Total Orders
select count(distinct order_id ) as tol_orders from pizza_sales;

-- average pizzas per order
select sum(quantity) / count(distinct order_id) as avg_piz_per_order from pizza_sales;

alTER table pizza_sales
modify column order_date DATE;
update pizza_sales
set order_date= str_to_date(order_date,'%m/%d/%y');

-- CHART REQURIMEMTS

-- daily trend of total orders
 select extract(DAY from order_date) as dayname from pizza_sales;
 select dayname(str_to_date(order_date)) as dayname from pizza_sales;
 
 -- percentage of sales by pizza category
 select pizza_category , round(sum(total_price)*100/(select sum(total_price) from pizza_sales),0) as percentage_of_sales
 from pizza_sales group by pizza_category;
 
 
 -- percentage of sales by pizza size
 select pizza_size, sum(total_price)*100/(select sum(total_price) from pizza_sales) as percentage_of_sales_size
 from pizza_sales group by pizza_size;
 select*from pizza_sales;
 --
select sum(quantity),pizza_category from pizza_sales group by pizza_category;


select  pizza_name , sum(quantity) as total_piza_sold from pizza_sales 
group by pizza_name 
order by total_piza_sold desc limit 5 ; 

select pizza_name , sum(quantity) as total_piza_sold , pizza_size from pizza_sales 
where pizza_size = 'M'
group by pizza_name 
order by total_piza_sold asc limit 5 ;


 
