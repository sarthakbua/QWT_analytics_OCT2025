{{ config(materialized = 'table', schema = 'transforming_dev') }}

select
 
ss.orderid,
ss.lineno,
ss.ShipmentDate,
ss.status,
sh.companyname as shipmentcompnay
 
from
 
qwt_dev.snapshots_dev.shipments_snapshot as ss
inner join
QWT_DEV.lookup_dev.lkp_shippers as sh
on ss.ShipperID = sh.shipperid
 
where ss.dbt_valid_to is null