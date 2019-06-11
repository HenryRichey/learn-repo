with listings as (
  select * from {{ ref('stg_listings') }}
),
reviews as (
  select * from {{ ref('stg_reviews') }}
),

select
  host_name
  ,max(host_since) as start_date
  ,count(distinct listing_id) as listings
  ,sum(number_of_reviews) as reviews_cnt
  ,avg(review_scores_value) as avg_review_scores
  ,min(first_review) as first_review
  ,max(last_review) as last_review
  ,max(is_superhost) as is_superhost
  ,avg(response_time) as response_time
  ,avg(response_rate) as response_rate

from listings
group by host_name
