-- create schema msib
do $$ 
begin
    if not exists (
    	select 1 from information_schema.schemata where schema_name = 'msib') then
        execute 'create schema msib';
    end if;
end $$;

-- use schema msib
set search_path to msib;

-- create table ms_order_status
create table ms_order_status (
    id serial primary key
    , status_name varchar(25)
    , created_by varchar(100)
    , created_ts timestamp
    , updated_by varchar(100)
    , updated_ts timestamp
);
drop table ms_provinces;

-- create table ms_provinces
create table ms_provinces (
    id serial primary key
    , province_name varchar(100)
    , created_by varchar(100)
    , created_ts timestamp
    , updated_by varchar(100)
    , updated_ts timestamp
);

-- create table ms_cities
create table ms_cities (
    id serial primary key
    , province_id integer
    , city_level varchar(100)
    , city varchar(100)
    , created_by varchar(100)
    , created_ts timestamp
    , updated_by varchar(100)
    , updated_ts timestamp
    foreign key (province_id) references ms_provinces (id)
);
