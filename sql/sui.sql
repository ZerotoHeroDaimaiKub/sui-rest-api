-- *************************************************************
-- This script only creates the CJStreetWear database
-- for SUI SQUAD
-- *************************************************************

-- create the database
DROP DATABASE IF EXISTS sui;
CREATE DATABASE sui;
-- select the database
USE sui;

-- create the tables
CREATE TABLE `Customer` (
  `CustomerID` int PRIMARY KEY,
  `Name` varchar(255),
  `Email` varchar(255) UNIQUE,
  `Password` varchar(255),
  `Address` text,
  `PhoneNumber` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `Product` (
  `ProductID` int PRIMARY KEY,
  `ProductName` varchar(255),
  `Description` text,
  `Price` decimal,
  `StockLevel` int,
  `ImageURL` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `Orders` (
  `OrderID` int PRIMARY KEY,
  `CustomerID` int,
  `OrderDate` datetime,
  `TotalAmount` decimal,
  `Status` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `OrderProduct` (
  `OrderID` int,
  `ProductID` int,
  `Quantity` int,
  `created_at` timestamp,
  PRIMARY KEY (`OrderID`, `ProductID`)
);

CREATE TABLE `Inventory` (
  `InventoryID` int PRIMARY KEY,
  `ProductID` int,
  `Quantity` int,
  `created_at` timestamp
);

CREATE TABLE `Employee` (
  `EmployeeID` int PRIMARY KEY,
  `Name` varchar(255),
  `Role` varchar(255),
  `Email` varchar(255),
  `PhoneNumber` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `Transaction` (
  `TransactionID` int PRIMARY KEY,
  `OrderID` int,
  `PaymentMethod` varchar(255),
  `PaymentDate` datetime,
  `Amount` decimal,
  `created_at` timestamp
);

CREATE TABLE `Shipping` (
  `ShippingID` int PRIMARY KEY,
  `OrderID` int,
  `ShippingFee` decimal,
  `DeliveryTime` varchar(255),
  `Address` text,
  `created_at` timestamp
);

ALTER TABLE `Orders` ADD FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`);

ALTER TABLE `OrderProduct` ADD FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`);

ALTER TABLE `OrderProduct` ADD FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`);

ALTER TABLE `Inventory` ADD FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`);

ALTER TABLE `Transaction` ADD FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`);

ALTER TABLE `Shipping` ADD FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`);

INSERT INTO Customer (CustomerID, Name, Email, Password, Address, PhoneNumber, created_at) VALUES
(1, 'John Doe', 'john.doe@example.com', 'password123', '123 Main St, Anytown, USA', '123-456-7890', NOW()),
(2, 'Jane Smith', 'jane.smith@example.com', 'password456', '456 Oak St, Othertown, USA', '987-654-3210', NOW()),
(3, 'Mike Johnson', 'mike.johnson@example.com', 'password789', '789 Maple Ave, Somewhere, USA', '555-555-5555', NOW()),
(4, 'Emily Davis', 'emily.davis@example.com', 'password101', '101 Pine St, Anycity, USA', '444-444-4444', NOW()),
(5, 'David Brown', 'david.brown@example.com', 'password102', '102 Elm St, Smalltown, USA', '333-333-3333', NOW()),
(6, 'Lisa White', 'lisa.white@example.com', 'password103', '333 Birch St, Villagetown, USA', '222-222-2222', NOW()),
(7, 'Peter Black', 'peter.black@example.com', 'password104', '444 Cedar Rd, Cityville, USA', '111-111-1111', NOW()),
(8, 'Susan Green', 'susan.green@example.com', 'password105', '555 Walnut St, Capital City, USA', '000-000-0000', NOW()),
(9, 'Chris Blue', 'chris.blue@example.com', 'password106', '666 Spruce Ave, Townsville, USA', '123-789-4560', NOW()),
(10, 'Anna Grey', 'anna.grey@example.com', 'password107', '777 Oak Blvd, Riverside, USA', '555-888-7777', NOW()),
(11, 'George Red', 'george.red@example.com', 'password108', '888 Poplar Ln, Suburbia, USA', '999-111-3333', NOW()),
(12, 'Samantha Orange', 'samantha.orange@example.com', 'password109', '999 Rose St, Anytown, USA', '444-777-8888', NOW()),
(13, 'Fred Pink', 'fred.pink@example.com', 'password110', '111 Cherry Ave, Othertown, USA', '222-555-3333', NOW()),
(14, 'Nina Brown', 'nina.brown@example.com', 'password111', '123 Elmwood Ct, Somewhere, USA', '555-333-1111', NOW()),
(15, 'Luke Gold', 'luke.gold@example.com', 'password112', '456 Ash Ln, Riverside, USA', '888-111-9999', NOW()),
(16, 'Mia Violet', 'mia.violet@example.com', 'password113', '789 Willow Dr, Villagetown, USA', '666-000-3333', NOW()),
(17, 'Jake Silver', 'jake.silver@example.com', 'password114', '101 Palm Dr, Cityville, USA', '111-222-4444', NOW()),
(18, 'Zara Aqua', 'zara.aqua@example.com', 'password115', '102 Bay St, Capital City, USA', '333-444-5555', NOW()),
(19, 'Paul Navy', 'paul.navy@example.com', 'password116', '103 Gulf Ave, Riverside, USA', '777-666-5555', NOW()),
(20, 'Rachel Coral', 'rachel.coral@example.com', 'password117', '104 Coral Rd, Anytown, USA', '888-999-0000', NOW());

INSERT INTO Product (ProductID, ProductName, Description, Price, StockLevel, ImageURL, created_at) VALUES
(1, 'White T-Shirt', 'Classic white t-shirt made from 100% cotton', 15.99, 100, 'http://example.com/white_tshirt.jpg', NOW()),
(2, 'Black Hoodie', 'Warm hoodie made from fleece', 29.99, 50, 'http://example.com/black_hoodie.jpg', NOW()),
(3, 'Denim Jacket', 'Classic blue denim jacket', 49.99, 30, 'http://example.com/denim_jacket.jpg', NOW()),
(4, 'Beanie', 'Warm winter beanie', 9.99, 200, 'http://example.com/beanie.jpg', NOW()),
(5, 'Sneakers', 'Comfortable running sneakers', 59.99, 40, 'http://example.com/sneakers.jpg', NOW()),
(6, 'Baseball Cap', 'Stylish cap with adjustable strap', 12.99, 120, 'http://example.com/cap.jpg', NOW()),
(7, 'Leather Belt', 'Durable leather belt', 19.99, 80, 'http://example.com/belt.jpg', NOW()),
(8, 'Graphic Tee', 'Cool graphic t-shirt', 21.99, 60, 'http://example.com/graphic_tee.jpg', NOW()),
(9, 'Sweatpants', 'Comfortable cotton sweatpants', 25.99, 70, 'http://example.com/sweatpants.jpg', NOW()),
(10, 'Ankle Socks', 'Pack of 3 pairs of ankle socks', 8.99, 150, 'http://example.com/socks.jpg', NOW()),
(11, 'Backpack', 'Durable backpack for school or travel', 39.99, 50, 'http://example.com/backpack.jpg', NOW()),
(12, 'Leather Jacket', 'Stylish leather jacket', 89.99, 25, 'http://example.com/leather_jacket.jpg', NOW()),
(13, 'Flannel Shirt', 'Warm flannel shirt', 29.99, 55, 'http://example.com/flannel.jpg', NOW()),
(14, 'Jogger Pants', 'Casual jogger pants', 27.99, 70, 'http://example.com/joggers.jpg', NOW()),
(15, 'Tank Top', 'Basic cotton tank top', 11.99, 100, 'http://example.com/tank_top.jpg', NOW()),
(16, 'Sunglasses', 'Polarized sunglasses', 24.99, 75, 'http://example.com/sunglasses.jpg', NOW()),
(17, 'Cardigan Sweater', 'Soft wool cardigan', 39.99, 40, 'http://example.com/cardigan.jpg', NOW()),
(18, 'Crewneck Sweatshirt', 'Comfy crewneck sweatshirt', 29.99, 80, 'http://example.com/crewneck.jpg', NOW()),
(19, 'Chino Pants', 'Slim fit chino pants', 34.99, 65, 'http://example.com/chinos.jpg', NOW()),
(20, 'Winter Scarf', 'Knitted wool scarf', 14.99, 100, 'http://example.com/scarf.jpg', NOW());

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount, Status, created_at) VALUES
(1, 1, '2024-09-01 10:00:00', 31.98, 'Shipped', NOW()),
(2, 2, '2024-09-02 11:30:00', 19.99, 'Delivered', NOW()),
(3, 3, '2024-09-03 14:20:00', 59.99, 'Processing', NOW()),
(4, 4, '2024-09-04 12:45:00', 39.99, 'Shipped', NOW()),
(5, 5, '2024-09-05 16:00:00', 89.97, 'Delivered', NOW()),
(6, 6, '2024-09-06 13:15:00', 27.99, 'Processing', NOW()),
(7, 7, '2024-09-07 09:40:00', 14.99, 'Delivered', NOW()),
(8, 8, '2024-09-08 18:05:00', 104.99, 'Shipped', NOW()),
(9, 9, '2024-09-09 08:30:00', 45.97, 'Processing', NOW()),
(10, 10, '2024-09-10 15:50:00', 9.99, 'Shipped', NOW()),
(11, 11, '2024-09-11 19:25:00', 24.99, 'Delivered', NOW()),
(12, 12, '2024-09-12 10:00:00', 29.99, 'Processing', NOW()),
(13, 13, '2024-09-13 14:00:00', 69.98, 'Delivered', NOW()),
(14, 14, '2024-09-14 17:45:00', 27.99, 'Shipped', NOW()),
(15, 15, '2024-09-15 20:15:00', 89.97, 'Processing', NOW()),
(16, 16, '2024-09-16 11:00:00', 44.97, 'Shipped', NOW()),
(17, 17, '2024-09-17 12:30:00', 14.99, 'Delivered', NOW()),
(18, 18, '2024-09-18 15:10:00', 59.99, 'Processing', NOW()),
(19, 19, '2024-09-19 10:50:00', 34.99, 'Shipped', NOW()),
(20, 20, '2024-09-20 18:00:00', 24.99, 'Delivered', NOW());

INSERT INTO OrderProduct (OrderID, ProductID, Quantity, created_at) VALUES
(1, 1, 2, NOW()),
(2, 2, 1, NOW()),
(3, 3, 1, NOW()),
(4, 4, 2, NOW()),
(5, 5, 1, NOW()),
(6, 6, 3, NOW()),
(7, 7, 2, NOW()),
(8, 8, 1, NOW()),
(9, 9, 3, NOW()),
(10, 10, 1, NOW()),
(11, 11, 2, NOW()),
(12, 12, 1, NOW()),
(13, 13, 2, NOW()),
(14, 14, 1, NOW()),
(15, 15, 3, NOW()),
(16, 16, 1, NOW()),
(17, 17, 2, NOW()),
(18, 18, 1, NOW()),
(19, 19, 3, NOW()),
(20, 20, 1, NOW());

INSERT INTO Inventory (InventoryID, ProductID, Quantity, created_at) VALUES
(1, 1, 100, NOW()),
(2, 2, 50, NOW()),
(3, 3, 30, NOW()),
(4, 4, 200, NOW()),
(5, 5, 40, NOW()),
(6, 6, 120, NOW()),
(7, 7, 80, NOW()),
(8, 8, 60, NOW()),
(9, 9, 70, NOW()),
(10, 10, 150, NOW()),
(11, 11, 50, NOW()),
(12, 12, 25, NOW()),
(13, 13, 55, NOW()),
(14, 14, 70, NOW()),
(15, 15, 100, NOW()),
(16, 16, 75, NOW()),
(17, 17, 40, NOW()),
(18, 18, 80, NOW()),
(19, 19, 65, NOW()),
(20, 20, 100, NOW());

INSERT INTO Employee (EmployeeID, Name, Role, Email, PhoneNumber, created_at) VALUES
(1, 'Alice Walker', 'Sales Representative', 'alice.walker@example.com', '123-456-7890', NOW()),
(2, 'Bob Turner', 'Inventory Manager', 'bob.turner@example.com', '987-654-3210', NOW()),
(3, 'Catherine Johnson', 'Customer Service', 'catherine.johnson@example.com', '555-555-5555', NOW()),
(4, 'Daniel Lee', 'Sales Associate', 'daniel.lee@example.com', '444-444-4444', NOW()),
(5, 'Evelyn King', 'Accountant', 'evelyn.king@example.com', '333-333-3333', NOW()),
(6, 'Frank Miller', 'Warehouse Staff', 'frank.miller@example.com', '222-222-2222', NOW()),
(7, 'Grace Kim', 'HR Manager', 'grace.kim@example.com', '111-111-1111', NOW()),
(8, 'Henry Scott', 'Sales Representative', 'henry.scott@example.com', '000-000-0000', NOW()),
(9, 'Ivy Garcia', 'Customer Service', 'ivy.garcia@example.com', '123-789-4560', NOW()),
(10, 'Jack Wilson', 'Marketing Specialist', 'jack.wilson@example.com', '555-888-7777', NOW()),
(11, 'Karen Adams', 'Inventory Manager', 'karen.adams@example.com', '999-111-3333', NOW()),
(12, 'Leo Brooks', 'Warehouse Staff', 'leo.brooks@example.com', '444-777-8888', NOW()),
(13, 'Maria Young', 'Sales Representative', 'maria.young@example.com', '222-555-3333', NOW()),
(14, 'Nathan Green', 'Marketing Specialist', 'nathan.green@example.com', '555-333-1111', NOW()),
(15, 'Olivia Bell', 'HR Assistant', 'olivia.bell@example.com', '888-111-9999', NOW()),
(16, 'Paul Reed', 'Sales Associate', 'paul.reed@example.com', '666-000-3333', NOW()),
(17, 'Quinn Rivera', 'Customer Service', 'quinn.rivera@example.com', '111-222-4444', NOW()),
(18, 'Rachel Fox', 'Accountant', 'rachel.fox@example.com', '333-444-5555', NOW()),
(19, 'Steve Hill', 'Warehouse Staff', 'steve.hill@example.com', '777-666-5555', NOW()),
(20, 'Tina Moore', 'Sales Representative', 'tina.moore@example.com', '888-999-0000', NOW());

INSERT INTO Transaction (TransactionID, OrderID, PaymentMethod, PaymentDate, Amount, created_at) VALUES
(1, 1, 'Credit Card', '2024-09-01 12:00:00', 31.98, NOW()),
(2, 2, 'PayPal', '2024-09-02 13:45:00', 19.99, NOW()),
(3, 3, 'Bank Transfer', '2024-09-03 15:30:00', 59.99, NOW()),
(4, 4, 'Credit Card', '2024-09-04 16:20:00', 39.99, NOW()),
(5, 5, 'PayPal', '2024-09-05 18:15:00', 89.97, NOW()),
(6, 6, 'Credit Card', '2024-09-06 14:00:00', 27.99, NOW()),
(7, 7, 'Credit Card', '2024-09-07 10:10:00', 14.99, NOW()),
(8, 8, 'Bank Transfer', '2024-09-08 19:00:00', 104.99, NOW()),
(9, 9, 'PayPal', '2024-09-09 09:25:00', 45.97, NOW()),
(10, 10, 'Credit Card', '2024-09-10 16:45:00', 9.99, NOW()),
(11, 11, 'Credit Card', '2024-09-11 20:30:00', 24.99, NOW()),
(12, 12, 'Bank Transfer', '2024-09-12 11:45:00', 29.99, NOW()),
(13, 13, 'Credit Card', '2024-09-13 15:15:00', 69.98, NOW()),
(14, 14, 'PayPal', '2024-09-14 18:50:00', 27.99, NOW()),
(15, 15, 'Credit Card', '2024-09-15 21:00:00', 89.97, NOW()),
(16, 16, 'Bank Transfer', '2024-09-16 12:30:00', 44.97, NOW()),
(17, 17, 'Credit Card', '2024-09-17 14:45:00', 14.99, NOW()),
(18, 18, 'PayPal', '2024-09-18 16:00:00', 59.99, NOW()),
(19, 19, 'Credit Card', '2024-09-19 11:20:00', 34.99, NOW()),
(20, 20, 'Bank Transfer', '2024-09-20 19:45:00', 24.99, NOW());

INSERT INTO Shipping (ShippingID, OrderID, ShippingFee, DeliveryTime, Address, created_at) VALUES
(1, 1, 4.99, '3-5 business days', '123 Main St, Anytown, USA', NOW()),
(2, 2, 5.99, '2-3 business days', '456 Oak St, Othertown, USA', NOW()),
(3, 3, 0.00, 'Free Shipping', '789 Maple Ave, Somewhere, USA', NOW()),
(4, 4, 7.99, '1-2 business days', '101 Pine St, Anycity, USA', NOW()),
(5, 5, 4.99, '3-5 business days', '102 Elm St, Smalltown, USA', NOW()),
(6, 6, 5.99, '2-3 business days', '333 Birch St, Villagetown, USA', NOW()),
(7, 7, 4.99, '3-5 business days', '444 Cedar Rd, Cityville, USA', NOW()),
(8, 8, 0.00, 'Free Shipping', '555 Walnut St, Capital City, USA', NOW()),
(9, 9, 4.99, '3-5 business days', '666 Spruce Ave, Townsville, USA', NOW()),
(10, 10, 7.99, '1-2 business days', '777 Oak Blvd, Riverside, USA', NOW()),
(11, 11, 4.99, '3-5 business days', '888 Poplar Ln, Suburbia, USA', NOW()),
(12, 12, 5.99, '2-3 business days', '999 Rose St, Anytown, USA', NOW()),
(13, 13, 4.99, '3-5 business days', '111 Cherry Ave, Othertown, USA', NOW()),
(14, 14, 5.99, '2-3 business days', '123 Elmwood Ct, Somewhere, USA', NOW()),
(15, 15, 7.99, '1-2 business days', '456 Ash Ln, Riverside, USA', NOW()),
(16, 16, 4.99, '3-5 business days', '789 Willow Dr, Villagetown, USA', NOW()),
(17, 17, 5.99, '2-3 business days', '101 Palm Dr, Cityville, USA', NOW()),
(18, 18, 0.00, 'Free Shipping', '102 Bay St, Capital City, USA', NOW()),
(19, 19, 4.99, '3-5 business days', '103 Gulf Ave, Riverside, USA', NOW()),
(20, 20, 7.99, '1-2 business days', '104 Coral Rd, Anytown, USA', NOW());


