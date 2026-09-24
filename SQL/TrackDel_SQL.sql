mysql -u root -p --local-infile=1

CREATE DATABASE trackdel;

USE trackdel;

CREATE TABLE trackdel_data (
Type TEXT,
Days_for_shipping_real TEXT,
Days_for_shipment_scheduled TEXT,
Benefit_per_order TEXT,
Sales_per_customer TEXT,
Delivery_Status TEXT,
Late_delivery_risk TEXT,
Category_Id TEXT,
Category_Name TEXT,
Customer_City TEXT,
Customer_Country TEXT,
Customer_Email TEXT,
Customer_Fname TEXT,
Customer_Id TEXT,
Customer_Lname TEXT,
Customer_Password TEXT,
Customer_Segment TEXT,
Customer_State TEXT,
Customer_Street TEXT,
Customer_Zipcode TEXT,
Department_Id TEXT,
Department_Name TEXT,
Latitude TEXT,
Longitude TEXT,
Market TEXT,
Order_City TEXT,
Order_Country TEXT,
Order_Customer_Id TEXT,
Order_Date TEXT,
Order_Id TEXT,
Order_Item_Cardprod_Id TEXT,
Order_Item_Discount TEXT,
Order_Item_Discount_Rate TEXT,
Order_Item_Id TEXT,
Order_Item_Product_Price TEXT,
Order_Item_Profit_Ratio TEXT,
Order_Item_Quantity TEXT,
Sales TEXT,
Order_Item_Total TEXT,
Order_Profit_Per_Order TEXT,
Order_Region TEXT,
Order_State TEXT,
Order_Status TEXT,
Order_Zipcode TEXT,
Product_Card_Id TEXT,
Product_Category_Id TEXT,
Product_Image TEXT,
Product_Name TEXT,
Product_Price TEXT,
Product_Status TEXT,
Shipping_Date TEXT,
Shipping_Mode TEXT,
Delay_Days TEXT
);

SHOW TABLES;

DESCRIBE trackdel_data;

LOAD DATA LOCAL INFILE 'C:/Users/tanis/Desktop/TrackDel/TrackDel_Cleaned.csv'
INTO TABLE trackdel_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT COUNT(*) AS total_rows
FROM trackdel_data;

SELECT COUNT(*) AS Total_Orders
FROM trackdel_data;

SELECT Delivery_Status, COUNT(*)
FROM trackdel_data
GROUP BY Delivery_Status;

SELECT Shipping_Mode, COUNT(*)
FROM trackdel_data
GROUP BY Shipping_Mode;

SELECT Order_Status, COUNT(*)
FROM trackdel_data
GROUP BY Order_Status;

SELECT AVG(CAST(Delay_Days AS SIGNED))
FROM trackdel_data;

SELECT Order_Region, COUNT(*)
FROM trackdel_data
GROUP BY Order_Region;

SELECT SUM(CAST(Sales AS DECIMAL(12,2)))
FROM trackdel_data;