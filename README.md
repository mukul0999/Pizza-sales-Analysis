🍕 Pizza Sales Analysis --- SQL & MySQL

An end-to-end SQL analysis of pizza sales data to uncover sales
trends, customer preferences, top-performing products, and revenue
opportunities.


📌 Project Overview

The objective of this project is to analyze pizza sales data using
MySQL and answer business-focused questions around:

📦 Order volume and revenue

🍕 Best-selling pizza types

📊 Category and size-wise demand

⏰ Hourly ordering patterns

💰 Revenue contribution

📈 Cumulative revenue trends

The analysis uses SQL queries ranging from basic aggregations to
advanced window functions and ranking.

🗂️ Database Schema

The database contains four main tables:

Table              Key Information

orders           Order ID, order date, order time
orders_details   Order detail ID, order ID, quantity, pizza ID
pizza_types      Pizza type ID, category, ingredients, pizza name
pizzas           Pizza ID, pizza type ID, price, size

🔎 Analysis Performed

Basic Analysis

Total number of orders

Total revenue

Highest-priced pizza

Most common pizza size

Top 5 pizzas by quantity

Intermediate Analysis

Quantity sold by pizza category

Order distribution by hour

Category-wise pizza distribution

Average pizzas ordered per day

Top 3 pizzas by revenue

Advanced Analysis

Revenue contribution by category

Cumulative revenue over time

Top 3 revenue-generating pizzas within each category

The project questions are organized into Basic, Intermediate, and
Advanced levels in the accompanying analysis material.

📊 Key Insights

Metric                                             Result

Total orders                                   21,350
Total revenue                             ₹817,860.05
Highest-priced pizza       The Greek Pizza --- ₹35.95
Most common size                 Large (L) --- 18,526
Average pizzas per day                            138

🏆 Top 5 Pizzas by Quantity

The Classic Deluxe Pizza --- 2,453

The Barbecue Chicken Pizza --- 2,432

The Hawaiian Pizza --- 2,422

The Pepperoni Pizza --- 2,418

The Thai Chicken Pizza --- 2,371

💰 Top 3 Pizzas by Revenue

The Thai Chicken Pizza --- ₹43,434.25

The Barbecue Chicken Pizza --- ₹42,768.00

The California Chicken Pizza --- ₹41,409.50

🍕 Category Insights

The Classic category recorded the highest quantity and revenue
contribution:

Classic --- 14,888 pizzas | 26.91% revenue

Supreme --- 11,987 pizzas | 25.45% revenue

Veggie --- 11,649 pizzas | 23.68% revenue

Chicken --- 11,050 pizzas | 23.96% revenue

Orders show stronger activity around the midday and evening hours,
with the highest hourly order count occurring at 12:00 in the
analyzed results.

💡 Business Recommendations

Promote top-selling pizzas during high-demand periods.

Maintain sufficient inventory for large-sized pizzas.

Use evening offers to capitalize on higher evening demand.

Highlight Classic category pizzas in marketing campaigns due to
their strong revenue contribution.

🛠️ SQL Skills Demonstrated

JOINs
GROUP BY
Aggregate Functions
CTEs / Subqueries
Window Functions
RANK()
Date & Time Functions
Revenue Analysis
Percentage Calculations
Cumulative Revenue
Data Aggregation
Business Insight Generation

📁 Repository Structure

Pizza-Sales-Analysis/
│
├── README.md
├── quaries.sql
├── PizzaSales.pptx
└── questions-on-pizzaSales.docx

🚀 How to Use

Create the pizza sales database in MySQL.

Import the four source tables.

Open quaries.sql in MySQL Workbench.

Run the queries section by section.

Review the presentation for the resulting insights and
recommendations.

🎯 Project Outcome

This project demonstrates how SQL can transform raw transactional
sales data into actionable business insights---from identifying
best-selling products and peak ordering periods to understanding revenue
contribution and category performance.
