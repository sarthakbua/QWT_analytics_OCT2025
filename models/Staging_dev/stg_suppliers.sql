{{ config(materialized = 'table') }}

select get(xmlget(suppliersinfo ,'SupplierID'), '$')::varchar SupplierID,
get(xmlget(suppliersinfo ,'CompanyName'), '$')::varchar as CompanyName,
get(xmlget(suppliersinfo ,'ContactName'), '$')::varchar as ContactName,
get(xmlget(suppliersinfo ,'Address'), '$')::varchar as Address,
get(xmlget(suppliersinfo ,'PostalCode'), '$')::varchar as PostalCode,
get(xmlget(suppliersinfo, 'City'),'$')::varchar as City,
get(xmlget(suppliersinfo ,'Country'), '$')::varchar as Country,
get(xmlget(suppliersinfo ,'Phone'), '$')::varchar as Phone,
get(xmlget(suppliersinfo ,'Fax'), '$')::varchar as Fax
from 
{{source("qwt_raw", "raw_suppliers")}}