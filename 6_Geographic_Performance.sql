SELECT 
	customerkey,
	COUNT(DISTINCT customerkey),
	COUNT(orderkey) AS frequency,
	SUM(quantity * netprice * exchangerate) AS total_net_revenue,
	MAX(orderdate)
FROM sales
GROUP BY customerkey