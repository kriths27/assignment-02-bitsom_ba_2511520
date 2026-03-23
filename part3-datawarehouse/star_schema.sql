-- Dimension Tables

CREATE TABLE dim_date (
    date_key INT PRIMARY KEY,
    full_date DATE NOT NULL,
    day INT,
    month INT,
    year INT,
    quarter INT
);

CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    store_city VARCHAR(100)
);

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(100)
);

-- Fact Table

CREATE TABLE fact_sales (
    transaction_id VARCHAR(50) PRIMARY KEY,
    date_key INT,
    store_id INT,
    product_id INT,
    units_sold INT,
    unit_price DECIMAL(10, 2),
    total_revenue DECIMAL(15, 2),
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- Insert Dimension Data
INSERT INTO dim_store (store_id, store_name, store_city) VALUES
(1, 'Chennai Anna', 'Chennai'),
(2, 'Delhi South', 'Delhi'),
(3, 'Bangalore MG', 'Bangalore'),
(4, 'Pune FC Road', 'Pune'),
(5, 'Mumbai Central', 'Mumbai');

INSERT INTO dim_product (product_id, product_name, category) VALUES
(1, 'Speaker', 'Electronics'),
(2, 'Tablet', 'Electronics'),
(3, 'Phone', 'Electronics'),
(4, 'Smartwatch', 'Electronics'),
(5, 'Atta 10kg', 'Groceries');

-- Insert Date Dimension
INSERT INTO dim_date (date_key, full_date, day, month, year, quarter) VALUES
(20230829, '2023-08-29', 29, 8, 2023, 3),
(20231212, '2023-12-12', 12, 12, 2023, 4),
(20230205, '2023-02-05', 5, 2, 2023, 1),
(20230220, '2023-02-20', 20, 2, 2023, 1),
(20230115, '2023-01-15', 15, 1, 2023, 1);

-- Insert Fact Data
INSERT INTO fact_sales (transaction_id, date_key, store_id, product_id, units_sold, unit_price, total_revenue) VALUES
('TXN5000', 20230829, 1, 1, 3, 49262.78, 147788.34),
('TXN5001', 20231212, 1, 2, 11, 23226.12, 255487.32),
('TXN5002', 20230205, 1, 3, 20, 48703.39, 974067.80),
('TXN5003', 20230220, 2, 2, 14, 23226.12, 325165.68),
('TXN5004', 20230115, 1, 4, 10, 58851.01, 588510.10),
('TXN5005', 20230809, 3, 5, 12, 52464.00, 629568.00),
('TXN5006', 20230331, 4, 4, 6, 58851.01, 353106.06),
('TXN5007', 20231026, 4, 6, 16, 2317.47, 37079.52),
('TXN5008', 20231208, 3, 7, 9, 27469.99, 247229.91),
('TXN5009', 20230815, 3, 4, 3, 58851.01, 176553.03);
