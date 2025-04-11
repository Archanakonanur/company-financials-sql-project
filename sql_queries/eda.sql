#Basic EDA
select * from financials1;
describe financials1;
select count(*) from financials1;

#Understanding the distinct values accross segment, country, product and year
select distinct segment from financials1;
select distinct country from financials1;
select distinct product from financials1;
select distinct year from financials1;


# Minimum, maximum & average units sold
select min(UnitsSold) from financials1 as min_units; 
select max(UnitsSold) from financials1 as max_units;
select avg(UnitsSold) from financials1 as avg_units;
