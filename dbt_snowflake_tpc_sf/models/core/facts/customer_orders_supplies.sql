{{ config(materialized='table') }}

select
  {{ dbt_utils.surrogate_key(['c.c_custkey', 'c.o_orderkey', 'c.l_linenumber']) }} AS pk
, c.c_custkey
, c.c_nationkey
, c.n_regionkey
, c.phone_area_code AS c_phone_area_code
, c.o_orderkey
, c.o_orderstatus
, c.o_orderdate
, c.o_orderpriority
, c.o_clerk
, c.l_partkey
, c.l_suppkey
, c.l_linenumber
, c.l_quantity
, c.l_extendedprice
, c.l_discount
, c.l_tax
, c.l_returnflag
, c.l_linestatus
, c.l_shipdate
, c.l_commitdate
, c.l_receiptdate
, c.l_shipmode
, s.s_nationkey
, s.p_name
, s.p_mfgr
, s.p_brand
, s.p_type
, s.p_size
, s.p_retailprice
, s.ps_supplyprice
from {{ ref('customer_orders') }} c
left join {{ ref('supply_parts') }} s
  on c.l_partkey = s.p_partkey
  and c.l_suppkey = s.s_suppkey