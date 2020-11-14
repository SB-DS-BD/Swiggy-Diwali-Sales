Create database Swiggy_Diwali_Data; 
create table Pre_Data(
Date char(20),
ID int,
City int,
NAME char(100),
ITEM_ID int,
ITEM_NAME char(100),
Hour_of_the_day int,
ORDERS int,
QTY int,
ITEM_GMV int,
CATEGORY char(20)
);
create table Post_Data(
Date char(20),
ID int,
City int,
NAME char(100),
ITEM_ID int,
ITEM_NAME char(100),
Hour_of_the_day int,
ORDERS int,
QTY int,
ITEM_GMV int,
CATEGORY char(20)
);
/*1*/
select Hour_of_the_day, count(id) as number_of_orders from pre_data
group by Hour_of_the_day
order by 1;

select Hour_of_the_day, count(id) as number_of_orders from post_data
group by Hour_of_the_day
order by 1;
/*2*/
select city, count(id) as number_of_orders from pre_data
group by city
order by 1;

select city, count(id) as number_of_orders from post_data
group by city
order by 1;
/*3*/
select city, ITEM_NAME, count(ITEM_Name) as number_of_items from pre_data
group by city,ITEM_NAME
having count(ITEM_Name)>1
order by 3 desc;

select city, ITEM_NAME, count(ITEM_Name) as number_of_items from post_data
group by city,ITEM_NAME
having count(ITEM_Name)>1
order by 3 desc;
/*4*/
select Hour_of_the_day, sum(ORDERS) as Total_orders from pre_data
where QTY>1
group by Hour_of_the_day
order by 2 desc;

select Hour_of_the_day, sum(ORDERS) as Total_orders from post_data
where QTY>1
group by Hour_of_the_day
order by 2 desc;
/*5*/
select day(str_to_date(Date, '%d-%m-%Y')) as Day, sum(ITEM_GMV) as Revenue
from pre_data group by day(str_to_date(Date, '%d-%m-%Y'))
order by 2 desc;

select left(Date,2) as Day, sum(ITEM_GMV) as Revenue
from post_data group by left(Date,2);
/*6*/
select CATEGORY, sum(ITEM_GMV) as Revenue from pre_data
group by CATEGORY order by 2 desc;

select CATEGORY, sum(ITEM_GMV) as Revenue from post_data
group by CATEGORY order by 2 desc;
/*7*/
select Hour_of_the_day, sum(ITEM_GMV) as Revenue from pre_data
group by Hour_of_the_day order by 2 desc;

select Hour_of_the_day, sum(ITEM_GMV) as Revenue from post_data
group by Hour_of_the_day order by 2 desc;
/*8*/
select city, CATEGORY, count(CATEGORY) as max_order_categoty from pre_data
group by city,CATEGORY
order by 3 desc;

select city, CATEGORY, count(CATEGORY) as max_order_categoty from post_data
group by city,CATEGORY
order by 3 desc;
/*9*/
select ITEM_NAME, sum(ITEM_GMV) as Revenue from pre_data
group by ITEM_NAME
order by 2 desc;

select ITEM_NAME, sum(ITEM_GMV) as Revenue from post_data
group by ITEM_NAME
order by 2 desc;
/*10*/
select City, sum(ITEM_GMV) as Revenue from pre_data
group by City
order by 2 desc;

select City, sum(ITEM_GMV) as Revenue from post_data
group by City
order by 2 desc;
