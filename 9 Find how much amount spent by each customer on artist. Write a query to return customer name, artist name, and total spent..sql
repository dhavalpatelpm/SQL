# Find how much amount spent by each customer on artist. 
# Write a query to return customer name, artist name, and total spent.

USE MUSIC_DATABASE;

SHOW TABLES;

SELECT * FROM CUSTOMER;

SELECT 
    CONCAT(customer.first_name, ' ', customer.last_name) AS customer_name,
    artist.name AS artist_name,
    SUM(invoice_line.unit_price * invoice_line.quantity) AS total_spent
FROM customer
JOIN invoice 
    ON customer.customer_id = invoice.customer_id
JOIN invoice_line 
    ON invoice.invoice_id = invoice_line.invoice_id
JOIN track 
    ON invoice_line.track_id = track.track_id
JOIN album 
    ON track.album_id = album.album_id
JOIN artist 
    ON album.artist_id = artist.artist_id
GROUP BY 
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    artist.artist_id,
    artist.name
ORDER BY total_spent DESC;

