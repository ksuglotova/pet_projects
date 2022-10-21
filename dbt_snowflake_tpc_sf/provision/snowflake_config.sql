create or replace warehouse snow_test warehouse_size=small initially_suspended=true;
-- create user dbt_user
create or replace database dbt_project; 
create or replace role transformer;
grant role transformer to user dbt_user;
grant operate on warehouse snow_test to role transformer;
grant usage on warehouse snow_test to role transformer;
grant imported privileges on database snowflake_sample_data to transformer;
grant usage on schema snowflake_sample_data.tpch_sf10 to transformer;
grant usage on database dbt_project to transformer;
grant create schema on database dbt_project to transformer;
grant select on all tables in schema snowflake_sample_data.tpch_sf10 to transformer;
grant select on future views in schema dbt_project.dev_ksu to accountadmin;
grant select on future tables in schema dbt_project.dev_ksu to accountadmin;