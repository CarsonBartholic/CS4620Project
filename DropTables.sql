-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Drop the table for Apply_Discount_Order
DROP TABLE IF EXISTS Apply_Discount_Order;

-- Drop the table for Apply_Discount_Pizza
DROP TABLE IF EXISTS Apply_Discount_Pizza;

-- Drop the junction table for OnPizza
DROP TABLE IF EXISTS OnPizza;

-- Drop the table for SeatNumber 
DROP TABLE IF EXISTS SeatNumber;

-- Drop the table for Pickup
DROP TABLE IF EXISTS Pickup;

-- Drop the table for Delivery
DROP TABLE IF EXISTS Delivery;

-- Drop the table for DineIn
DROP TABLE IF EXISTS DineIn;

-- Drop the table for Orders
DROP TABLE IF EXISTS Orders;

-- Drop the table for Discounts
DROP TABLE IF EXISTS Discounts;

-- Drop the table for Toppings
DROP TABLE IF EXISTS Toppings;

-- Drop the table for Pizza
DROP TABLE IF EXISTS Pizza;

-- Drop the table for BasePizza
DROP TABLE IF EXISTS BasePizza;

-- Drop the table for Customer
DROP TABLE IF EXISTS Customer;

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;