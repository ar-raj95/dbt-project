select
    order_id,
    customer_id,
    cast(order_date as date) as order_date      -- seed loads this as text, we want a real date

from {{ ref('orders') }}

where order_date is not null                    -- drop orders with no date