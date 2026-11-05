-- Create Database
CREATE DATABASE OnlineBookstore;

-- Using Database
USE OnlineBookStore;

-- Creating Books Table
CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);

-- Creating Table Customers
CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);

-- Creating Orders Table
CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

-- Imported all data in Tables

-- 1. All Books In Fiction Genre
SELECT * FROM Books 
WHERE Genre='Fiction';

-- 2. Books Published After 1950
SELECT * FROM Books 
WHERE Published_year>1950;

-- 3.All Customers From Canada
SELECT * FROM Customers 
WHERE country='Canada';

-- 4.Orders Placed in November 2023
SELECT * FROM Orders 
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

-- 5. Total Available Books Stock
SELECT SUM(stock) AS Total_Stock
From Books;

-- 6.Most Expensive Books
SELECT * FROM Books 
ORDER BY Price DESC 
LIMIT 1;

-- 7.Customers who ordered more than 1 Book
SELECT * FROM Orders 
WHERE quantity>1;

-- 8.All Orders where total amount exceeds 20$
SELECT * FROM Orders 
WHERE total_amount>20;

-- 9.All Genres available in Books
SELECT DISTINCT genre FROM Books;

-- 10. Books with Lowest Stock
SELECT * FROM Books 
ORDER BY stock 
LIMIT 1;

-- 11.Total Revenue
SELECT SUM(total_amount) As Revenue 
FROM Orders;