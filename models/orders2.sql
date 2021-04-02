with orders as (
    select * from {{ ref('stg_orders' )}}
), 
payments as (
    select * from {{ ref('stg_payments') }}
)


select o.order_id, o.customer_id, o.order_date, COUNT(1) AS count_of_payments, SUM(amount) AS Total_payments
from orders o
join payments p on p.order_id = o.order_id 
where p.status = 'success'
group by o.order_id, o.customer_id, o.order_date
order by customer_id, o.order_id, o.order_date