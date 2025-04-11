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
