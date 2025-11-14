{% macro get_line_numbers() -%}
 
{% set lineno_query %}
 
select distinct
lineno
from {{ ref('fact_orders') }}
order by 1
 
{% endset %}
 
{% set results = run_query(lineno_query) %}
 
{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{% endif %}
 
{{ return(results_list) }}
 
{% endmacro %}

{# query to get date #}

{% macro get_min_ordedate() -%}
 
{% set min_ordedate_query %}
 
select min( orderdate)
from {{ ref('fact_orders') }}
 
 
{% endset %}
 
{% set results = run_query(min_ordedate_query) %}
 
{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0][0] %}
{% else %}
{% set results_list = '2007-04-01'%}
{% endif %}
 
{{ return(results_list) }}
 
{% endmacro %}


{# query to get date #}

{% macro get_max_ordedate() -%}
 
{% set max_ordedate_query %}
 
select max( orderdate)
from {{ ref('fact_orders') }}
 
 
{% endset %}
 
{% set results = run_query(max_ordedate_query) %}
 
{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0][0] %}
{% else %}
{% set results_list = '2007-04-01'%}
{% endif %}
 
{{ return(results_list) }}
 
{% endmacro %}