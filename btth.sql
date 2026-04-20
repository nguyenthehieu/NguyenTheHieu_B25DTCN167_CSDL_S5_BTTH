CREATE database shop;
USE shop;

CREATE TABLE orders(
	order_id INT PRIMARY KEY,
	total_amount INT,
	note TEXT,
    user_id INT,
    status varchar(10)
);

INSERT INTO orders (order_id, total_amount, note, user_id, status) 
VALUES
(1, 2500000, 'Giao gấp cho khách', 101, 'COMPLETED'),
(2, 3000000, 'Đơn hệ thống', NULL, 'PENDING'),
(3, 3500000, 'Giao gấp', 102, 'CANCELLED'),
(4, 6000000, 'Giao gấp VIP', 103, 'COMPLETED'),
(5, 2500000, 'Giao thường', 104, 'COMPLETED'),
(6, 4500000, 'Cần giao gấp trong ngày', 105, 'PENDING'),
(7, 4800000, 'Đơn auto', NULL, 'COMPLETED'),
(8, 1500000, 'Giao gấp', 106, 'COMPLETED'),
(9, 3000000, 'Đơn ảo', NULL, 'CANCELLED'),
(10, 2000000, 'Giao gấp nhẹ', 107, 'COMPLETED'),
(11, 5000000, 'Giao gấp', 108, 'COMPLETED'),
(12, 4000000, 'Ship nhanh', 109, 'COMPLETED'),
(13, 2200000, 'Giao gấp buổi sáng', 110, 'PENDING'),
(14, 2700000, 'Đơn thường', 111, 'COMPLETED'),
(15, 3200000, 'Giao gấp buổi tối', NULL, 'COMPLETED'),
(16, 5100000, 'Giao gấp', 112, 'COMPLETED'),
(17, 2900000, 'Giao nhanh', 113, 'COMPLETED'),
(18, 4100000, 'Cần giao gấp', 114, 'PENDING'),
(19, 4300000, 'Đơn auto', NULL, 'PENDING'),
(20, 2100000, 'Giao thường', 115, 'COMPLETED'),
(21, 3900000, 'Giao gấp', 116, 'CANCELLED'),
(22, 2600000, 'Giao gấp', 117, 'COMPLETED'),
(23, 4700000, 'Ship nhanh', NULL, 'COMPLETED'),
(24, 1800000, 'Giao gấp', 118, 'COMPLETED'),
(25, 3400000, 'Đơn thường', 119, 'PENDING'),
(26, 3600000, 'Giao gấp nội thành', 120, 'COMPLETED'),
(27, 4400000, 'Đơn hệ thống', NULL, 'COMPLETED'),
(28, 2800000, 'Giao nhanh', 121, 'COMPLETED'),
(29, 2300000, 'Giao gấp', 122, 'PENDING'),
(30, 4900000, 'Đơn auto', NULL, 'COMPLETED');

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
        note LIKE N'%gấp%'   
        OR user_id IS NULL
      )
ORDER BY total_amount DESC
LIMIT 20 OFFSET 40;

SELECT * FROM orders;