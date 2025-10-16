-- File: alx_book_store.sql
-- Database Schema for Online Bookstore

CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- Authors table
CREATE TABLE authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- Books table
CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215),
    address TEXT
);

-- Orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Order Details table
CREATE TABLE order_Details (
    orderdetailid INT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
