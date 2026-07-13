-- SQL Query to create and import data from csv files:





-- 0. Create a database

CREATE DATABASE creditcarddb;





-- 1. Create creditcard_detail table

CREATE TABLE creditcard_detail (
    Client_Num INT,
    Card_Category VARCHAR(20),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date DATE,
    Week_Num VARCHAR(20),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip VARCHAR(10),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc VARCHAR(5)
);





-- 2. Create customer_detail table

CREATE TABLE customer_detail (
    Client_Num INT,
    Customer_Age INT,
    Gender VARCHAR(5),
    Dependent_Count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    State_cd VARCHAR(50),
    Zipcode VARCHAR(20),
    Car_Owner VARCHAR(5),
    House_Owner VARCHAR(5),
    Personal_Loan VARCHAR(5),
    Contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income INT,
    Cust_Satisfaction_Score INT
);





-- 3. Copy csv data into SQL

SELECT * FROM CUSTOMER_DETAIL
SELECT * FROM CREDITCARD_DETAIL

COPY CUSTOMER_DETAIL
FROM 'D:\DOWNLOADS\01_CHROME_DOWNLOADS\01_Credit_Card_Financial_Dashboard\customer.CSV'
DELIMITER ','
CSV HEADER;


COPY CREDITCARD_DETAIL
FROM 'D:\DOWNLOADS\01_CHROME_DOWNLOADS\01_Credit_Card_Financial_Dashboard\credit_card.CSV'
DELIMITER ','
CSV HEADER;


SELECT * FROM creditcard_detail LIMIT 100;





-- 4. Insert additional data into SQL, using same COPY function

COPY CREDITCARD_DETAIL
FROM 'D:\DOWNLOADS\01_CHROME_DOWNLOADS\01_Credit_Card_Financial_Dashboard\cc_add.csv'
DELIMITER ','
CSV HEADER;


COPY CUSTOMER_DETAIL
FROM 'D:\DOWNLOADS\01_CHROME_DOWNLOADS\01_Credit_Card_Financial_Dashboard\cust_add.csv'
DELIMITER ','
CSV HEADER;