select
    customer_id,
    customer_name              as full_name,
    lower(trim(email))         as email,        -- clean up casing and stray whitespace
    cast(signup_date as date)  as signup_date   -- seed loads this as text, we want a real date
                                                -- password_hash intentionally excluded
from {{ ref('customers') }}