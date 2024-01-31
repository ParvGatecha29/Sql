SELECT r.rental_date, r.return_date, AGE(r.return_date,r.rental_date) AS "Rent Duration", c.first_name, c.last_name, c.email
FROM rental r
JOIN customer c ON c.customer_id = r.customer_id
ORDER BY "Rent Duration" DESC;

SELECT r.rental_date, r.return_date, AGE(r.return_date,r.rental_date) AS "Rent Duration", c.first_name, c.last_name, c.email
FROM rental r
JOIN customer c ON c.customer_id = r.customer_id
WHERE r.return_date IS NOT NULL
ORDER BY "Rent Duration" DESC;

SELECT r.rental_date, r.return_date, AGE(r.return_date,r.rental_date) AS "Rent Duration", c.first_name, c.last_name, c.email
FROM rental r
JOIN customer c ON c.customer_id = r.customer_id
WHERE r.return_date IS NOT NULL AND AGE(r.return_date,r.rental_date) >= interval '7 days'
ORDER BY "Rent Duration" DESC;

SELECT substring(title,5)
FROM film

SELECT substring(title,10)
FROM film

SELECT LENGTH(title),substring(title,10), SUBSTRING(title,15)
FROM film

SELECT LENGTH(title),substring(title,11), SUBSTRING(title,16)
FROM film

SELECT LENGTH(title),substring(title,11), SUBSTRING(title,16), SUBSTRING(title,6,3)
FROM film

SELECT title,LENGTH(title),substring(title,11), SUBSTRING(title,16), SUBSTRING(title,6,3)
FROM film

SELECT title,LENGTH(title),substring(title,11), SUBSTRING(title,16), SUBSTRING(title,6,3),SUBSTRING(title,6,1)
FROM film


SELECT 
	CONCAT(c.first_name, ' ', c.last_name) AS "Customer Name", 
	c.email AS Email,
	SUM(p.amount) AS "Total Rentals",
	CASE
		WHEN SUM(p.amount) >= 200 THEN 'Elite'
		WHEN SUM(p.amount) >= 150 AND SUM(p.amount) < 200 THEN 'Platinum'
		WHEN SUM(p.amount) >= 100 AND SUM(p.amount) < 150 THEN 'Gold'
		WHEN SUM(p.amount) >= 0 AND SUM(p.amount) < 100 THEN 'Silver'
	END
FROM payment p
JOIN customer c ON c.customer_id = p.customer_id
GROUP BY c.first_name, c.last_name, c.email

SELECT 
	CONCAT(c.first_name, ' ', c.last_name) AS "Customer Name", 
	c.email AS Email,
	SUM(p.amount) AS "Total Rentals",
	CASE
		WHEN SUM(p.amount) >= 200 THEN 'Elite'
		WHEN SUM(p.amount) >= 150 AND SUM(p.amount) < 200 THEN 'Platinum'
		WHEN SUM(p.amount) >= 100 AND SUM(p.amount) < 150 THEN 'Gold'
		WHEN SUM(p.amount) >= 0 AND SUM(p.amount) < 100 THEN 'Silver'
	END AS "Customer Category"
FROM payment p
JOIN customer c ON c.customer_id = p.customer_id
GROUP BY c.first_name, c.last_name, c.email
ORDER BY "Total Rentals" DESC;


CREATE VIEW customer_segments AS 
	SELECT 
	CONCAT(c.first_name, ' ', c.last_name) AS "Customer Name", 
	c.email AS Email,
	SUM(p.amount) AS "Total Rentals",
	CASE
		WHEN SUM(p.amount) >= 200 THEN 'Elite'
		WHEN SUM(p.amount) >= 150 AND SUM(p.amount) < 200 THEN 'Platinum'
		WHEN SUM(p.amount) >= 100 AND SUM(p.amount) < 150 THEN 'Gold'
		WHEN SUM(p.amount) >= 0 AND SUM(p.amount) < 100 THEN 'Silver'
	END AS "Customer Category"
	FROM payment p
	JOIN customer c ON c.customer_id = p.customer_id
	GROUP BY c.first_name, c.last_name, c.email
	ORDER BY "Total Rentals" DESC;