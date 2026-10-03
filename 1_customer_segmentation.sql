with customer_ltv as (
	SELECT
		customerkey,
		cleaned_name,
		SUM(total_net_revenue) as total_ltv
	from cohort_analysis 
	group by 
		customerkey,
		cleaned_name 
), customer_segments as (
	select 
		PERCENTILE_CONT(0.25) within group (order by total_ltv) as ltv_25th_percentile,
		PERCENTILE_CONT(0.75) within group (order by total_ltv) as ltv_75th_percentile
	from customer_ltv
), segment_value as (
	select 
		c.*,
		case 
			when c.total_ltv <  cs.ltv_25th_percentile THEN '1 - Low-Value'
			when c.total_ltv <=  cs.ltv_75th_percentile THEN '2 - Mid-Value'
			else '3 - High-Value'
		end as customer_segment
	from customer_ltv c,
		customer_segments cs
)
select 
	customer_segment,
	SUM(total_ltv) as total_ltv ,
	COUNT(customerkey) as customer_count,
	SUM(total_ltv) / COUNT(customerkey) as svg_ltv
from segment_value 
group by 
	customer_segment
order by 
	customer_segment DESC