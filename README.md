# SQL-Joins-Inner-Left-Right-Full-

🎯 OBJECTIVE:
To understand and explain how different types of SQL joins work, their use cases, and the expected results when joining related tables.

🧾 TABLE OVERVIEW (Sample Data)
📌 CUSTOMERS Table
customer_id	name	city
1	Alice	Delhi
2	Bob	Mumbai
3	Charlie	Kolkata
4	Diana	Chennai

📌 ORDERS Table
order_id	customer_id	order_date	amount
101	1	2025-06-01	1500.00
102	2	2025-06-05	2200.00
103	1	2025-06-10	900.00

🔄 TYPES OF JOINS WITH EXPECTED OUTPUTS
🔹 INNER JOIN
▶️ Use Case: Show only customers who have placed orders.

💡 SQL:

sql
Copy code
SELECT c.name, o.order_id, o.amount
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id;
✅ Expected Output:

name	order_id	amount
Alice	101	1500
Bob	102	2200
Alice	103	900

🔹 LEFT JOIN
▶️ Use Case: Show all customers, whether they have placed an order or not.

💡 SQL:

sql
Copy code
SELECT c.name, o.order_id, o.amount
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;
✅ Expected Output:

name	order_id	amount
Alice	101	1500
Alice	103	900
Bob	102	2200
Charlie	NULL	NULL
Diana	NULL	NULL

🔹 RIGHT JOIN (MySQL Only)
▶️ Use Case: Show all orders, with customer info if available.

💡 SQL:

sql
Copy code
SELECT c.name, o.order_id, o.amount
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;
✅ Expected Output:

name	order_id	amount
Alice	101	1500
Bob	102	2200
Alice	103	900

💡 Note: In this dataset, every order has a matching customer, so the output is identical to INNER JOIN.

🔹 FULL OUTER JOIN (Simulated with UNION)
▶️ Use Case: Show all customers and all orders — even unmatched ones.

💡 SQL (MySQL / SQLite Compatible):

sql
Copy code
-- FULL OUTER JOIN simulation using UNION
SELECT c.customer_id, c.name, o.order_id, o.amount
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id

UNION

SELECT c.customer_id, c.name, o.order_id, o.amount
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;
✅ Expected Output:

customer_id	name	order_id	amount
1	Alice	101	1500
1	Alice	103	900
2	Bob	102	2200
3	Charlie	NULL	NULL
4	Diana	NULL	NULL

✅ QUICK SUMMARY
Join Type	Customers Without Orders	Orders Without Customers	Result Includes
INNER JOIN	❌	❌	Matches only
LEFT JOIN	✅	❌	All customers
RIGHT JOIN	❌	✅	All orders
FULL OUTER JOIN	✅	✅	All records

