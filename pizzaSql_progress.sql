use pizzadb ;
select	* from ps;

#sum(total_price)
select sum(total_price) as Revenue from ps;
#817860.0499

#Average_unit_price
select avg(unit_price) as Average_unit_price from ps;
#16.49413

select count(distinct(pizza_name)) from ps;

select pizza_name,sum(total_price) as Price from ps group by pizza_name order by Price desc limit 33;


#distinct(order_id
select count(distinct(order_id)) from ps;
#21350

#Average_total_Value
select sum(total_price)/count(distinct(order_id)) as Average_total_Value from ps;
#38.3072622

#totalPizzaSold
select sum(quantity) from ps;
#49574

#averagep pizzas per order
select sum(quantity)/count(distinct(order_id)) from ps;
#2.3220

#converting into dateformat
alter table ps
modify column order_date DATE;


#Daily Trend for Orders
select DAYNAME(order_date) as Day_of_week, count(distinct(order_id)) as order_id  from ps group by Day_of_week order by order_id desc;

#Hourly Trend for Orders
select hour(order_time) time,count(distinct(order_id)) Total_orders from ps group by time order by Total_orders;

#% of Sales by Pizza Category
select pizza_category, 
format(sum(total_price),2) as total_revenue, 
format(sum(total_price) *100/ (select sum(total_price) from ps),2) as pct from ps group by pizza_category order by total_revenue;


#% of Sales by Pizza Size
select pizza_Regularize, 
format(sum(total_price),2) as Total_revenue,
format(sum(total_price)*100/(select sum(total_price) from ps),2) as Percentage_Distribution from ps group by pizza_regularize;

#Total Pizzas Sold by Pizza Category
select pizza_category, sum(quantity) from ps group by pizza_category;

#Top 5 Best Sellers by Total Pizzas Sold
select pizza_name, sum(quantity) total_sold from ps group by pizza_name order by total_sold desc limit 5;

#Bottom 5 Best Sellers by Total Pizzas Sold
select pizza_name, sum(quantity) total_sold from ps group by pizza_name order by total_sold limit 5;