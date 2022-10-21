{{ config(materialized='table') }}

SELECT
  {{ dbt_utils.surrogate_key(['s.s_suppkey', 'p.p_partkey']) }} AS pk
, s.s_suppkey
, s.s_nationkey
, p.p_partkey
, p.p_name
, p.p_mfgr
, p.p_brand
, p.p_type
, p.p_size
, p.p_retailprice
, ROUND(ps.ps_supplycost / ps.ps_availqty, 4) AS ps_supplyprice
FROM stg_supplier s
INNER JOIN stg_partsupp ps
  ON s.s_suppkey = ps.ps_suppkey
INNER JOIN stg_part p
  ON ps.ps_partkey = p.p_partkey