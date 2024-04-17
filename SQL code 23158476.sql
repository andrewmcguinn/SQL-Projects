DROP DATABASE IF EXISTS sales;

CREATE DATABASE IF NOT EXISTS sales;

USE sales; 

-- Table: Customers
CREATE TABLE Customers (
    CustomerID INTEGER NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Phone VARCHAR(20),
    Address VARCHAR(255) NOT NULL,
    City VARCHAR(100),
    State VARCHAR(50),
    ZipCode VARCHAR(20),
	PRIMARY KEY (CustomerID)
);

-- Table: Suppliers
CREATE TABLE Suppliers (
    SupplierID  INT NOT NULL,
    SupplierName VARCHAR(100),
    ContactName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(50),
    ZipCode VARCHAR(20),
    PRIMARY KEY (SupplierID)
);

-- Table: Products
CREATE TABLE Products (
    ProductID INT NOT NULL AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    Description VARCHAR(300) NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL DEFAULT 0,
    UnitsInStock INT DEFAULT 0,
    ReorderLevel INT DEFAULT 0,
    SupplierID INT,
    PRIMARY KEY (ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);


-- Table: Stock
CREATE TABLE Stock (
    StockID INTEGER NOT NULL AUTO_INCREMENT,
    ProductID INT NOT NULL,
    Quantity INT,
    PRIMARY KEY (StockID),
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);


-- Table: Orders
CREATE TABLE Orders (
    OrderID  INTEGER NOT NULL AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
	ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    PRIMARY KEY (OrderID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


-- Table: Shipments
CREATE TABLE Shipments (
    ShipmentID  INTEGER NOT NULL AUTO_INCREMENT,
    OrderID INT,
    ShipmentDate DATE,
    Carrier VARCHAR(100),
    TrackingNumber VARCHAR(100),
    PRIMARY KEY (ShipmentID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Table: Payments
CREATE TABLE Payments (
    PaymentID INTEGER NOT NULL AUTO_INCREMENT,
    OrderID INT,
    PaymentDate DATE,
    Amount DECIMAL(10, 2),
    PaymentMethod VARCHAR(50),
    PRIMARY KEY (PaymentID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Table: Returns
CREATE TABLE Returns (
    ReturnID  INTEGER NOT NULL AUTO_INCREMENT,
    OrderID INT,
    ReturnDate DATE,
    Reason TEXT,
    PRIMARY KEY (ReturnID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Table: Employees
CREATE TABLE Employees (
    EmployeeID  INTEGER NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(50),
    ZipCode VARCHAR(20),
    HireDate DATE,
    PRIMARY KEY (EmployeeID)
);

-- Table: Departments
CREATE TABLE Departments (
    DepartmentID  INTEGER NOT NULL AUTO_INCREMENT,
    DepartmentName VARCHAR(100),
    ManagerID INT,
    PRIMARY KEY (DepartmentID),
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)
);

USE sales; 

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address, City, State, ZipCode) 
VALUES 
    (1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Main St', 'Anytown', 'CA', '12345'),
    (2, 'Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', '456 Maple Ave', 'Somewhere', 'NY', '54321'),
    (3, 'Alice', 'Johnson', 'alice.johnson@example.com', '555-555-5555', '789 Elm St', 'Nowhere', 'TX', '67890'),
    (4, 'Bob', 'Williams', 'bob.williams@example.com', '111-222-3333', '456 Oak St', 'Anywhere', 'FL', '54321'),
    (5, 'Emily', 'Brown', 'emily.brown@example.com', '444-555-6666', '789 Pine St', 'Elsewhere', 'WA', '98765'),
    (6, 'Michael', 'Jones', 'michael.jones@example.com', '777-888-9999', '1010 Cedar St', 'Everywhere', 'CA', '23456'),
    (7, 'Sarah', 'Davis', 'sarah.davis@example.com', '222-333-4444', '1313 Elm St', 'Nowhere', 'TX', '34567'),
    (8, 'David', 'Martinez', 'david.martinez@example.com', '888-999-0000', '1414 Oak St', 'Anywhere', 'FL', '45678'),
    (9, 'Jennifer', 'Rodriguez', 'jennifer.rodriguez@example.com', '333-444-5555', '1515 Pine St', 'Elsewhere', 'WA', '56789'),
    (10, 'Christopher', 'Garcia', 'christopher.garcia@example.com', '999-000-1111', '1616 Cedar St', 'Everywhere', 'CA', '67890'),
    (11, 'Mary', 'Hernandez', 'mary.hernandez@example.com', '444-555-6666', '1717 Elm St', 'Nowhere', 'TX', '78901'),
    (12, 'Matthew', 'Lopez', 'matthew.lopez@example.com', '111-222-3333', '1818 Oak St', 'Anywhere', 'FL', '89012'),
    (13, 'Patricia', 'Gonzalez', 'patricia.gonzalez@example.com', '555-666-7777', '1919 Pine St', 'Elsewhere', 'WA', '90123'),
    (14, 'Linda', 'Wilson', 'linda.wilson@example.com', '222-333-4444', '2020 Cedar St', 'Everywhere', 'CA', '01234'),
    (15, 'Andrew', 'Anderson', 'andrew.anderson@example.com', '777-888-9999', '2121 Elm St', 'Nowhere', 'TX', '12345'),
    (16, 'James', 'Taylor', 'james.taylor@example.com', '333-444-5555', '2222 Oak St', 'Anywhere', 'FL', '23456'),
    (17, 'Susan', 'Thomas', 'susan.thomas@example.com', '888-999-0000', '2323 Pine St', 'Elsewhere', 'WA', '34567'),
    (18, 'Jessica', 'Harris', 'jessica.harris@example.com', '444-555-6666', '2424 Cedar St', 'Everywhere', 'CA', '45678'),
    (19, 'Daniel', 'Martin', 'daniel.martin@example.com', '111-222-3333', '2525 Elm St', 'Nowhere', 'TX', '56789'),
    (20, 'Lisa', 'Martinez', 'lisa.martinez@example.com', '555-666-7777', '2626 Oak St', 'Anywhere', 'FL', '67890'),
    (21, 'Paul', 'Hernandez', 'paul.hernandez@example.com', '222-333-4444', '2727 Pine St', 'Elsewhere', 'WA', '78901'),
    (22, 'Mark', 'Young', 'mark.young@example.com', '777-888-9999', '2828 Cedar St', 'Everywhere', 'CA', '89012'),
    (23, 'Michelle', 'King', 'michelle.king@example.com', '333-444-5555', '2929 Elm St', 'Nowhere', 'TX', '90123'),
    (24, 'Karen', 'Wright', 'karen.wright@example.com', '888-999-0000', '3030 Oak St', 'Anywhere', 'FL', '01234'),
    (25, 'Steven', 'Gonzalez', 'steven.gonzalez@example.com', '444-555-6666', '3131 Pine St', 'Elsewhere', 'WA', '12345'),
    (26, 'Edward', 'Walker', 'edward.walker@example.com', '111-222-3333', '3232 Cedar St', 'Everywhere', 'CA', '23456'),
    (27, 'Margaret', 'Perez', 'margaret.perez@example.com', '555-666-7777', '3333 Elm St', 'Nowhere', 'TX', '34567'),
    (28, 'Brian', 'Robinson', 'brian.robinson@example.com', '222-333-4444', '3434 Oak St', 'Anywhere', 'FL', '45678'),
    (29, 'Ronald', 'Cook', 'ronald.cook@example.com', '777-888-9999', '3535 Pine St', 'Elsewhere', 'WA', '56789'),
    (30, 'Anthony', 'Lewis', 'anthony.lewis@example.com', '333-444-5555', '3636 Cedar St', 'Everywhere', 'CA', '67890');



INSERT INTO Suppliers (SupplierID,SupplierName, ContactName, Email, Phone, Address, City, State, ZipCode) 
VALUES 
    (1,'Guitar World', 'John Smith', 'john@example.com', '123-456-7890', '123 Main St', 'Anytown', 'CA', '12345'),
    (2,'Drum Planet', 'Jane Doe', 'jane@example.com', '987-654-3210', '456 Maple Ave', 'Somewhere', 'NY', '54321'),
    (3,'Bass Central', 'Bob Johnson', 'bob@example.com', '555-555-5555', '789 Elm St', 'Nowhere', 'TX', '67890'),
	(4,'Keyboard Emporium', 'Alice Smith', 'alice@example.com', '111-222-3333', '789 Oak St', 'Anywhere', 'FL', '98765'),
    (5,'Microphone Masters', 'James Brown', 'james@example.com', '444-555-6666', '101 Pine St', 'Elsewhere', 'WA', '54321'),
    (6,'Speaker Central', 'Michael Johnson', 'michael@example.com', '777-888-9999', '303 Cedar St', 'Everywhere', 'CA', '23456'),
    (7,'Recording Warehouse', 'Sarah Davis', 'sarah@example.com', '222-333-4444', '456 Elm St', 'Nowhere', 'TX', '34567'),
    (8,'Music Instruments Galore', 'David Martinez', 'david@example.com', '888-999-0000', '789 Oak St', 'Anywhere', 'FL', '45678');

    
    
INSERT INTO Products (ProductID,ProductName, Description, UnitPrice, UnitsInStock, ReorderLevel,SupplierID) 
VALUES 
    (1,'Acoustic Guitar', 'High-quality acoustic guitar for beginners and professionals alike.', 299.99, 50, 10,1),
    (2,'Electric Guitar', 'Sleek electric guitar with versatile tone options.', 399.99, 30, 5,2),
    (3,'Bass Guitar', 'Solid bass guitar for groovy basslines in various music genres.', 449.99, 20, 5,3),
    (4,'Drum Kit', 'Complete drum kit with cymbals and hardware for aspiring drummers.', 599.99, 15, 3,3),
    (5,'Keyboard', 'Versatile keyboard with multiple instrument sounds and recording capabilities.', 499.99, 25, 5,4),
    (6,'Microphone', 'Professional-grade microphone for crystal clear audio recording.', 149.99, 40, 8, 5),
    (7,'Saxophone', 'Classic saxophone suitable for jazz and classical music.', 799.99, 10, 2, 1),
    (8,'Violin', 'Beautifully crafted violin perfect for orchestral performances.', 699.99, 15, 3, 1),
    (9,'Trumpet', 'Versatile trumpet suitable for various music styles.', 499.99, 20, 5, 3),
    (10,'Piano', 'Elegant grand piano with rich tone and responsive touch.', 9999.99, 5, 1, 2),
    (11,'DJ Turntable', 'Professional DJ turntable for mixing and scratching.', 799.99, 10, 2, 5),
    (12,'Flute', 'Classic flute ideal for solo performances and orchestral settings.', 399.99, 25, 5, 1),
    (13,'Trombone', 'Powerful trombone suitable for jazz and brass band music.', 699.99, 15, 3, 3),
    (14,'Clarinet', 'Versatile clarinet perfect for classical and jazz music.', 499.99, 20, 5, 1),
    (15,'Synthesizer', 'Advanced synthesizer with programmable sound design.', 899.99, 10, 2, 2),
    (16,'Cello', 'Full-size cello with warm and resonant sound.', 899.99, 10, 2, 1),
    (17,'Harmonica', 'Portable harmonica suitable for blues and folk music.', 49.99, 50, 10, 3),
    (18,'Accordion', 'Traditional accordion with rich and vibrant sound.', 1299.99, 5, 1, 3),
    (19,'Bagpipes', 'Classic bagpipes ideal for traditional Scottish music.', 899.99, 10, 2, 1),
    (20,'Maracas', 'Fun and colorful maracas for adding rhythm to music.', 19.99, 100, 20, 4),
    (21,'Tambourine', 'Versatile tambourine for adding percussion to various music styles.', 29.99, 75, 15, 4),
    (22,'Triangle', 'Simple yet essential percussion instrument for orchestral and ensemble music.', 9.99, 200, 40, 4),
    (23,'Xylophone', 'Bright and melodic xylophone perfect for educational and performance use.', 149.99, 40, 8, 2),
    (24,'Harp', 'Elegant harp with a soothing and ethereal sound.', 1999.99, 5, 1, 1),
    (25,'Bongo Drums', 'Pair of bongo drums for rhythmic accompaniment in various music genres.', 69.99, 30, 6, 5),
    (26,'Concertina', 'Traditional concertina with a unique and vibrant sound.', 499.99, 20, 5, 3),
    (27,'Steel Drum', 'Caribbean steel drum for adding tropical flair to music.', 299.99, 30, 6, 4),
    (28,'Castanets', 'Pair of castanets for adding Spanish flavor to music.', 19.99, 100, 20, 2),
    (29,'Glockenspiel', 'Glockenspiel with clear and bright sound, suitable for educational use.', 79.99, 50, 10, 1),
    (30,'Didgeridoo', 'Authentic Australian didgeridoo for traditional Aboriginal music.', 299.99, 20, 4, 3);


INSERT INTO Stock (StockID, ProductID, Quantity, SupplierID) 
VALUES 
    (1, 1, 50, 1),
    (2, 2, 30, 2),
    (3, 3, 20, 1),
    (4, 4, 15, 3),
    (5, 5, 25, 2),
    (6, 6, 40, 5),
    (7, 7, 10, 1),
    (8, 8, 15, 1),
    (9, 9, 20, 3),
    (10, 10, 5, 4),
    (11, 11, 10, 5),
    (12, 12, 25, 1),
    (13, 13, 15, 3),
    (14, 14, 20, 1),
    (15, 15, 10, 2),
    (16, 16, 10, 1),
    (17, 17, 50, 3),
    (18, 18, 5, 3),
    (19, 19, 10, 1),
    (20, 20, 100, 4),
    (21, 21, 75, 4),
    (22, 22, 200, 4),
    (23, 23, 40, 2),
    (24, 24, 5, 1),
    (25, 25, 30, 5),
    (26, 26, 20, 3),
    (27, 27, 30, 4),
    (28, 28, 100, 2),
    (29, 29, 50, 1),
    (30, 30, 20, 3);

    

INSERT INTO Orders (CustomerID,OrderID, OrderDate, TotalAmount, ProductID, Quantity, UnitPrice)
VALUES
    (1,1, '2023-01-03', 299.99 * 5, 1, 5, 299.99),
    (2,2, '2023-02-05', 399.99 * 3, 2, 3, 399.99),
    (3,3, '2023-03-10', 449.99 * 2, 3, 2, 449.99),
    (4,4, '2023-04-15', 599.99 * 4, 4, 4, 599.99),
    (5,5, '2023-05-20', 499.99 * 6, 5, 6, 499.99),
    (6,6, '2023-06-25', 149.99 * 3, 6, 3, 149.99),
    (7,7, '2023-07-30', 799.99 * 2, 7, 2, 799.99),
    (8,8, '2023-08-05', 699.99 * 5, 8, 5, 699.99),
    (9,9, '2023-09-10', 499.99 * 4, 9, 4, 499.99),
    (10,10, '2023-10-15', 9999.99 * 3, 10, 3, 9999.99),
    (11,11, '2023-11-20', 799.99 * 4, 11, 4, 799.99),
    (12,12, '2023-12-25', 399.99 * 5, 12, 5, 399.99),
    (13,13, '2023-01-03', 699.99 * 5, 13, 5, 699.99),
    (14,14, '2023-02-05', 499.99 * 3, 14, 3, 499.99),
    (15,15, '2023-03-10', 899.99 * 2, 15, 2, 899.99),
    (16,16, '2023-04-15', 899.99 * 4, 16, 4, 899.99),
    (17,17, '2023-05-20', 49.99 * 6, 17, 6, 49.99),
    (18,18, '2023-06-25', 1299.99 * 3, 18, 3, 1299.99),
    (19,19, '2023-07-30', 899.99 * 2, 19, 2, 899.99),
    (20,20, '2023-08-05', 19.99 * 5, 20, 5, 19.99),
    (21,21, '2023-09-10', 29.99 * 4, 21, 4, 29.99),
    (22,22, '2023-10-15', 9.99 * 3, 22, 3, 9.99),
    (23,23, '2023-11-20', 149.99 * 4, 23, 4, 149.99),
    (24,24, '2023-12-25', 1999.99 * 5, 24, 5, 1999.99),
    (25,25, '2023-01-03', 69.99 * 5, 25, 5, 69.99),
    (26,26, '2023-02-05', 499.99 * 3, 26, 3, 499.99),
    (27,27, '2023-03-10', 299.99 * 2, 27, 2, 299.99),
    (28,28, '2023-04-15', 19.99 * 4, 28, 4, 19.99),
    (29,29, '2023-05-20', 79.99 * 6, 29, 6, 79.99),
    (30,30, '2023-06-25', 299.99 * 3, 30, 3, 299.99),
    (1,31, '2023-07-30', 399.99 * 4, 2, 4, 399.99),
    (2,32, '2023-08-05', 449.99 * 3, 3, 3, 449.99),
    (3,33, '2023-09-10', 599.99 * 2, 4, 2, 599.99),
    (4,34, '2023-10-15', 499.99 * 5, 5, 5, 499.99),
    (5,35, '2023-11-20', 149.99 * 6, 6, 6, 149.99),
    (6,36, '2023-12-25', 799.99 * 3, 7, 3, 799.99),
    (7,37, '2024-01-03', 699.99 * 4, 8, 4, 699.99),
    (8,38, '2024-02-05', 499.99 * 2, 9, 2, 499.99),
    (9,39, '2024-03-10', 9999.99 * 5, 10, 5, 9999.99),
    (10,40, '2024-04-15', 799.99 * 3, 11, 3, 799.99),
    (11,41, '2024-03-20', 399.99 * 4, 12, 4, 399.99),
    (12,42, '2024-03-25', 699.99 * 5, 13, 5, 699.99),
    (13,43, '2024-03-30', 499.99 * 3, 14, 3, 499.99),
    (14,44, '2024-03-05', 899.99 * 2, 15, 2, 899.99),
    (15,45, '2024-03-10', 899.99 * 4, 16, 4, 899.99),
    (16,46, '2024-04-15', 49.99 * 5, 17, 5, 49.99),
    (17,47, '2024-02-20', 1299.99 * 3, 18, 3, 1299.99),
    (18,48, '2024-02-25', 899.99 * 2, 19, 2, 899.99),
    (19,49, '2024-01-03', 19.99 * 4, 20, 4, 19.99),
    (20,50, '2024-02-05', 29.99 * 5, 21, 5, 29.99);

INSERT INTO Shipments (ShipmentID, OrderID, ShipmentDate, Carrier, TrackingNumber) VALUES 
(1, 1, '2023-01-15', 'UPS', '1234567890'),
(2, 2, '2023-07-16', 'FedEx', '0987654321'),
(3, 3, '2023-08-17', 'USPS', '9876543210'),
(4, 4, '2023-04-01', 'DHL', '5678901234'),
(5, 5, '2023-04-02', 'UPS', '2345678901'),
(6, 6, '2023-04-03', 'FedEx', '3456789012'),
(7, 7, '2023-04-04', 'USPS', '4567890123'),
(8, 8, '2023-04-05', 'DHL', '6789012345'),
(9, 9, '2023-04-06', 'UPS', '7890123456'),
(10, 10, '2023-04-07', 'FedEx', '8901234567'),
(11, 11, '2023-04-08', 'USPS', '9012345678'),
(12, 12, '2023-04-09', 'DHL', '0123456789'),
(13, 13, '2023-04-10', 'UPS', '4321098765'),
(14, 14, '2023-04-11', 'FedEx', '3210987654'),
(15, 15, '2023-04-12', 'USPS', '2109876543'),
(16, 16, '2023-04-13', 'DHL', '0987654321'),
(17, 17, '2023-04-14', 'UPS', '9876543210'),
(18, 18, '2023-04-15', 'FedEx', '8765432109'),
(19, 19, '2023-04-16', 'USPS', '7654321098'),
(20, 20, '2023-04-17', 'DHL', '6543210987'),
(21, 21, '2023-04-18', 'UPS', '5432109876'),
(22, 22, '2023-04-19', 'FedEx', '4321098765'),
(23, 23, '2023-04-20', 'USPS', '3210987654'),
(24, 24, '2023-04-21', 'DHL', '2109876543'),
(25, 25, '2023-04-22', 'UPS', '0987654321'),
(26, 26, '2023-04-23', 'FedEx', '9876543210'),
(27, 27, '2023-04-24', 'USPS', '8765432109'),
(28, 28, '2024-04-25', 'DHL', '7654321098'),
(29, 29, '2024-04-26', 'UPS', '6543210987'),
(30, 30, '2024-04-27', 'FedEx', '5432109876'),
(31, 31, '2024-04-28', 'USPS', '4321098765'),
(32, 32, '2023-04-29', 'DHL', '3210987654'),
(33, 33, '2023-04-30', 'UPS', '2109876543'),
(34, 34, '2023-05-01', 'FedEx', '1098765432'),
(35, 35, '2023-05-02', 'USPS', '0987654321'),
(36, 36, '2023-05-03', 'DHL', '9876543210'),
(37, 37, '2024-05-04', 'UPS', '8765432109'),
(38, 38, '2023-03-05', 'FedEx', '7654321098'),
(39, 39, '2024-03-06', 'USPS', '6543210987'),
(40, 40, '2023-03-07', 'DHL', '5432109876'),
(41, 41, '2024-04-08', 'UPS', '4321098765'),
(42, 42, '2024-04-09', 'FedEx', '3210987654'),
(43, 43, '2024-04-10', 'USPS', '2109876543'),
(44, 44, '2024-04-11', 'DHL', '0987654321'),
(45, 45, '2024-04-12', 'UPS', '9876543210'),
(46, 46, '2024-04-13', 'FedEx', '8765432109'),
(47, 47, '2024-04-14', 'USPS', '7654321098'),
(48, 48, '2024-04-15', 'DHL', '6543210987'),
(49, 49, '2024-04-16', 'UPS', '5432109876'),
(50, 50, '2024-04-17', 'FedEx', '4321098765');

INSERT INTO Payments (PaymentID, OrderID, PaymentDate, Amount, PaymentMethod)
VALUES
    (1, 1, '2023-01-04', 299.99 * 5, 'Credit Card'),
    (2, 2, '2023-02-06', 399.99 * 3, 'PayPal'),
    (3, 3, '2023-03-11', 449.99 * 2, 'Credit Card'),
    (4, 4, '2023-04-16', 599.99 * 4, 'Cash'),
    (5, 5, '2023-05-21', 499.99 * 6, 'Credit Card'),
    (6, 6, '2023-06-26', 149.99 * 3, 'Credit Card'),
    (7, 7, '2023-07-31', 799.99 * 2, 'PayPal'),
    (8, 8, '2023-08-06', 699.99 * 5, 'Cash'),
    (9, 9, '2023-09-11', 499.99 * 4, 'Credit Card'),
    (10, 10, '2023-10-16', 9999.99 * 3, 'Credit Card'),
    (11, 11, '2023-11-21', 799.99 * 4, 'PayPal'),
    (12, 12, '2023-12-26', 399.99 * 5, 'Cash'),
    (13, 13, '2023-01-04', 699.99 * 5, 'Credit Card'),
    (14, 14, '2023-02-06', 499.99 * 3, 'PayPal'),
    (15, 15, '2023-03-11', 899.99 * 2, 'Credit Card'),
    (16, 16, '2023-04-16', 899.99 * 4, 'Credit Card'),
    (17, 17, '2023-05-21', 49.99 * 6, 'Cash'),
    (18, 18, '2023-06-26', 1299.99 * 3, 'Credit Card'),
    (19, 19, '2023-07-31', 899.99 * 2, 'PayPal'),
    (20, 20, '2023-08-06', 19.99 * 5, 'Credit Card'),
    (21, 21, '2023-09-11', 29.99 * 4, 'Cash'),
    (22, 22, '2023-10-16', 9.99 * 3, 'Credit Card'),
    (23, 23, '2023-11-21', 149.99 * 4, 'Credit Card'),
    (24, 24, '2023-12-26', 1999.99 * 5, 'PayPal'),
    (25, 25, '2023-01-04', 69.99 * 5, 'Credit Card'),
    (26, 26, '2023-02-06', 499.99 * 3, 'Cash'),
    (27, 27, '2023-03-11', 299.99 * 2, 'Credit Card'),
    (28, 28, '2023-04-16', 19.99 * 4, 'Credit Card'),
    (29, 29, '2023-05-21', 79.99 * 6, 'PayPal'),
    (30, 30, '2023-06-26', 299.99 * 3, 'Cash');


INSERT INTO Returns (ReturnID, OrderID, ReturnDate, Reason) VALUES
    (1, 1, '2023-01-20', 'Wrong size'),
    (2, 2, '2023-07-20', 'Defective product'),
    (3, 3, '2023-08-20', 'Not as described'),
    (4, 4, '2023-04-10', 'Changed mind'),
    (5, 5, '2023-04-05', 'Item damaged during shipping'),
    (6, 6, '2023-06-30', 'Received wrong item'),
    (7, 7, '2023-07-05', 'Item not needed'),
    (8, 8, '2023-08-10', 'Poor quality'),
    (9, 9, '2023-09-15', 'Item didn\'t fit'),
    (10, 10, '2023-10-20', 'Customer found a better deal elsewhere'),
    (11, 11, '2023-11-25', 'Late delivery'),
    (12, 12, '2023-12-30', 'Customer dissatisfied with product'),
    (13, 13, '2023-01-05', 'Item missing parts'),
    (14, 14, '2023-02-10', 'Received duplicate item'),
    (15, 15, '2023-03-15', 'Item not as pictured'),
    (16, 16, '2023-04-20', 'Received expired product'),
    (17, 17, '2023-05-25', 'Customer changed their mind'),
    (18, 18, '2023-06-30', 'Defective item'),
    (19, 19, '2023-07-05', 'Item didn\'t meet expectations'),
    (20, 20, '2023-08-10', 'Customer no longer wants the item'),
    (21, 21, '2023-09-15', 'Item damaged during transit'),
    (22, 22, '2023-10-20', 'Customer received wrong color'),
    (23, 23, '2023-11-25', 'Item not functional'),
    (24, 24, '2023-12-30', 'Customer ordered wrong item'),
    (25, 25, '2023-01-05', 'Customer didn\'t like the item'),
    (26, 26, '2023-02-10', 'Item not suitable for customer needs'),
    (27, 27, '2023-03-15', 'Customer changed their mind'),
    (28, 28, '2023-04-20', 'Customer dissatisfied with product'),
    (29, 29, '2023-05-25', 'Item not as expected'),
    (30, 30, '2023-06-30', 'Customer found a better deal elsewhere');



INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, Phone, Address, City, State, ZipCode, HireDate)
VALUES 
    (1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Main St', 'Anytown', 'CA', '12345', '2022-01-01'),
    (2, 'Jane', 'Smith', 'jane.smith@example.com', '456-789-0123', '456 Elm St', 'Othertown', 'NY', '67890', '2022-02-15'),
    (3, 'Mike', 'Johnson', 'mike.johnson@example.com', '789-012-3456', '789 Oak St', 'Anothertown', 'TX', '45678', '2022-03-20'),
    (4, 'Emily', 'Williams', 'emily.williams@example.com', '012-345-6789', '101 Pine St', 'Somewhere', 'FL', '90123', '2022-04-10'),
    (5, 'David', 'Brown', 'david.brown@example.com', '345-678-9012', '202 Maple St', 'Nowhere', 'WA', '23456', '2022-05-05'),
    (6, 'Sarah', 'Taylor', 'sarah.taylor@example.com', '567-890-1234', '303 Cedar St', 'Anytown', 'CA', '54321', '2022-06-15'),
    (7, 'Michael', 'Martinez', 'michael.martinez@example.com', '890-123-4567', '404 Birch St', 'Othertown', 'NY', '87654', '2022-07-20'),
    (8, 'Jessica', 'Garcia', 'jessica.garcia@example.com', '123-456-7890', '505 Pine St', 'Anothertown', 'TX', '76543', '2022-08-10'),
    (9, 'Daniel', 'Rodriguez', 'daniel.rodriguez@example.com', '234-567-8901', '606 Oak St', 'Somewhere', 'FL', '65432', '2022-09-05'),
    (10, 'Ashley', 'Hernandez', 'ashley.hernandez@example.com', '345-678-9012', '707 Maple St', 'Nowhere', 'WA', '54321', '2022-10-01'),
    (11, 'Christopher', 'Lopez', 'christopher.lopez@example.com', '456-789-0123', '808 Cedar St', 'Anytown', 'CA', '43210', '2022-11-15'),
    (12, 'Amanda', 'Gonzalez', 'amanda.gonzalez@example.com', '567-890-1234', '909 Elm St', 'Othertown', 'NY', '32109', '2022-12-20'),
    (13, 'James', 'Perez', 'james.perez@example.com', '678-901-2345', '1010 Pine St', 'Anothertown', 'TX', '21098', '2023-01-10'),
    (14, 'Jennifer', 'Sanchez', 'jennifer.sanchez@example.com', '789-012-3456', '1111 Oak St', 'Somewhere', 'FL', '10987', '2023-02-05'),
    (15, 'Matthew', 'Ramirez', 'matthew.ramirez@example.com', '890-123-4567', '1212 Maple St', 'Nowhere', 'WA', '09876', '2023-03-02'),
    (16, 'Elizabeth', 'Torres', 'elizabeth.torres@example.com', '901-234-5678', '1313 Cedar St', 'Anytown', 'CA', '98765', '2023-04-15'),
    (17, 'Joshua', 'Flores', 'joshua.flores@example.com', '012-345-6789', '1414 Elm St', 'Othertown', 'NY', '87654', '2023-05-20'),
    (18, 'Emily', 'Rivera', 'emily.rivera@example.com', '123-456-7890', '1515 Pine St', 'Anothertown', 'TX', '76543', '2023-06-25'),
    (19, 'Christopher', 'Long', 'christopher.long@example.com', '234-567-8901', '1616 Oak St', 'Somewhere', 'FL', '65432', '2023-07-30'),
    (20, 'Victoria', 'Kim', 'victoria.kim@example.com', '345-678-9012', '1717 Maple St', 'Nowhere', 'WA', '54321', '2023-08-15'),
    (21, 'Nicholas', 'Nguyen', 'nicholas.nguyen@example.com', '456-789-0123', '1818 Cedar St', 'Anytown', 'CA', '43210', '2023-09-20'),
    (22, 'Hannah', 'Chen', 'hannah.chen@example.com', '567-890-1234', '1919 Elm St', 'Othertown', 'NY', '32109', '2023-10-25'),
    (23, 'Andrew', 'Wang', 'andrew.wang@example.com', '678-901-2345', '2020 Pine St', 'Anothertown', 'TX', '21098', '2023-11-30'),
    (24, 'Madison', 'Wong', 'madison.wong@example.com', '789-012-3456', '2121 Oak St', 'Somewhere', 'FL', '10987', '2023-12-05'),
    (25, 'Joseph', 'Le', 'joseph.le@example.com', '890-123-4567', '2222 Maple St', 'Nowhere', 'WA', '09876', '2024-01-10');

INSERT INTO Departments (DepartmentID, DepartmentName, ManagerID)
VALUES
    (1, 'Sales', 1),
    (2, 'Marketing', 2),
    (3, 'Finance', 3),
    (4, 'Human Resources', 4),
    (5, 'Information Technology', 5),
    (6, 'Operations', 6),
    (7, 'Customer Service', 7),
    (8, 'Research and Development', 8);
    
    
    
    
    
-- Query 1 Create a View showing all transactions for a given week in your business. 
# Firstly, we create our Data Mart database. 
DROP DATABASE IF EXISTS datamart;
CREATE DATABASE IF NOT EXISTS datamart;
# First we connect to sales and create a series of views from our exercise
Use sales;
DROP VIEW IF EXISTS View1;

Create VIEW View1 AS 
SELECT *
FROM orders
WHERE orders.OrderDate BETWEEN '2023-04-01' AND '2024-04-09' ;

Create Table DataMart.Query1 SELECT * FROM sales.view1;

use datamart;
select * from Query1  


-- Query 2  Create a trigger that stores stock levels once a sale takes place
Use sales;
DROP TRIGGER IF EXISTS update_stock_after_sale;
DELIMITER //

CREATE TRIGGER update_stock_after_sale
AFTER INSERT ON Orders
FOR EACH ROW
BEGIN
    UPDATE Stock
    SET Quantity = Quantity - NEW.Quantity
    WHERE ProductID = NEW.ProductID;
END //

DELIMITER ;

-- Test trigger 
use sales;
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, ProductID, Quantity, UnitPrice)
VALUES (1, '2024-04-10', 200.00, 1, 3, 50.00);

-- Check the stock table to see if the trigger has updated the quantity
SELECT * FROM orders;
select * from stock;


-- Query 3 Create a View of stock (by supplier) purchased by you
Use sales;
DROP VIEW IF EXISTS View2;

Create VIEW View2 AS 
SELECT s.StockID, s.ProductID, s.Quantity, s.SupplierID, p.ProductName, su.SupplierName
FROM Stock s
JOIN Products p ON s.ProductID = p.ProductID
JOIN Suppliers su ON s.SupplierID = su.SupplierID
JOIN Orders o ON s.ProductID = o.ProductID;

DROP TABLE IF EXISTS Query2;
Create Table DataMart.Query2 SELECT * FROM sales.view2;

use datamart;
select * from Query2

-- Query 4 Create a View of Total stock sold to general public (group by supplier)
USE sales;
-- Drop the view if it exists
DROP VIEW IF EXISTS view3;
-- Create the view 
CREATE VIEW view3 AS 
SELECT s.SupplierID, SUM(o.Quantity) AS TotalStockSold
FROM Stock s
JOIN Orders o ON s.ProductID = o.ProductID
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.CustomerID IS NOT NULL
GROUP BY s.SupplierID;

DROP TABLE IF EXISTS Query3;
Create Table DataMart.Query3 SELECT * FROM sales.view3;

use datamart;
select * from Query3;

-- Query 5 Detail and total all transactions (SALES) for the month-to-date. (A Group By with Roll-Up) 
USE sales; 
SELECT COALESCE(OrderID, 'GrandTotal') AS PurchaseType, 
       SUM(TotalAmount) AS TotalSales
FROM Orders
WHERE orders.OrderDate BETWEEN '2024-03-01' AND '2024-03-31'
GROUP BY OrderID WITH ROLLUP;


-- Query 6 Detail and total all SALES for the year-to-date. (A Group By with Roll-Up) (15%) – All months
USE sales; 
SELECT COALESCE(OrderID, 'GrandTotal') AS PurchaseType,  YEAR(OrderDate) AS year, MONTH(OrderDate) AS month,
       SUM(TotalAmount) AS TotalSales
FROM Orders
WHERE orders.OrderDate BETWEEN '2024-01-01' AND '2024-03-31'
GROUP BY YEAR(OrderDate), MONTH(OrderDate),OrderID
 WITH ROLLUP;

-- Query 7 Display the growth in sales/services (as a percentage) for your business, from the 1st month of opening until now. 
USE sales;

SELECT 
    YEAR(OrderDate) AS year, 
    MONTH(OrderDate) AS month, 
    CONCAT(FORMAT(((SUM(TotalAmount) - LAG(SUM(TotalAmount)) OVER (ORDER BY YEAR(OrderDate), MONTH(OrderDate))) / LAG(SUM(TotalAmount)) OVER (ORDER BY YEAR(OrderDate), MONTH(OrderDate))) * 100, 2), '%') AS sales_growth_percentage 
FROM 
    Orders 
WHERE 
    OrderDate >= '2023-01-01' 
GROUP BY 
    YEAR(OrderDate), 
    MONTH(OrderDate);

-- Query 8 Display all returns to date.
select* 
from returns;