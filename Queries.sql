-- Create Tables
DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);

DROP TABLE IF EXISTS customers;
CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);

DROP TABLE IF EXISTS orders;
CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);

--1) Show all the customers who ordered more than 1 quantity of books
SELECT c.name, c.country, SUM(o.quantity) AS Ordered_quantity,
DENSE_Rank() OVER(ORDER BY SUM(o.quantity) DESC)
FROM Customers c
JOIN Orders o ON
c.customer_id = o.customer_id
GROUP BY c.name, c.country
HAVING SUM(o.quantity) > 1;

--2) Retrieve the total number of books sold for each genre
SELECT b.genre, SUM(o.quantity) AS quantity_sold from books b
LEFT JOIN Orders o ON 
b.book_id = o.book_id
GROUP BY b.genre;


--3) List customers who have placed at least 2 orders
SELECT c.customer_id, c.name, COUNT(o.order_id) AS total_order
FROM Customers c JOIN Orders o ON
c.customer_id= o.customer_id
GROUP BY c.customer_id, c.name
HAVING COUNT(o.order_id) >= 2;

--4) Find the most highest ordered book
SELECT b.title, b.book_id, COUNT(o.order_id) AS Total_order 
FROM Books b JOIN Orders o ON
b.book_id = o.book_id
GROUP BY b.title, b.book_id
ORDER BY COUNT(o.order_id) DESC;

--5) Retrieve the total quantity of books sold by each author
SELECT b.author, SUM(o.quantity) AS Book_Sold 
FROM Books b JOIN Orders o ON
b.book_id = o.book_id
GROUP BY b.author;

--6) List the cities where customers who spent over $30 are located
SELECT c.city, c.customer_id, SUM(o.total_amount) AS Total_spent  
FROM customers c JOIN orders o ON
c.customer_id = o.customer_id
GROUP BY c.city, c.customer_id
HAVING SUM(o.total_amount) > 30 ;

--7) Find the Top 3 customer who spent the most on orders
SELECT c.name, c.customer_id, SUM(o.total_amount)
FROM CUSTOMERS c
JOIN ORDERS o ON 
c.customer_id = o.customer_id
GROUP BY c.name, c.customer_id
ORDER BY SUM(o.total_amount) DESC
LIMIT 3 ;
