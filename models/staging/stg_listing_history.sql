with source as (

  select * from source_data.listing_history

),

renamed as (
select
  listing_id
  ,nullif(replace(split_part(price, '$', 2), ',', ''), '')::float as price
  ,case available when 't' then TRUE else FALSE end as available
  ,date as listing_date
  from source s
)

select * from renamed
