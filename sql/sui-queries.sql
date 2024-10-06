-- SQL Queries for CJStreetwear Database

-- Select Queries
-- Select All Customers
SELECT * FROM Customer;

-- Select Specific Product by Name
SELECT * FROM Product WHERE ProductName = 'Black Hoodie';

-- Select All Orders for a Specific Customer
SELECT * FROM Orders WHERE CustomerID = 1;

-- Select All Products with Stock Below a Certain Level
SELECT * FROM Product WHERE StockLevel < 50;

-- Select Total Sales Amount for Each Order
SELECT OrderID, TotalAmount FROM Orders;

-- Update Queries
-- Update Stock Level for a Product
UPDATE Product SET StockLevel = StockLevel - 1 WHERE ProductID = 1;

-- Update Customer's Address
UPDATE Customer SET Address = '456 New St, Anytown, USA' WHERE CustomerID = 2;

-- Mark an Order as Delivered
UPDATE Orders SET Status = 'Delivered' WHERE OrderID = 3;

-- Update Product Price
UPDATE Product SET Price = Price * 1.10 WHERE ProductID = 4;

-- Update Employee Role
UPDATE Employee SET Role = 'Manager' WHERE EmployeeID = 5;

-- Delete Queries
-- Delete a Customer
DELETE FROM Customer WHERE CustomerID = 20;

-- Delete an Order
DELETE FROM Orders WHERE OrderID = 15;

-- Delete Products that Are Out of Stock
DELETE FROM Product WHERE StockLevel = 0;

-- Delete a Shipping Record
DELETE FROM Shipping WHERE ShippingID = 10;

-- Delete an Employee
DELETE FROM Employee WHERE EmployeeID = 8;

-- More Advanced Queries
-- Join Query to Get Order Details with Customer Names
SELECT Orders.OrderID, Orders.OrderDate, Orders.TotalAmount, Customer.Name 
FROM Orders 
JOIN Customer ON Orders.CustomerID = Customer.CustomerID;

-- Get Total Revenue from All Transactions
SELECT SUM(Amount) AS TotalRevenue FROM Transaction;

-- Select Products Sold in a Specific Order
SELECT Product.ProductName, OrderProduct.Quantity 
FROM OrderProduct
JOIN Product ON OrderProduct.ProductID = Product.ProductID
WHERE OrderProduct.OrderID = 1;

-- Select Inventory for All Products
SELECT Product.ProductName, Inventory.Quantity 
FROM Inventory
JOIN Product ON Inventory.ProductID = Product.ProductID;

-- Select All Orders with Their Shipping Information
SELECT Orders.OrderID, Orders.OrderDate, Shipping.ShippingFee, Shipping.DeliveryTime
FROM Orders
JOIN Shipping ON Orders.OrderID = Shipping.OrderID;