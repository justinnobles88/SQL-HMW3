--1. List all customers who live in Texas (use JOINs)

select customer.first_name, customer.last_name
from customer 
full join address
on customer.address_id = address.address_id 
where district = 'Texas'


--2. Get all payments above $6.99 with the Customer's Full Name

select customer.first_name, customer.last_name, payment.amount 
from customer 
full join payment on customer.customer_id = payment.customer_id 
where amount > 6.99



--3. Show all customers names who have made payments over $175(use subqueries)

SELECT customer.first_name, customer.last_name
FROM customer
FULL JOIN payment
ON customer.customer_id = payment.customer_id
WHERE payment.amount IN(
	SELECT payment.amount
	FROM payment
	GROUP BY payment.amount 
)
GROUP BY customer.first_name, customer.last_name
HAVING SUM(amount) > 175;



--4. List all customers that live in Nepal (use the city table)

SELECT first_name, last_name
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country.country = 'Nepal';

--5. Which staff member had the most transactions?

SELECT first_name, last_name, COUNT(staff.staff_id)
FROM staff
INNER JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id 
ORDER BY COUNT DESC;

--6. How many movies of each rating are there?

SELECT rating, COUNT(film_id)
FROM film
GROUP BY rating
ORDER BY COUNT DESC;

--7. Show all customers who have made a single payment above $6.99 (Use Subqueries)

SELECT customer.customer_id
FROM customer
FULL JOIN payment
ON customer.customer_id = payment.customer_id
WHERE payment.amount IN(
	SELECT payment.amount
	FROM payment
	WHERE amount > 6.99
	GROUP BY payment.amount
)
GROUP BY customer.customer_id
HAVING COUNT(amount) = 1;

-- 8. How many free rentals did our stores give away?

SELECT COUNT(amount)
FROM payment
WHERE amount = 0.00;
