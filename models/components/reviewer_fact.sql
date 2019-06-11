with listings as (
  select * from {{ ref('stg_listings') }}
),
reviews as (
  select * from {{ ref('stg_reviews') }}
),

select
  reviewer_name
  ,min(review_date) as first_review_date
  ,count(distinct review_id) as reviews_cnt
  ,count(distinct listing_id) as listings_cnt

from reviews
