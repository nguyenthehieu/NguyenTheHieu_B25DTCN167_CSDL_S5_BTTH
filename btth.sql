CREATE database shop;
USE shop;

CREATE TABLE orders(
	order_id INT PRIMARY KEY,
	total_amount INT,
	note TEXT,
    user_id INT,
    status varchar(10)
);

SELECT 
    order_id,
    total_amount,
    note,
    user_id,
    status,
    CASE 
        WHEN total_amount > 4000000 THEN 'Nguy hiểm'
        ELSE 'Bình thường'
    END AS Alert_Level
FROM orders
WHERE total_amount BETWEEN 2000000 AND 5000000
  AND status <> 'CANCELLED'
  AND (
        note LIKE N'%gấp%'   -- hỗ trợ unicode
        OR user_id IS NULL
      )
ORDER BY total_amount DESC
LIMIT 20 OFFSET 40;