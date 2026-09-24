-- Additional Business Analysis
-- Customer & Supply Chain Performance

-- 1. Revenue by Market
SELECT
    Market,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    COUNT(*) AS Total_Orders
FROM TrackDel
GROUP BY Market
ORDER BY Total_Sales DESC;


-- 2. Average Delivery Days by Shipping Mode
SELECT
    Shipping_Mode,
    ROUND(AVG(Days_for_shipping_real), 2) AS Avg_Delivery_Days,
    COUNT(*) AS Orders
FROM TrackDel
GROUP BY Shipping_Mode
ORDER BY Avg_Delivery_Days;


-- 3. Late Delivery Rate by Market
SELECT
    Market,
    COUNT(*) AS Total_Orders,
    SUM(CASE WHEN Late_delivery_risk = 1 THEN 1 ELSE 0 END) AS Late_Orders,
    ROUND(
        100.0 * SUM(CASE WHEN Late_delivery_risk = 1 THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS Late_Delivery_Rate
FROM TrackDel
GROUP BY Market
ORDER BY Late_Delivery_Rate DESC;


-- 4. Top 10 Product Categories by Sales
SELECT
    Category_Name,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    COUNT(*) AS Orders
FROM TrackDel
GROUP BY Category_Name
ORDER BY Total_Sales DESC
LIMIT 10;


-- 5. Customer Segment Performance
SELECT
    Customer_Segment,
    COUNT(*) AS Orders,
    ROUND(SUM(Sales), 2) AS Revenue,
    ROUND(AVG(Sales), 2) AS Average_Order_Value
FROM TrackDel
GROUP BY Customer_Segment
ORDER BY Revenue DESC;