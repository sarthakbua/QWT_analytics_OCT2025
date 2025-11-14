{{config(materialized ='table', schema= 'transforming_dev')}}

select 
CustomerID  ,
CompanyName  ,
ContactName  ,
City  ,
Country  ,
DivisionName  ,
Address  ,
Fax  ,
Phone  ,
PostalCode  , 
IFF(c.StateProvince = '', 'NA',c.StateProvince) as statement
from
{# {{ref('stg_customers')}} as c left join  #}

{{ref('stg_customers_py')}} as c left join
{{ref('lkp_divisions')}} as d on
c.divisionid = d.divisionid