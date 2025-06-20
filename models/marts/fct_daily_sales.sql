with 

int_model as (

    select * from {{ ref('int_successful_payments') }}

),

aggregated as (

    select
        created_at as date,
        sum(amount) as daily_sales
        
    from int_model
    group by 1
    order by date asc

)

select * from aggregated