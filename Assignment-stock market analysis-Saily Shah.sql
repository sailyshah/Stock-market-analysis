create schema `assignment`;

### Use schema named 'assignment'
use `assignment`;

### Imported all the CSV files using "MySQL for excel" option in Excel
# Date column has been assigned as primary key in the excel before importing the dataset in MySQL
# created tables are named as bajaj_auto, eicher_motors, hero_motocorp, infosys, tcs & tvs_motors 

-- ------------------------------------EDA-----------------------------------------
### checking Bajaj Auto stock data
# Checking the columns and data types
desc bajaj_auto;

# Count of rows
select count(*) from bajaj_auto;

# Glimpse of data
select * from bajaj_auto limit 5;

### checking Eicher Motors stock data
# Checking the columns and data types
desc eicher_motors;

# Count of rows
select count(*) from eicher_motors;

# Glimpse of data
select * from eicher_motors limit 5;

### checking Hero Motorcorp stock data
# Checking the columns and data types
desc hero_motocorp;

# Count of rows
select count(*) from hero_motocorp;

# Glimpse of data
select * from hero_motocorp limit 5;

### checking Infosys stock data
# Checking the columns and data types
desc infosys;

# Count of rows
select count(*) from infosys;

# Glimpse of data
select * from infosys limit 5;

### checking TCS stock data
# Checking the columns and data types
desc tcs;

# Count of rows
select count(*) from tcs;

# Glimpse of data
select * from tcs limit 5;

### checking TVS_Motors stock data
# Checking the columns and data types
desc tvs_motors;

# Count of rows
select count(*) from tvs_motors;

# Glimpse of data
select * from tvs_motors limit 5;

-- --------------------------- Expected Result = 1 ---------------------------------
####### RESULT 1 =  Create a table containing date, close price, MA for 20 & 50 days.#######

### Create new tables for each stock
create table bajaj1 (
	`date` date,
	`close_price` decimal(10,2),
    `MA20` decimal(10,2),
    `MA50` decimal(10,2)  ,
    `row_num` integer
);

create table eicher1 like bajaj1;
create table hero1 like bajaj1;	
create table infosys1 like bajaj1;
create table tcs1 like bajaj1;
Create table tvs1 like bajaj1;	


-- ##  Insert values into the table to include 20 DAY and 50 DAY Moving Averages columns

# For bajaj_auto stocks
insert into bajaj1 (Date, close_price,MA20, MA50,row_num)
	select Date,close_price, 
       avg(close_price) over (order by date asc rows 19 preceding) as 'MA20',
       avg(close_price) over (order by date asc rows 49 preceding) as 'MA50',
       ROW_NUMBER() OVER (ORDER BY Date) as row_num
	from bajaj_auto
    order by Date;

-- Removing the avg values calculated for the 1st 20 rows in MA20 and for 1st 50 rows in MA50
UPDATE bajaj1
SET MA20 = NULL
WHERE
   row_num < 20; 
  
UPDATE bajaj1
SET MA50 = NULL
WHERE
   row_num < 50; 

-- We no longer require the column with row numbers. Let us drop it.
alter table bajaj1
drop column row_num;
    
  
# For Eicher_Motor stocks
insert into eicher1 (Date, close_price,MA20, MA50,row_num)
	select Date,close_price, 
       avg(close_price) over (order by date asc rows 19 preceding) as 'MA20',
       avg(close_price) over (order by date asc rows 49 preceding) as 'MA50',
       ROW_NUMBER() OVER (ORDER BY Date) as row_num
	from eicher_motors
    order by Date;  
 
-- Removing the avg values calculated for the 1st 20 rows in MA20 and for 1st 50 rows in MA50
UPDATE eicher1
SET MA20 = NULL
WHERE
   row_num < 20; 
  
UPDATE eicher1
SET MA50 = NULL
WHERE
   row_num < 50; 

-- We no longer require the column with row numbers. Let us drop it.
alter table eicher1
drop column row_num;

# For hero_motorcorp stocks
insert into hero1 (Date, close_price,MA20, MA50,row_num)
	select Date,close_price, 
       avg(close_price) over (order by date asc rows 19 preceding) as 'MA20',
       avg(close_price) over (order by date asc rows 49 preceding) as 'MA50',
       ROW_NUMBER() OVER (ORDER BY Date) as row_num
	from hero_motocorp
    order by Date;  

-- Removing the avg values calculated for the 1st 20 rows in MA20 and for 1st 50 rows in MA50
UPDATE hero1
SET MA20 = NULL
WHERE
   row_num < 20; 
  
UPDATE hero1
SET MA50 = NULL
WHERE
   row_num < 50; 

-- We no longer require the column with row numbers. Let us drop it.
alter table hero1
drop column row_num;

# For infosys stocks
insert into infosys1 (Date, close_price,MA20, MA50,row_num)
	select Date,close_price, 
       avg(close_price) over (order by date asc rows 19 preceding) as 'MA20',
       avg(close_price) over (order by date asc rows 49 preceding) as 'MA50',
       ROW_NUMBER() OVER (ORDER BY Date) as row_num
	from infosys
    order by Date;  

-- Removing the avg values calculated for the 1st 20 rows in MA20 and for 1st 50 rows in MA50
UPDATE infosys1
SET MA20 = NULL
WHERE
   row_num < 20; 
  
UPDATE infosys1
SET MA50 = NULL
WHERE
   row_num < 50; 

-- We no longer require the column with row numbers. Let us drop it.
alter table infosys1
drop column row_num;

  
# For tcs stocks
insert into tcs1 (Date, close_price,MA20, MA50,row_num)
	select Date,close_price, 
       avg(close_price) over (order by date asc rows 19 preceding) as 'MA20',
       avg(close_price) over (order by date asc rows 49 preceding) as 'MA50',
       row_number() over (order by date) as 'row_num'
	from tcs
    order by Date;  

-- Removing the avg values calculated for the 1st 20 rows in MA20 and for 1st 50 rows in MA50
UPDATE tcs1
SET MA20 = NULL
WHERE
   row_num < 20; 
  
UPDATE tcs1
SET MA50 = NULL
WHERE
   row_num < 50; 

-- We no longer require the column with row numbers. Let us drop it.
alter table tcs1
drop column row_num;


# For tvs_motors stocks
insert into tvs1 (Date, close_price,MA20, MA50,row_num)
	select Date,close_price, 
       avg(close_price) over (order by date asc rows 19 preceding) as 'MA20',
       avg(close_price) over (order by date asc rows 49 preceding) as 'MA50',
       row_number() over (order by date) as 'row_num'
	from tvs_motors
    order by Date;  

-- Removing the avg values calculated for the 1st 20 rows in MA20 and for 1st 50 rows in MA50
UPDATE tvs1
SET MA20 = NULL
WHERE
   row_num < 20; 
  
UPDATE tvs1
SET MA50 = NULL
WHERE
   row_num < 50; 

-- We no longer require the column with row numbers. Let us drop it.
alter table tvs1
drop column row_num;

  
-- view values inserted in each table 

select * from bajaj1;
select * from eicher1;
select * from hero1;
select * from infosys1;
select * from tcs1;
select * from tvs1;


-- --------------------------- Expected Result = 2 ---------------------------------
####### RESULT 2 =  Create a Master table with cllose prices of all the stocks #######

create table master_table as 
( select date,b.Close_Price as 'Bajaj',t.Close_Price as 'TCS',v.Close_Price as 'TVS',i.Close_Price as 'Infosys', e.Close_Price as 'Eicher',h.Close_Price as 'Hero'
from bajaj1 b inner join eicher1 e using(date)
 inner join hero1 h using(date)
 inner join infosys1 i using(date)
 inner join tcs1 t using(date)
 inner join tvs1 v using(date));
 
## Glimpse of Master Table
select *
from master_table;
  
-- --------------------------- Expected Result = 3 ---------------------------------
####### RESULT 3 =  Creating table with signal information #######
# Signal will be updated only on 'crossing points' whenever 20_Day_MA crosses 50_Day_MA
# Crossing points can be checked by using lag function
# Signal is updated on 'crosssing points' based on following condition:
-- # if 20_Day_MA > 50_Day_MA than Buy
-- # if 20_Day_MA < 50_Day_MA than Sell
-- # else Hold
# Setting the first 49 rows signal as 'NA' (Not applicable) in all tables , as MA50
-- is only valid from the 50th row onwards and hence signals starting from the 50th row alone will be valid

## Creating bajaj2

create view raw_file1 as
select *, ROW_NUMBER() OVER (ORDER BY Date) RowNumber
from bajaj1;

create table bajaj2
(select Date,Close_Price,
CASE
	when RowNumber < 50 then 'NA'  # Ignoring the first 49 rows
    when MA20 > MA50 and (lag(MA20,1) over (order by date)) < (lag(MA50,1) over (order by date)) 
				then 'Buy'
	when MA20 < MA50 and (lag(MA20,1) over (order by date)) > (lag(MA50,1) over (order by date))
				then 'Sell'
	else 'Hold'	
END as 'Signal' 
from raw_file1);


# Creating eicher2

create view raw_file2 as
select *, ROW_NUMBER() OVER (ORDER BY Date) RowNumber
from eicher1;

create table eicher2
(select Date, Close_Price,
CASE
	when RowNumber < 50 then 'NA'  # Ignoring the first 49 rows
    when MA20 > MA50 and (lag(MA20,1) over (order by date)) < (lag(MA50,1) over (order by date)) 
				then 'Buy'
	when MA20 < MA50 and (lag(MA20,1) over (order by date)) > (lag(MA50,1) over (order by date))
				then 'Sell'
	else 'Hold'	
END as 'Signal' 
from raw_file2);

# Creating hero2
create view raw_file3 as
select *, ROW_NUMBER() OVER (ORDER BY Date) RowNumber
from hero1;

create table hero2
(select Date, Close_Price,
CASE
	when RowNumber < 50 then 'NA'  # Ignoring the first 49 rows
    when MA20 > MA50 and (lag(MA20,1) over (order by date)) < (lag(MA50,1) over (order by date)) 
				then 'Buy'
	when MA20 < MA50 and (lag(MA20,1) over (order by date)) > (lag(MA50,1) over (order by date))
				then 'Sell'
	else 'Hold'	
END as 'Signal' 
from raw_file3);

# Creating infosys2
create view raw_file4 as
select *, ROW_NUMBER() OVER (ORDER BY Date) RowNumber
from infosys1;

create table infosys2
(select Date, Close_Price,
CASE
	when RowNumber < 50 then 'NA'  # Ignoring the first 49 rows
    when MA20 > MA50 and (lag(MA20,1) over (order by date)) < (lag(MA50,1) over (order by date)) 
				then 'Buy'
	when MA20 < MA50 and (lag(MA20,1) over (order by date)) > (lag(MA50,1) over (order by date))
				then 'Sell'
	else 'Hold'	
END as 'Signal' 
from raw_file4);

# Creating tcs2
create view raw_file5 as
select *, ROW_NUMBER() OVER (ORDER BY Date) RowNumber
from tcs1;

create table tcs2
(select Date, Close_Price,
CASE
	when RowNumber < 50 then 'NA'  # Ignoring the first 49 rows
    when MA20 > MA50 and (lag(MA20,1) over (order by date)) < (lag(MA50,1) over (order by date)) 
				then 'Buy'
	when MA20 < MA50 and (lag(MA20,1) over (order by date)) > (lag(MA50,1) over (order by date))
				then 'Sell'
	else 'Hold'	
END as 'Signal' 
from raw_file5);

# Creating TVS2
create view raw_file6 as
select *, ROW_NUMBER() OVER (ORDER BY Date) RowNumber
from tvs1;

create table tvs2
(select Date, Close_Price,
CASE
	when RowNumber < 50 then 'NA'  # Ignoring the first 49 rows
    when MA20 > MA50 and (lag(MA20,1) over (order by date)) < (lag(MA50,1) over (order by date)) 
				then 'Buy'
	when MA20 < MA50 and (lag(MA20,1) over (order by date)) > (lag(MA50,1) over (order by date))
				then 'Sell'
	else 'Hold'	
END as 'Signal' 
from raw_file6);


### Getting Glimpse of all the newly created signal tables

select * from bajaj2;
select * from eicher2;
select * from infosys2;
select * from hero2;
select * from tcs2;
select * from tvs2;

-- --------------------------- Expected Result = 4 ---------------------------------
####### RESULT 4 =  Creating a user defined function for bajaj stock #######
## Function should take 'date' as input and returns the signal(Buy/Sell/Hold) for that particular day

delimiter $$

create function signal_bajaj (d date)
returns varchar(15) deterministic
begin 
	declare Trade_Signal varchar(15);
    select `Signal` 
    from bajaj2 
    where date=d into Trade_Signal;
	return Trade_Signal ;
  end
  
$$ delimiter ;

-- Sample query to generate a signal
select signal_bajaj('2018-06-21') as Trade_signal;


## Results 5 - Queries used to help in drawing the Inferences from the stock analysis

-- For Bajaj

select date, close_price
from bajaj2
where `signal` = 'Buy'
order by close_price
limit 1;

select date, close_price
from bajaj2
where `signal` = 'Sell'
order by close_price desc
limit 1;


-- For Eicher

select date, close_price
from eicher2
where `signal` = 'Buy'
order by close_price
limit 1;

select date, close_price
from eicher2
where `signal` = 'Sell'
order by close_price desc
limit 1;


-- For Hero

select date, close_price
from hero2
where `signal` = 'Buy'
order by close_price
limit 1;

select date, close_price
from hero2
where `signal` = 'Sell'
order by close_price desc
limit 1;


-- For Infosys 

select date, close_price
from infosys2
where `signal` = 'Buy'
order by close_price
limit 1;

select date, close_price
from infosys2
where `signal` = 'Sell'
order by close_price desc
limit 1;


-- For TCS 

select date, close_price
from tcs2
where `signal` = 'Buy'
order by close_price
limit 1;

select date, close_price
from tcs2
where `signal` = 'Sell'
order by close_price desc
limit 1;


-- For TVS 

select date, close_price
from tvs2
where `signal` = 'Buy'
order by close_price
limit 1;

select date, close_price
from tvs2
where `signal` = 'Sell'
order by close_price desc
limit 1;
    