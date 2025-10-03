# 📚 SQL Project: Books, Customers & Orders Analysis

## 📖 Project Overview
This project demonstrates the use of **SQL queries** to analyze data from three datasets:
- **Books.csv** → Book details (title, author, genre, price, stock).
- **Customers.csv** → Customer details (name, age, city).
- **Orders.csv** → Order information (which customer bought which book, quantity, total spent).

The queries in **Queries.sql** focus on:
- Customer purchase behavior
- Book sales trends
- Revenue generation


---

## 🗂️ Dataset Description

### 1. Books.csv
| Column Name | Description |
|-------------|-------------|
| BookID      | Unique identifier for each book |
| Title       | Title of the book |
| Author      | Author of the book |
| Genre       | Book genre/category |
| Price       | Price of the book |
| Quantity    | Number of copies available |

### 2. Customers.csv
| Column Name | Description |
|-------------|-------------|
| CustomerID  | Unique identifier for each customer |
| Name        | Customer full name |
| Email       | Customer email address |
| City        | City where the customer lives |
| Age         | Age of the customer |

### 3. Orders.csv
| Column Name | Description |
|-------------|-------------|
| OrderID     | Unique identifier for each order |
| CustomerID  | Foreign key → Customers(CustomerID) |
| BookID      | Foreign key → Books(BookID) |
| Quantity    | Number of books ordered |
| TotalAmount   | Total amount spent |

---

## 📜 SQL Queries
The `Queries.sql` file includes queries such as:
- Find top-selling books  
- Calculate total revenue  
- Identify most valuable customers  
- Track orders by city or date   

---

## 🚀 How to Run the Project
1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/sql-project-books-customers-orders.git
