{% macro alter_wh(warehouse) %}

{% set vsetwarehouse %}
use database qwt_dev ;

ALTER WAREHOUSE {{warehouse}} SET warehouse_size=SMALL;

{% endset %}
 
{% do run_query(vsetwarehouse) %}

{% endmacro %}