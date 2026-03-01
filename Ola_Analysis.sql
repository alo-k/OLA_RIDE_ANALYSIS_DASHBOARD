USE [OLA RIDE_ANALYTICS]

SELECT*FROM ola_rides

---Q1 1. Retrieve all successful bookings:
SELECT *
FROM ola_rides
WHERE Booking_Status = 'Success';

---Q2 2. Find the average ride distance for each vehicle type:
SELECT
	Vehicle_Type,AVG(RIDE_DISTANCE) AS AVG_RIDE_DISTANCE
	FROM ola_rides
	GROUP BY Vehicle_Type;

---Q3 3. Get the total number of cancelled rides by customers:
SELECT COUNT(*) AS Total_rides_cancel_by_customer
FROM ola_rides
WHERE Booking_Status = 'Canceled by Customer';

---Q4 4. List the top 5 customers who booked the highest number of rides:
SELECT TOP 5
    Customer_ID,
    COUNT(*) AS total_rides
FROM ola_rides
GROUP BY Customer_ID
ORDER BY total_rides DESC;

---Q5 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
SELECT COUNT(*) AS NO_OF_RIDES_CANCEL_BY_DRIVER
FROM ola_rides
WHERE Booking_Status = 'Canceled by Driver'
AND Canceled_Rides_by_Driver = 'Personal & Car related issue';

---Q6 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT 
    Vehicle_Type,
    MAX(Driver_Ratings) AS Max_Driver_Rating,
    MIN(Driver_Ratings) AS Min_Driver_Rating
FROM ola_rides
WHERE Vehicle_Type = 'Prime Sedan'
GROUP BY Vehicle_Type;

---Q7 7. Retrieve all rides where payment was made using UPI:
SELECT *
FROM ola_rides
WHERE Payment_Method = 'UPI';

---Q8 8. Find the average customer rating per vehicle type:
SELECT 
    Vehicle_Type,
    AVG(Customer_Rating) AS AVG_CUSTOMER_RATING
FROM ola_rides
WHERE Customer_Rating IS NOT NULL
GROUP BY Vehicle_Type;

---Q9 9. Calculate the total booking value of rides completed successfully:
SELECT 
    SUM(Booking_Value) AS TOTAL_BOOKING_VALUE
FROM ola_rides
WHERE Booking_Status = 'Success';

---Q10 10. List all incomplete rides along with the reason
SELECT 
    Booking_ID,
    Vehicle_Type,
    Incomplete_Rides,
    Incomplete_Rides_Reason
FROM ola_rides
WHERE Incomplete_Rides = 'Yes';