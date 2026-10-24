select
    md5('customer_id') as customer_sk, -- create surrogate key
    customer_id,
    full_name,
    email,
    signup_date,
    case
        when signup_date >= dateadd('month', -6, current_date) then 'New'
        when signup_date >= dateadd('year', -2, current_date)  then 'Regular'
        else                                                        'Loyal'
    end as customer_segment         -- business logic for customer segments

from {{ ref('stg_customers') }}