CREATE DATABASE transactionsDB;

USE transactionsDB;

-- create a noralized table where each product is in a separate row
CREATE TABLE ProductDetail_1NF (
OrderID INT,            -- Unique identifier
CustomerName VARCHAR(100),   -- Name of the customer who placed an order
Product VARCHAR(100)        -- A single product from the order
);

-- Insert normalized data with one product per row
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product )
VALUES
(101, 'John Doe', 'Laptop'),     -- first product for order 101
(101, 'John Doe', 'Mouse'),      -- second product for order 101 
(102, 'Jane Smith', 'Tablet'),   -- first product for order 102
(102, 'Jane Smith', 'Keyboard'),  -- second product for order 102
(102, 'Jane Smith', 'Mouse'),      -- third product for order 102
(103, 'Emily Clark', 'Phone');     -- single product for order 10

-- Question 2
-- create a separate table for orders to remove partial dependency
-- CustomerName depends only on OrderId, so we store it separately
CREATE TABLE Orders(
OrderID INT PRIMARY KEY,          -- Primary key: uniquely identifies each other
CustomerName VARCHAR(100)         -- Customer name depends on  orderid
);

-- insert unique orders with associated customer names
INSERT INTO Orders(OrderID, CustomerName)
VALUES 
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- create a new table to store order items
-- each product belongs to an order with a specific quantity
CREATE TABLE OrderItems (
OrderID INT,                    -- Foreign key from orders table
Product VARCHAR(100),           -- product in the order
Quantity INT,                   -- quantity  of the product ordered
PRIMARY KEY (OrderID, Product),   -- composite primary key ensures  uniqueness
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) -- enforces referential integrity
);

-- insert itemized product data with quantities for each order
INSERT INTO OrderItems(OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);
CREATE DATABASE transactionsDB
