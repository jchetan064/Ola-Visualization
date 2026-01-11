-- 1. Retrieve all successful bookings:
create view Successful_Bookings as select * from Bookings where Booking_Status = 'Success' 
go

select * from Successful_Bookings


-- 2. Find the average ride distance for each vehicle type:
create view Ride_Distance_For_Each_Vehicle as select Vehicle_Type , AVG(Ride_Distance) as Avg_distance from Bookings group by Vehicle_Type
go

select * from Ride_Distance_For_Each_Vehicle;


-- 3. Get the total number of cancelled rides by customers:
create view Canceled_Rides_By_Customers as select COUNT(*) Canceled_Ride from Bookings where Booking_Status = 'Canceled by Customer';
Go

select * from Canceled_Rides_By_Customers;


-- 4. List the top 5 customers who booked the highest number of rides:
create view Top_5_Customers as select top 5 Customer_ID , count(booking_id) Total_Rides from Bookings group by Customer_ID order by Total_Rides desc;
go

select * from Top_5_Customers;


-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view Ride_Canceled_By_Drivers_P_C_Issues as select COUNT(*) Canceled_Ride from Bookings where Canceled_Rides_by_Driver = 'Personal & Car related issue';

select * from Ride_Canceled_By_Drivers_P_C_Issues;


-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view Max_Min_Driver_Rating as select MAX(Driver_Ratings) Maximum_Rating , MIN(Driver_Ratings) Minimum_Rating from Bookings where Vehicle_Type = 'prime sedan';

select * from Max_Min_Driver_Rating;


-- 7. Retrieve all rides where payment was made using UPI:
create view UPI_Payments_Ride as select * from Bookings where Payment_Method = 'UPI';

select * from UPI_Payments_Ride;


-- 8. Find the average customer rating per vehicle type:
create view Average_Customer_Rating as select Vehicle_Type , round(AVG(Customer_Rating),2) Avg_Customer_Rating from Bookings group by Vehicle_Type

select * from Average_Customer_Rating;


-- 9. Calculate the total booking value of rides completed successfully:
create view Total_Successful_Ride_Value as select SUM(Booking_Value) Total_Booking_Value from Bookings where Booking_Status = 'Success'

select * from Total_Successful_Ride_Value


-- 10. List all incomplete rides along with the reason:
create view Incomplete_Ride_Reason as select Booking_ID , Incomplete_Rides_Reason from Bookings where Incomplete_Rides = 1

select * from Incomplete_Ride_Reason
