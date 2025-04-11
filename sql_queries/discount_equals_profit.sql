#exploring if there are instances where profit= Discount 
select * from financials1
where Discounts = Sales-COGS;
##Observed 11 instances where profit=Discount, All the instances are under enterprise segment with A low discount band

#Based on above results, exploring the enterprise segment further
select count(Segment) from financials1
WHERE Segment = 'Enterprise';
##There are 100 entries under the enterprise segment
