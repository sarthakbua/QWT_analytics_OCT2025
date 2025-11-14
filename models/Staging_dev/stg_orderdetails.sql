{{ config(materialized = 'incremental', unique_key = (['orderid','lineno']) , schema= env_var('DBT_STGSCHEMA_NAME','STAGING_DEV') )}}

select
od.OrderID ,
od.lineno ,
od.productid ,
od.quantity ,
od.unit_price ,
od.discount ,
o.orderdate
from 
{{source("qwt_raw", "raw_orderdetails")}} as od
 inner join
 {{source("qwt_raw", "raw_orders")}} as o
 on od.orderid = o.orderid

 {% if is_incremental() %}

 where o.orderdate > (  max(orderdate) from {{this}} )

 {% endif %}