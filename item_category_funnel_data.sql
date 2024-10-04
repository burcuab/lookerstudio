CREATE or REPLACE TABLE `burcuproject.ga4websample.session_category_funnel` AS (

  SELECT 
    event_date,
    items.item_category as item_category,
    event_name,
    case when event_name='view_item' then '1' 
        when event_name='add_to_cart' then '2'  
        when event_name='begin_checkout' then '3' 
        when event_name='add_shipping_info' then '4' 
        when event_name='add_payment_info' then '5' 
        when event_name='purchase' then '6' end as funnel_order,
    count(distinct concat(user_pseudo_id,(select value.int_value from unnest(event_params) where key = 'ga_session_id'))) as sessions
  FROM 
    `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_202*`,UNNEST(items) AS items
  where 
    event_name in ('view_item','add_to_cart','begin_checkout','add_shipping_info','add_payment_info','purchase')
    and items.item_category is not null and items.item_category<>'' and items.item_category<>'(not set)'
  group by all
)
;