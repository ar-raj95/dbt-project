select
    product_id,
    product_name,
    initcap(coalesce(trim(category),        -- fix inconsistent casing ("Electronics" vs "electronics")
            'Uncategorized')) as category,  -- fill in the handful of products with no category assigned
    cast(replace(unit_price, '$', '') as decimal(10, 2)) as unit_price  -- unit_price comes in as text ("$29.99")

from {{ ref('products') }}