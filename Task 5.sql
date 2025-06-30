create database Customer;
use Customer;

-- Step 1: Create the Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    City VARCHAR(100)
);

-- Step 2: Create the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Product VARCHAR(100),
    Amount INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Step 3: Insert sample data into Customers
INSERT INTO Customers (CustomerID, Name, City) VALUES
(1, 'Alice', 'Delhi'),
(2, 'Bob', 'Mumbai'),
(3, 'Charlie', 'Kolkata'),
(4, 'David', 'Bangalore');

-- Step 4: Insert sample data into Orders
INSERT INTO Orders (OrderID, CustomerID, Product, Amount) VALUES
(101, 1, 'Laptop', 70000),
(102, 2, 'Phone', 20000),
(103, 1, 'Mouse', 1000),
(104, 3, 'Monitor', 12000),
(105, NULL, 'Tablet', 15000);  -- Order without a customer (for testing joins)

-- Step 5: INNER JOIN
SELECT 
    Customers.Name,
    Orders.Product,
    Orders.Amount
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- Step 6: LEFT JOIN
SELECT 
    Customers.Name,
    Orders.Product,
    Orders.Amount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- Step 7: RIGHT JOIN (Only works in MySQL, NOT in SQLite)
-- If using MySQL:
-- SELECT 
--     Customers.Name,
--     Orders.Product,
--     Orders.Amount
-- FROM Customers
-- RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- Alternative RIGHT JOIN simulation for SQLite:
SELECT 
    Customers.Name,
    Orders.Product,
    Orders.Amount
FROM Orders
LEFT JOIN Customers ON Customers.CustomerID = Orders.CustomerID;

-- Step 8: FULL OUTER JOIN (Works in MySQL, NOT in SQLite)
-- If using MySQL:
-- SELECT 
--     Customers.Name,
--     Orders.Product,
--     Orders.Amount
-- FROM Customers
-- FULL OUTER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- FULL OUTER JOIN simulation for SQLite using UNION
SELECT 
    Customers.Name,
    Orders.Product,
    Orders.Amount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID

UNION

SELECT 
    Customers.Name,
    Orders.Product,
    Orders.Amount
FROM Orders
LEFT JOIN Customers ON Customers.CustomerID = Orders.CustomerID;
