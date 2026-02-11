# Who is the best customer? 
# The customer who has spent the most money will be declared the best customer, 
# Write a query that returns the person who has spent the most money.

USE MUSIC_DATABASE;

SHOW TABLES;

SELECT * FROM CUSTOMER
WHERE CUSTOMER_ID = 42; -- DID NOT FOUND ANY SO MOVING TO INVOICES

SELECT * FROM INVOICE; -- GOT SOME HINT HERE LIKE THE CUSTOMER ID SO THAT WE CAN FETCH THE DETAILS\

SELECT CUSTOMER_ID, TOTAL
FROM INVOICE
ORDER BY TOTAL DESC;

# OR

SELECT 
    customer.Customer_Id,
    customer.First_Name,
    customer.Last_Name,
    SUM(invoice.Total) AS TotalSpent
FROM customer
JOIN invoice
    ON customer.Customer_Id = invoice.Customer_Id
GROUP BY 
    customer.Customer_Id,
    customer.First_Name,
    customer.Last_Name
ORDER BY TotalSpent DESC
LIMIT 1;

--
SELECT * FROM INVOICE
ORDER BY CUSTOMER_ID ASC;

--
SELECT CUSTOMER_ID, SUM(TOTAL)
FROM INVOICE 
GROUP BY CUSTOMER_ID
ORDER BY SUM(TOTAL) DESC;

SELECT * 
FROM CUSTOMER
WHERE CUSTOMER_ID = 5;



