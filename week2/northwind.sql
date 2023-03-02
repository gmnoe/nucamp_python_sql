SELECT company_name FROM customers
WHERE company_name >= 'Q'
ORDER BY company_name DESC;

SELECT first_name, last_name FROM employees 
WHERE title = 'Sales Representative' 
ORDER BY last_name, first_name;

SELECT first_name, home_phone FROM employees 
WHERE first_name LIKE 'A%' AND home_phone LIKE '%4%' 
ORDER BY employee_id;

SELECT customer_id, MIN(order_date) FROM orders 
GROUP BY customer_id 
ORDER BY customer_id;

SELECT customer_id, AVG(freight_cost) AS avg_freight FROM orders
GROUP BY customer_id
ORDER BY avg_freight

SELECT o.order_id, COUNT(DISTINCT product_id) AS product_count 
FROM order_details o 
GROUP BY order_id HAVING(count(*)) >= 5 
ORDER BY product_count DESC;

SELECT product_name, category_name FROM products p 
JOIN categories c ON p.category_id = c.category_id;

SELECT o.order_id, s.company_name FROM orders o 
LEFT JOIN shippers s ON o.ship_via = s.shipper_id;

SELECT c.company_name, o.order_id, SUM(od.quantity) FROM orders o 
JOIN order_details od ON o.order_id = od.order_id 
JOIN customers c ON o.customer_id = c.customer_id 
GROUP BY o.order_id, c.company_name;