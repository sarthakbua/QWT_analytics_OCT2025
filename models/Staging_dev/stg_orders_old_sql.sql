{{config(materialized = "incremental")}}

select 
orderid,
orderdate,
customerid,
employeeid,
ShipperID ,
Freight 
from 
{{source("qwt_raw", "raw_orders")}}

{% if is_incremental() %}

where orderdate > ( select max(orderdate) from {{this}} )

{% endif %}