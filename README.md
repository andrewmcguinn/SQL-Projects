Sales Database Schema - README
Overview
The sales database is designed to manage information related to customers, suppliers, products, orders, shipments, payments, returns, employees, and departments. It tracks the flow of sales, inventory, and relationships between customers and suppliers.

Database Name
sales

Key Tables
Customers
Stores customer information such as name, email, phone number, and address.

Suppliers
Stores supplier details including the supplier's contact information.

Products
Contains product details such as name, description, price, stock information, and the supplier from which it is sourced.

Stock
Tracks stock levels for products.

Orders
Tracks customer orders, including the date, product quantity, and total amount.

Shipments
Stores information about the shipment of products, including carrier and tracking details.

Payments
Tracks payments made by customers for orders, including payment date, amount, and method.

Returns
Tracks returned orders, including the date and reason for the return.

Employees
Contains information on employees such as their name, contact information, and hire date.

Departments
Tracks departments within the organization and their managers.

Table Details
1. Customers
Column Name	Data Type	Description
CustomerID	INT	Primary Key, Auto-incremented
FirstName	VARCHAR	First name of the customer
LastName	VARCHAR	Last name of the customer
Email	VARCHAR	Email address of the customer
Phone	VARCHAR	Phone number of the customer
Address	VARCHAR	Street address of the customer
City	VARCHAR	City of the customer
State	VARCHAR	State of the customer
ZipCode	VARCHAR	Zip code of the customer

3. Suppliers
Column Name	Data Type	Description
SupplierID	INT	Primary Key, Supplier ID
SupplierName	VARCHAR	Name of the supplier
ContactName	VARCHAR	Contact person at the supplier
Email	VARCHAR	Email address of the supplier
Phone	VARCHAR	Phone number of the supplier
Address	VARCHAR	Street address of the supplier
City	VARCHAR	City of the supplier
State	VARCHAR	State of the supplier
ZipCode	VARCHAR	Zip code of the supplier

4. Products
Column Name	Data Type	Description
ProductID	INT	Primary Key, Auto-incremented
ProductName	VARCHAR	Name of the product
Description	VARCHAR	Description of the product
UnitPrice	DECIMAL	Price per unit
UnitsInStock	INT	Number of units in stock
ReorderLevel	INT	Stock level at which reordering occurs
SupplierID	INT	Foreign Key, references Suppliers

5. Stock
Column Name	Data Type	Description
StockID	INT	Primary Key, Auto-incremented
ProductID	INT	Foreign Key, references Products
Quantity	INT	Number of products in stock
SupplierID	INT	Foreign Key, references Suppliers

6. Orders
Column Name	Data Type	Description
OrderID	INT	Primary Key, Auto-incremented
CustomerID	INT	Foreign Key, references Customers
OrderDate	DATE	Date when the order was placed
TotalAmount	DECIMAL	Total amount of the order
ProductID	INT	Foreign Key, references Products
Quantity	INT	Quantity of the product ordered
UnitPrice	DECIMAL	Price per unit of the product

7. Shipments
Column Name	Data Type	Description
ShipmentID	INT	Primary Key, Auto-incremented
OrderID	INT	Foreign Key, references Orders
ShipmentDate	DATE	Date of shipment
Carrier	VARCHAR	Carrier handling the shipment
TrackingNumber	VARCHAR	Tracking number for the shipment

8. Payments
Column Name	Data Type	Description
PaymentID	INT	Primary Key, Auto-incremented
OrderID	INT	Foreign Key, references Orders
PaymentDate	DATE	Date of payment
Amount	DECIMAL	Amount paid
PaymentMethod	VARCHAR	Method of payment

9. Returns
Column Name	Data Type	Description
ReturnID	INT	Primary Key, Auto-incremented
OrderID	INT	Foreign Key, references Orders
ReturnDate	DATE	Date of the return
Reason	TEXT	Reason for the return

11. Employees
Column Name	Data Type	Description
EmployeeID	INT	Primary Key, Auto-incremented
FirstName	VARCHAR	First name of the employee
LastName	VARCHAR	Last name of the employee
Email	VARCHAR	Email address of the employee
Phone	VARCHAR	Phone number of the employee
Address	VARCHAR	Street address of the employee
City	VARCHAR	City of the employee
State	VARCHAR	State of the employee
ZipCode	VARCHAR	Zip code of the employee
HireDate	DATE	Hire date of the employee

12. Departments
Column Name	Data Type	Description
DepartmentID	INT	Primary Key, Auto-incremented
DepartmentName	VARCHAR	Name of the department
ManagerID	INT	Foreign Key, references Employees

Data Relationships
Customers-Orders: Each customer can have multiple orders.
Suppliers-Products: Each product is sourced from a supplier.
Products-Orders: Each order contains multiple products.
Shipments-Orders: Each order can have multiple shipments.
Payments-Orders: Each order can have multiple payments.
Employees-Departments: Each department is managed by one employee.
Foreign Keys
Foreign keys ensure data integrity between tables:

Orders linked to Customers and Products.
Products linked to Suppliers.
Shipments, Payments, and Returns linked to Orders.
Departments linked to Employees.
