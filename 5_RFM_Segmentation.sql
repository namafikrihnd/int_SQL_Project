CREATE VIEW geographic_performance AS(
	SELECT 
			s.customerkey,
			c.country,
			c.state,
			COUNT(DISTINCT s.orderkey) AS total_orders, -- Frekuensi transaksi
			ROUND(SUM(quantity * netprice * exchangerate)::numeric, 2) AS total_net_revenue,
			DENSE_RANK() OVER(PARTITION BY c.country, c.state 
				ORDER BY ROUND(SUM(quantity * netprice * exchangerate)::numeric, 2) DESC) AS rank,
			DENSE_RANK() OVER(PARTITION BY c.country 
				ORDER BY ROUND(SUM(quantity * netprice * exchangerate)::numeric, 2) DESC) AS rank_country
	FROM sales s
	LEFT JOIN customer c ON s.customerkey = c.customerkey 
	GROUP BY s.customerkey, c.country, c.state
	)
	
	
	SELECT *
	FROM geographic_performance 
	WHERE RANK < 6

                                                                                                                                                                                                                                                                                  
