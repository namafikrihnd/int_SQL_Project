WITH baskets AS (
	SELECT
		s.orderkey,
		s.customerkey,
		s.productkey,
		p.productname 
	FROM sales s LEFT JOIN
	product p ON s.productkey= p.productkey
)
SELECT DISTINCT
	COUNT(DISTINCT b1.orderkey) AS product_group,
	b1.productname AS product_1,
	b2.productname AS product_2
FROM baskets b1
JOIN baskets b2 ON b1.orderkey = b2.orderkey
WHERE b1.productname < b2.productname
GROUP BY b1.productname, b2.productname
ORDER BY product_group DESC;



WITH baskets AS (
	SELECT
		s.orderkey,
		s.customerkey,
		s.productkey,
		p.productname 
	FROM sales s LEFT JOIN
	product p ON s.productkey= p.productkey
)
SELECT 
	b1.orderkey,
	b1.productname AS product_1,
	b2.productname AS product_2
FROM baskets b1
JOIN baskets b2 ON b1.orderkey = b2.orderkey
WHERE b1.productname < b2.productname;





WITH baskets AS (
    SELECT
        s.orderkey,
        s.customerkey,
        s.productkey,
        p.productname 
    FROM sales s 
    LEFT JOIN product p ON s.productkey = p.productkey
)
SELECT 
    COUNT(DISTINCT b1.orderkey) AS product_group,
    b1.productname AS product_1,
    b2.productname AS product_2
FROM baskets b1
JOIN baskets b2 ON b1.orderkey = b2.orderkey
WHERE b1.productname < b2.productname
GROUP BY b1.productname, b2.productname
ORDER BY product_group DESC;

