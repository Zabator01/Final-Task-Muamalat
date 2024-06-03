SELECT
    o.Date AS order_date,
    pc.CategoryName AS category_name,
    p.ProdName AS product_name,
    p.Price AS product_price,
    o.Quantity AS order_qty,
    ROUND(SUM(p.Price * o.Quantity), 2) AS total_sales,
    c.CustomerEmail AS cust_email,
    c.CustomerCity AS cust_city
FROM
    muamalat-425304.FinalTask.Orders o
    JOIN muamalat-425304.FinalTask.Customers c ON o.CustomerID = c.CustomerID
    JOIN muamalat-425304.FinalTask.Products p ON o.ProdNumber = p.ProdNumber
    JOIN muamalat-425304.FinalTask.ProductCategory pc ON p.Category = pc.CategoryID
GROUP BY
    o.Date,
    pc.CategoryName,
    p.ProdName,
    p.Price,
    o.Quantity,
    c.CustomerEmail,
    c.CustomerCity
ORDER BY
    o.Date;