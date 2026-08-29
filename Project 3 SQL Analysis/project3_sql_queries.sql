SELECT COUNT(*) FROM orders;

SELECT * FROM Orders LIMIT 10;

SELECT OrderDate, YEAR(OrderDate) AS Yr FROM orders LIMIT 5;

SELECT Product, TotalPrice FROM orders;

SELECT * FROM orders WHERE OrderStatus = 'Cancelled';

SELECT * FROM orders WHERE PaymentMethod = 'Credit Card';

SELECT Product, TotalPrice FROM orders ORDER BY TotalPrice DESC;

SELECT COUNT(*) AS Total_Orders FROM orders;

SELECT COUNT(*) AS Cancelled_Orders FROM orders WHERE OrderStatus = 'Cancelled';

SELECT SUM(TotalPrice) AS Total_Revenue FROM orders;

SELECT AVG(TotalPrice) AS Avg_Order_Value FROM orders;

SELECT Product, Count(*) AS Orders, SUM(TotalPrice) AS Total_Revenue, AVG(TotalPrice) AS Avg_Order_Value FROM orders GROUP BY Product ORDER BY Total_Revenue DESC;

SELECT PaymentMethod, Count(*) AS Orders, SUM(TotalPrice) AS Total_Revenue, AVG(TotalPrice) AS Avg_Order_Value FROM orders GROUP BY PaymentMethod ORDER BY Total_Revenue DESC;

SELECT OrderStatus, Count(*) AS Orders, SUM(TotalPrice) AS Total_Revenue, AVG(TotalPrice) AS Avg_Order_Value FROM orders GROUP BY OrderStatus ORDER BY Total_Revenue DESC;

SELECT ReferralSource, Count(*) AS Orders, SUM(TotalPrice) AS Total_Revenue, AVG(TotalPrice) AS Avg_Order_Value FROM orders GROUP BY ReferralSource ORDER BY Total_Revenue DESC;

SELECT 
PaymentMethod,
COUNT(*) AS Orders,
SUM(CASE WHEN OrderStatus IN ('Cancelled', 'Returned') THEN 1 ELSE 0 END) AS Risk_Orders,
ROUND (100.0 * SUM(CASE WHEN OrderStatus IN ('Cancelled', 'Returned') THEN 1 ELSE 0 END) / COUNT(*), 2) AS Risk_Rate_Pct
FROM orders
GROUP BY PaymentMethod
ORDER BY Risk_Rate_Pct DESC;

SELECT
ROUND(100.0 * SUM(CASE WHEN OrderStatus IN ('Cancelled', 'Returned') THEN 1 ELSE 0 END) / COUNT(*), 2) AS Overall_Risk_Rate
FROM orders;

SELECT
Product,
SUM(TotalPrice) AS Total_Revenue,
SUM(CASE WHEN OrderStatus IN ('Cancelled', 'Returned') THEN TotalPrice ELSE 0 END) AS Revenue_At_Risk,
ROUND(100.0 * SUM(CASE WHEN OrderStatus IN ('Cancelled', 'Returned') THEN TotalPrice ELSE 0 END) / SUM(TotalPrice), 2) AS Pct_Revenue_Lost
FROM orders
GROUP BY Product
ORDER BY Pct_Revenue_Lost DESC;

SELECT
CouponCode,
COUNT(*) AS Orders,
ROUND(AVG(TotalPrice), 2) AS Avg_Order_Value,
ROUND(100.00 * SUM(CASE WHEN OrderStatus IN ('Cancelled', 'Returned') THEN 1 ELSE 0 END) / COUNT(*), 2) AS Risk_Rate_Pct
FROM orders
GROUP BY CouponCode
ORDER BY Risk_Rate_Pct DESC;

SELECT
Product,
SUM(TotalPrice) AS Total_Revenue,
ROUND(100.0 * SUM(TotalPrice) / (SELECT SUM(TotalPrice) FROM orders), 2) AS Pct_Of_Total_Revenue
FROM orders
GROUP BY Product
ORDER BY Pct_Of_Total_Revenue DESC;

SELECT
ReferralSource,
SUM(TotalPrice) AS Total_Revenue,
ROUND(100.0 * SUM(TotalPrice) / (SELECT SUM(TotalPrice) FROM orders), 2) AS Pct_Of_Total_Revenue
FROM orders
GROUP BY ReferralSource
ORDER BY Pct_Of_Total_Revenue DESC;

SELECT SUM(TotalPrice) AS Grand_Total FROM orders;
