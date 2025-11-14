{{ config(materialized = 'view', schema = 'reporting_dev')}}
 
 select
 c.companyname, 
 c.contactname, 
 c.city , 
 c.country, 
 c.divisionname,
count(o.orderid) totalorder, 
sum(o.quantity) totalquantity , 
sum(o.linesalesamount) totalsales, 
avg(o.margin) avgmargin

from  
{{ref('dim_customers')}} c 
inner join
{{ref('fact_orders')}} o
on c.customerid =o.customerid
where c.divisionname = '{{var('v_division','Europe')}}'
group by c.companyname, c.contactname, c.city , c.country, c.divisionname

 
 