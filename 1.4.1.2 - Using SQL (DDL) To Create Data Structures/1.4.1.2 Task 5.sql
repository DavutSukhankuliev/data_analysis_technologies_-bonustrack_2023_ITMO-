CREATE TABLE Bank_account
(
    Account     INTEGER PRIMARY KEY,
    Pass_number CHAR(10)       NOT NULL,
    Open_Date   DATE           NOT NULL,
    Close_Date  DATE,
    Total_money NUMERIC(30, 2) NOT NULL
)