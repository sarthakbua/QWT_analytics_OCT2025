{{ config(materialized = 'table', schema = 'transforming_dev') }}
 
{% set min_order_date = get_min_ordedate() %}
{% set max_order_date = get_max_ordedate() %}
 
{{ dbt_date.get_date_dimension(min_order_date, max_order_date) }}