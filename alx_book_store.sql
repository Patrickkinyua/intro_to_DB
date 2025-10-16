-- Assuming the 'authors' table has already been created (from the previous context)

-- Corrected Books Table
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT, -- DEFINITION must precede the FOREIGN KEY constraint
    price DECIMAL(10, 2) NOT NULL, -- Changed INT to DECIMAL for currency
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES authors (author_id)
);

-- Customers Table (No syntax error, but standardized)
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE, -- Added UNIQUE constraint
    address TEXT
);

-- Orders Table (No syntax error)
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

-- Corrected Order_Details Table (Uses a Composite Primary Key)
CREATE TABLE order_details (
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL, -- Changed DOUBLE to INT or SMALLINT
    PRIMARY KEY (order_id, book_id), -- Composite Primary Key for unique line items
    FOREIGN KEY (order_id) REFERENCES orders (order_id),
    FOREIGN KEY (book_id) REFERENCES Books (book_id)
);

CREATE TABLE authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT, -- Use SERIAL in PostgreSQL or IDENTITY in SQL Server
    author_name VARCHAR(215) NOT NULL
);