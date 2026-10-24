select
    products.category,
    count(distinct sales.order_id)  as total_orders,        -- total orders by category
    sum(sales.quantity)             as total_units_sold,    -- total units sold by category
    sum(sales.revenue)              as total_revenue        -- total revenue by category

from {{ ref('fct_sales') }} as sales

inner join {{ ref('dim_product') }} as products
    on sales.product_sk = products.product_sk

group by products.category
having sum(sales.quantity) > 0                              -- exclude categories without any sales volume