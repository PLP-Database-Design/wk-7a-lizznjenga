DROP TABLE IF EXISTS OrderDetails;
CREATE TABLE OrderDetails (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    Quantity INT
);
INSERT INTO OrderDetails (OrderID, CustomerName, Product, Quantity)
VALUES
    (101, 'John Doe', 'Laptop', 2),
    (101, 'John Doe', 'Mouse', 1),
    (102, 'Jane Smith', 'Tablet', 3),
    (102, 'Jane Smith', 'Keyboard', 1),
    (102, 'Jane Smith', 'Mouse', 2),
    (103, 'Emily Clark', 'Phone', 1);
    
    DROP TABLE IF EXISTS Orders;

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

DROP TABLE IF EXISTS OrderDetails2NF;

CREATE TABLE OrderDetails2NF (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO OrderDetails2NF (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;




