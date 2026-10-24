select
    md5('order_items.order_item_id') as sale_sk,                -- create surrogate key
    order_items.order_item_id,
    order_items.order_id,
    dim_customer.customer_sk,
    dim_product.product_sk,
    orders.order_date,
    date_part('year', orders.order_date) as order_year,         -- extract year out for year-over-year reporting
    order_items.quantity,
    order_items.quantity * dim_product.unit_price as revenue    -- calculate revenue using data from two tables

from {{ ref('stg_order_items') }} as order_items

inner join {{ ref('stg_orders') }} as orders
    on order_items.order_id = orders.order_id

inner join {{ ref('dim_customer') }} as dim_customer
    on orders.customer_id = dim_customer.customer_id

inner join {{ ref('dim_product') }} as dim_product
    on order_items.product_id = dim_product.product_id