{{config(materialized ='table', schema ='transforming_dev')}}

select
p.productid,
p.productname,
c.categoryname,
s.companyname as SupplierCompany,
s.ContactName as SupplierContact,
s.city as SupplierCity,
s.country as SuuplierCountry,
p.quantityperunit,
p.unitcost,
p.unitprice,
p.UNITSINSTOCK,
p.unitsonorder,
iff(p.UNITSINSTOCK>p.unitsonorder, 'ProductAvilable','ProductNotAvilable') as ProductAvilability
from
{{ref('stg_products')}} as p
inner join {{ref('stg_suppliers')}} as s
on p.SupplierID = s.SupplierID

inner join 
{{ref('lkp_categories')}} as c 
on p.CategoryID = c.CategoryID
