select to_number((amount/100), 38)amount,
       id as customer_id,
       orderid as order_id,
       status
from {{source('stripe','payment')}}