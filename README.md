# Item category funnel in Looker Studio with native funnel chart

Prepare data as below in BQ
- date
- item_category
- event_name
- funnel_order
- sessions

[See sample query using on public GA4 dataset](item_category_funnel_data.sql) 

Go to Looker Studio and add the item category funnel table as data source.
- Use the new native funnel chart
- event_name will be the dimension
- sessions will be the metric
- funnel_order field will be used for sorting asc.
- item_category and date will be filters.

<img width="789" alt="item_category_funnel" src="https://github.com/user-attachments/assets/d2a01e65-6f30-443a-b268-e42e1212af8c">

