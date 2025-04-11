#Basic EDA📊

#Preview all data
select * from financials1;

#table structure
describe financials1;

#total number of records
select count(*) from financials1;
## There are 700 rows

#Distinct categorical values
select distinct segment from financials1;
select distinct country from financials1;
select distinct product from financials1;
select distinct year from financials1;
## Data has 5 uniques segments, 5 countries, 6 products and pertains to the period from September 2013 - December 2014.


#Units sold stats
select min(UnitsSold) from financials1 as min_units; 
select max(UnitsSold) from financials1 as max_units;
select avg(UnitsSold) from financials1 as avg_units;
## Min units sold = 200, Max = 4493 & Avg = 1608

# Profit by country
select country, Round(sum(profit),2) As total_profit
from financials1
group by country
order by total_profit desc;
##France had the highest profit of 37,81,020 USD followed by Germany, Canada, USA and Mexico had the least profit of 29,07,523.11 USD.

#Segment wise avg gross margin (Before discount)
select segment, avg(profit)
from financials1
group by segment;
## It is found that Enterprise has an average loss of 6145 USD, while the rest of the segments all are in profits.

#Segment wise avg net margin (After discount)
select segment, avg(profit-Discounts) as net_profit
from financials1
group by segment;

#Creating a new table to see segment wise  gross profit, net profit and average discount together
  
create table profit_margins (segment text, gross_margin int, net_margin int);

insert into profit_margins (segment, gross_margin, net_margin)
select segment, avg(profit), avg(profit-discounts) from financials1
group by segment;

alter table profit_margins
Add avg_discount int;

insert into profit_margins (segment, gross_margin, net_margin, avg_discount)
select segment, avg(profit), avg(profit-discounts), avg(discounts) from financials1
group by segment;


     ##Deleted the first 10 rows to fix error in code
       delete from profit_margins
       where segment is null or avg_discount is null;
    ## Avg-discount column was not included when the table was created. I altered the table to add the column. But it was showing the values in new rows where the values of other columns were showing null. Hence deleted the first 10 rows

select * from profit_margins;
## Observed the below:
  segment       gross_margin   net_margin  avg_discount
  Enterprise	     -6145	       -20719	     14573
  Government	      37961	        24965	     12996
  Midmarket	        6601	        4593	     2008
  SmallBusiness	    41432	        6294	     35138
  ChannelPartners	  13168	        11822	      1346
