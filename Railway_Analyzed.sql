SELECT * FROM "4_Railway_Buisness";

-- This is your SQL KPI query.

SELECT
    COUNT(*) AS total_bookings,
    SUM("Number of Passengers") AS total_passengers,
    ROUND(AVG(("Is Confirmed")::int) * 100, 2) AS confirmation_rate,
    ROUND(AVG(("Was Waitlisted")::int) * 100, 2) AS waitlist_rate,
    ROUND(AVG("Seat Availability"), 2) AS avg_seat_availability,
    ROUND(AVG("Booking Lead Time"), 2) AS avg_booking_lead_time
FROM "4_Railway_Buisness";

-- How are bookings distributed between Confirmed, RAC and Waitlisted?

SELECT "Current Status",
	COUNT(*) AS total_bookings,
	ROUND( COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),2) AS percentage
	FROM "4_Railway_Buisness"
	GROUP BY "Current Status"
	ORDER BY total_bookings DESC;

-- Confirmation by Travel Class

SELECT
    "Class of Travel",
    COUNT(*) AS bookings,
    ROUND(AVG("Is Confirmed") * 100, 2) AS confirmation_rate,
    ROUND(AVG(("Was Waitlisted")::int) * 100, 2) AS waitlist_rate
FROM "4_Railway_Buisness"
GROUP BY "Class of Travel"
ORDER BY confirmation_rate DESC;

-- Confirmation by Quota

SELECT
    "Quota",
    COUNT(*) AS bookings,
    ROUND(AVG("Is Confirmed") * 100, 2) AS confirmation_rate,
   ROUND(AVG(("Was Waitlisted")::int) * 100, 2) AS waitlist_rate
FROM "4_Railway_Buisness"
GROUP BY "Quota"
ORDER BY confirmation_rate DESC; 

-- Confirmation by Booking Channel

SELECT
    "Booking Channel",
    COUNT(*) AS bookings,
    ROUND(AVG("Is Confirmed") * 100, 2) AS confirmation_rate,
    ROUND(AVG(("Was Waitlisted")::int) * 100, 2) AS waitlist_rate
FROM "4_Railway_Buisness"
GROUP BY "Booking Channel"
ORDER BY confirmation_rate DESC;

-- Which months generate the highest booking demand?

SELECT
    "Journey Month",
    COUNT(*) AS total_bookings,
    SUM("Number of Passengers") AS total_passengers,
    ROUND(AVG("Is Confirmed") * 100, 2) AS confirmation_rate,
    ROUND(AVG(("Was Waitlisted")::int) * 100, 2) AS waitlist_rate
FROM "4_Railway_Buisness"
GROUP BY "Journey Month"
ORDER BY total_bookings DESC;

-- Top 10 Trains by Demand

SELECT
    "Train Number",
    COUNT(*) AS total_bookings,
    SUM("Number of Passengers") AS total_passengers,
    ROUND(AVG("Seat Availability"), 2) AS avg_seat_availability,
    ROUND(AVG("Is Confirmed") * 100, 2) AS confirmation_rate
FROM "4_Railway_Buisness"
GROUP BY "Train Number"
ORDER BY total_bookings DESC
LIMIT 10;

-- Which routes have the highest booking demand, and how do passengers, availability, and confirmation look on those routes?

SELECT
    "Route",
    COUNT(*) AS total_bookings,
    SUM("Number of Passengers") AS total_passengers,
    ROUND(AVG("Seat Availability"), 2) AS avg_seat_availability,
    ROUND(AVG("Is Confirmed") * 100, 2) AS confirmation_rate,
    ROUND(AVG(("Was Waitlisted")::int) * 100, 2) AS waitlist_rate
FROM "4_Railway_Buisness"
GROUP BY "Route"
ORDER BY total_bookings DESC
LIMIT 10;

-- Top Routes by Passenger Demand

SELECT
    "Route",
    COUNT(*) AS total_bookings,
    SUM("Number of Passengers") AS total_passengers,
    ROUND(AVG("Seat Availability"), 2) AS avg_seat_availability
FROM "4_Railway_Buisness"
GROUP BY "Route"
ORDER BY total_passengers DESC
LIMIT 10;

-- How serious is waitlisting, and what happens to confirmation among waitlisted bookings?

SELECT
    "Was Waitlisted",
    COUNT(*) AS total_bookings,
    ROUND(AVG("Is Confirmed") * 100, 2) AS confirmation_rate
FROM "4_Railway_Buisness"
GROUP BY "Was Waitlisted"
ORDER BY "Was Waitlisted";

SELECT
    "Waitlist Category",
    COUNT(*) AS total_bookings,
    ROUND(AVG("Waitlist Position"), 2) AS avg_waitlist_position,
    ROUND(AVG("Is Confirmed") * 100, 2) AS confirmation_rate
FROM "4_Railway_Buisness"
WHERE "Was Waitlisted" ::int = 1
GROUP BY "Waitlist Category"
ORDER BY avg_waitlist_position;

-- Peak vs Non-Peak Business Analysis

SELECT
    "Holiday or Peak Season",
    COUNT(*) AS total_bookings,
    SUM("Number of Passengers") AS total_passengers,
    ROUND(AVG("Is Confirmed") * 100, 2) AS confirmation_rate,
    ROUND(AVG(("Was Waitlisted")::int) * 100, 2) AS waitlist_rate,
    ROUND(AVG("Seat Availability"), 2) AS avg_seat_availability
FROM "4_Railway_Buisness"
GROUP BY "Holiday or Peak Season"
ORDER BY total_bookings DESC;

-- Which journey months have the highest booking and passenger demand, and how does confirmation/waitlisting look in each month?

-- Monthly Demand Analysis

SELECT
    "Journey Month",
    COUNT(*) AS total_bookings,
    SUM("Number of Passengers") AS total_passengers,
    ROUND(AVG("Is Confirmed") * 100, 2) AS confirmation_rate,
    ROUND(AVG("Was Waitlisted"::int) * 100, 2) AS waitlist_rate,
    ROUND(AVG("Seat Availability"), 2) AS avg_seat_availability
FROM "4_Railway_Buisness"
GROUP BY "Journey Month"
ORDER BY total_bookings DESC;

-- Then get the top 5 months

SELECT
    "Journey Month",
    COUNT(*) AS total_bookings,
    SUM("Number of Passengers") AS total_passengers,
    ROUND(AVG("Is Confirmed") * 100, 2) AS confirmation_rate,
    ROUND(AVG("Was Waitlisted"::int) * 100, 2) AS waitlist_rate
FROM "4_Railway_Buisness"
GROUP BY "Journey Month"
ORDER BY total_bookings DESC
LIMIT 5;

--October has the highest bookings: 2,563
--March, August, December, January, July, and May each have 2,542 bookings

-- Which trains have high passenger demand, and how are their confirmation and seat availability?

-- Train Performance Analysis

SELECT
    "Train Number",
    COUNT(*) AS total_bookings,
    SUM("Number of Passengers") AS total_passengers,
    ROUND(AVG("Seat Availability"), 2) AS avg_seat_availability,
    ROUND(AVG("Is Confirmed") * 100, 2) AS confirmation_rate,
    ROUND(AVG("Was Waitlisted"::int) * 100, 2) AS waitlist_rate
FROM "4_Railway_Buisness"
GROUP BY "Train Number"
HAVING COUNT(*) >= 10
ORDER BY total_passengers DESC
LIMIT 10;

-- Top Trains by Booking Volume

-- Top 10 Trains by Booking Volume

SELECT
    "Train Number",
    COUNT(*) AS total_bookings,
    SUM("Number of Passengers") AS total_passengers,
    ROUND(AVG("Seat Availability"), 2) AS avg_seat_availability,
    ROUND(AVG("Is Confirmed") * 100, 2) AS confirmation_rate
FROM "4_Railway_Buisness"
GROUP BY "Train Number"
HAVING COUNT(*) >= 10
ORDER BY total_bookings DESC
LIMIT 10;