-- Retrieve the total number of orders placed. 
SELECT 
    COUNT(order_id) AS total_order_placed
FROM
    orders;
    
-- Calculate the total revenue generated from pizza sales.

SELECT 
    ROUND(SUM(od.quantity * p.price), 2) AS REVENUE
FROM
    orders_details AS od
        JOIN
    pizzas AS p ON od.pizza_id = p.pizza_id

-- Identify the highest-priced pizza.
SELECT 
    pizza_types.name, pizzas.price
FROM
    pizzas
        JOIN
    pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1;


-- Identify the most common pizza size ordered.

SELECT 
    p.size, COUNT(quantity) AS total_quantity
FROM
    orders_details AS od
        JOIN
    pizzas AS p ON od.pizza_id = p.pizza_id
GROUP BY p.size
ORDER BY total_quantity DESC
LIMIT 1;


-- List the top 5 most ordered pizza types along with their quantities.
SELECT 
    pt.name, SUM(od.quantity) AS total_quantity
FROM
    pizzas AS p
        JOIN
    pizza_types AS pt ON p.pizza_type_id = pt.pizza_type_id
        JOIN
    orders_details AS od ON p.pizza_id = od.pizza_id
GROUP BY pt.name
ORDER BY total_quantity DESC
LIMIT 5;

-- Join the necessary tables to find the total quantity of each pizza category ordered.
SELECT 
    pizza_types.category, SUM(orders_details.quantity) AS quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON pizzas.pizza_id = orders_details.pizza_id
GROUP BY pizza_types.category
ORDER BY quantity DESC;

-- Determine the distribution of orders by hour of the day.
SELECT 
    HOUR(order_time) AS hour, COUNT(order_id) AS order_per_hour
FROM
    orders
GROUP BY hour
Order by hour;

-- 3.	Join relevant tables to find the category-wise distribution of pizzas.
SELECT 
    category, COUNT(name)
FROM
    pizza_types
GROUP BY category;

-- 4.	Group the orders by date and calculate the average number of pizzas ordered per day.
SELECT 
    ROUND(AVG(quantity), 0) AS avg_order_perday
FROM
    (SELECT 
        DATE(order_date) AS din,
            SUM(orders_details.quantity) AS quantity
    FROM
        orders
    JOIN orders_details ON orders.order_id = orders_details.order_id
    GROUP BY din) AS data;
    
-- 5.	Determine the top 3 most ordered pizza types based on revenue.
SELECT 
    pt.name, SUM(p.price * od.quantity) AS revenue
FROM
    pizzas AS p
        JOIN
    orders_details AS od ON p.pizza_id = od.pizza_id
        JOIN
    pizza_types AS pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY revenue DESC
LIMIT 3;

-- 1.	Calculate the percentage contribution of each pizza type to total revenue.
SELECT 
    pt.category,
    CONCAT(ROUND(SUM(p.price * od.quantity) / (SELECT 
                            ROUND(SUM(od.quantity * p.price), 2) AS REVENUE
                        FROM
                            orders_details AS od
                                JOIN
                            pizzas AS p ON od.pizza_id = p.pizza_id) * 100,
                    2),
            '%') AS revenue_percentage
FROM
    pizzas AS p
        JOIN
    orders_details AS od ON p.pizza_id = od.pizza_id
        JOIN
    pizza_types AS pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category
ORDER BY revenue_percentage DESC

-- 2.	Analyze the cumulative revenue generated over time
SELECT order_date, SUM(revenue) OVER(ORDER BY order_date) AS cum_revenue
FROM
(SELECT orders.order_date,
SUM(orders_details.quantity*pizzas.price) AS revenue
FROM orders_details JOIN pizzas
ON orders_details.pizza_id=pizzas.pizza_id
JOIN orders
ON orders.order_id = orders_details.order_id
GROUP BY orders.order_date) as SALES;

-- 3.	Determine the top 3 most ordered pizza types based on revenue for each pizza category.
SELECT category , name, revenue
FROM 
(SELECT category, name, revenue,
RANK() OVER ( partition by category ORDER BY revenue DESC) AS rn
FROM
(SELECT pt.category,pt.name, ROUND(SUM(p.price * od.quantity),2) AS revenue
FROM pizzas AS p
JOIN orders_details AS od
ON p.pizza_id=od.pizza_id
JOIN pizza_types AS pt
ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category,pt.name) as a) AS b
WHERE rn<=3;


