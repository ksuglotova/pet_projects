{{ config(materialized='table') }}

SELECT
  {{ dbt_utils.surrogate_key(['c.c_custkey', 'o.o_orderkey', 'li.l_linenumber']) }} AS pk
, c.c_custkey
, c.c_nationkey
, SPLIT_PART(c.c_phone, '-', 1) AS phone_area_code
, o.o_orderkey
, o.o_orderstatus
, o.o_orderdate
, o.o_orderpriority
, o.o_clerk
, li.l_partkey
, li.l_suppkey
, li.l_linenumber
, li.l_quantity
, li.l_extendedprice
, li.l_discount
, li.l_tax
, li.l_returnflag
, li.l_linestatus
, li.l_shipdate
, li.l_commitdate
, li.l_receiptdate
, li.l_shipmode
FROM {{ ref('stg_customer') }} c
INNER JOIN {{ ref('stg_orders') }} o
  ON c.c_custkey = o.o_custkey
INNER JOIN {{ ref('stg_lineitem') }} li
  ON o.o_orderkey = li.l_orderkey