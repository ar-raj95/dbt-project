select
    order_item_id,
    order_id,
    product_id,
    quantity

from {{ ref('order_items') }}

where quantity > 0              -- a negative or zero quantity is a data error, not a real sale