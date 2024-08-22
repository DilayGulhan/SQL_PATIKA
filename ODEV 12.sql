--1
SELECT length FROM film 
WHERE length > ALL  (
SELECT AVG(length ) FROM film
);

--2 
SELECT COUNT(*) FROM film WHERE 
rental_rate = ANY (
SELECT MAX(rental_rate)  FROM film
);

--3

SELECT * FROM film WHERE
rental_rate= ANY(
	SELECT MIN(rental_rate) FROM film
)
UNION
SELECT * FROM film WHERE
replacement_cost= ANY(
	SELECT MIN(replacement_cost) FROM film
);

--4

SELECT customer.first_name, customer.last_name 
FROM payment
LEFT JOIN customer 
ON customer.customer_id = payment.customer_id
WHERE amount = ALL(
SELECT MIN(amount) FROM payment
);
