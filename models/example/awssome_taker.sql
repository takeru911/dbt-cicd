with customer as (
    select * from {{source('sample_data', 'customer')}}
)
,orders as (
    select * from {{source('sample_data','orders')}}
)

select 
    c_custkey,
    c_name,
    c_nationkey,
    c_phone,
    count(distinct o_orderkey) as order_count,
    sum(o_totalprice) as order_price
from customer as c
join orders as o on c.c_custkey = o.o_custkey
group by all
order by 1,2,3