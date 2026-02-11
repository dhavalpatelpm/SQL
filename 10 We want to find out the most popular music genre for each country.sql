# We want to find out the most popular music genre for each country. 
# We determine the most popular genre as the genre with the highest amount of purchases. 
# Write a query that returns each country along with its top genre. 
# For countries where the maximum number of purchases is shared, return all genres.

USE MUSIC_DATABASE;

WITH genre_purchases AS (
    SELECT 
        customer.country,
        genre.name AS genre_name,
        COUNT(invoice_line.invoice_line_id) AS purchase_count
    FROM customer
    JOIN invoice 
        ON customer.customer_id = invoice.customer_id
    JOIN invoice_line 
        ON invoice.invoice_id = invoice_line.invoice_id
    JOIN track 
        ON invoice_line.track_id = track.track_id
    JOIN genre 
        ON track.genre_id = genre.genre_id
    GROUP BY 
        customer.country,
        genre.genre_id,
        genre.name
)

SELECT 
    country,
    genre_name,
    purchase_count
FROM (
    SELECT *,
           RANK() OVER (PARTITION BY country 
                        ORDER BY purchase_count DESC) AS rnk
    FROM genre_purchases
) ranked
WHERE rnk = 1
ORDER BY country;


