{{ config(materialized = 'table', transient = false,  
    pre_hook = "use warehouse compute_wh;",  
    sql_header = "use role accountadmin ;",
    post_hook = "create or replace table QWT_DEV.STAGING_DEV.STG_PRODUCTS_TESTS CLONE
     QWT_DEV.STAGING_DEV.STG_PRODUCTS_SQL ; ") }}

select * from 
{{source("qwt_raw", "raw_products")}}