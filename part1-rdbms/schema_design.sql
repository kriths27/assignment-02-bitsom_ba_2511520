CREATE TABLE SalesReps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    office_address TEXT NOT NULL
);

CREATE TABLE Customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(50) NOT NULL
);

CREATE TABLE Products (
    product_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    sales_rep_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (sales_rep_id) REFERENCES SalesReps(sales_rep_id)
);

-- Sample Data (I used data from CSV itself)
INSERT INTO SalesReps VALUES ('SR04', 'Kriththika', 'kriths@corp.com', 'Mumbai HQ, Nariman Point, Mumbai - 400021');
INSERT INTO SalesReps VALUES ('SR05', 'Priya', 'priya@corp.com', 'Delhi Office, Connaught Place, New Delhi - 110001');
INSERT INTO SalesReps VALUES ('SR06', 'Jai', 'jai@corp.com', 'Delhi Office, Connaught Place, New Delhi - 110001');
INSERT INTO SalesReps VALUES ('SR07', 'Soorya', 'soorya@corp.com', 'Delhi Office, Connaught Place, New Delhi - 110001');
INSERT INTO SalesReps VALUES ('SR08', 'Raji', 'raji@corp.com', 'South Zone, MG Road, Bangalore - 560001');

INSERT INTO Customers VALUES ('C010', 'Rohan Mahe', 'rohan.m@gmail.com', 'Mumbai');
INSERT INTO Customers VALUES ('C011', 'Priya Rathodde', 'priya.r@gmail.com', 'Delhi');
INSERT INTO Customers VALUES ('C012', 'parlrani', 'rani@gmail.com', 'Mumbai');
INSERT INTO Customers VALUES ('C013', 'Kriths', 'kikki@gmail.com', 'Delhi');
INSERT INTO Customers VALUES ('C014', 'Kajol', 'kajol@gmail.com', 'Bengaluru')

INSERT INTO Products VALUES ('P010', 'Sketch', 'Stationery', 130.00);
INSERT INTO Products VALUES ('P011', 'Fountain Pen', 'Stationery', 750.00);
INSERT INTO Products VALUES ('P012', 'Shirt', 'Textile', 530.00);
INSERT INTO Products VALUES ('P013', 'Diary', 'Stationery', 550.00);
INSERT INTO Products VALUES ('P014', 'iPhone', 'Electronics', 55550.00);

INSERT INTO Orders VALUES ('ORD1027', 'C002', 'P004', 'SR02', 4, '2023-11-02');
INSERT INTO Orders VALUES ('ORD1114', 'C001', 'P007', 'SR01', 2, '2023-08-06');
INSERT INTO Orders VALUES ('ORD1027', 'C002', 'P004', 'SR02', 4, '2023-11-02');
INSERT INTO Orders VALUES ('ORD1114', 'C001', 'P007', 'SR01', 2, '2023-08-06');
INSERT INTO Orders VALUES ('ORD1027', 'C002', 'P004', 'SR02', 4, '2023-11-02');
