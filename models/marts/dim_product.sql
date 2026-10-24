select
    md5('product_id') as product_sk, -- create surrogate key
    product_id,
    product_name,
    category,
    unit_price

from {{ ref('stg_products') }}