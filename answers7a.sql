CREATE TABLE ProductDetail (
    OrderID INT,
    CustomerName VARCHAR(100),
    Products VARCHAR(255)
);

INSERT INTO ProductDetail (OrderID, CustomerName, Products)
VALUES
    (101, 'John Doe', 'Laptop, Mouse'),
    (102, 'Jane Smith', 'Tablet, Keyboard, Mouse'),
    (103, 'Emily Clark', 'Phone');
    
WITH RECURSIVE SplitProducts AS (
    SELECT 
        OrderID,
        CustomerName,
        TRIM(SUBSTRING_INDEX(Products, ',', 1)) AS Product,
        TRIM(SUBSTRING(Products, LENGTH(SUBSTRING_INDEX(Products, ',', 1)) + 2)) AS Remaining
    FROM ProductDetail

    UNION ALL

    SELECT
        OrderID,
        CustomerName,
        TRIM(SUBSTRING_INDEX(Remaining, ',', 1)),
        TRIM(SUBSTRING(Remaining, LENGTH(SUBSTRING_INDEX(Remaining, ',', 1)) + 2))
    FROM SplitProducts
    WHERE Remaining IS NOT NULL AND Remaining != ''
)

SELECT OrderID, CustomerName, Product
FROM SplitProducts
ORDER BY OrderID;
