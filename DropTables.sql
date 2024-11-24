-- Drop the junction table for Apply_Discount_Order (depends on Discounts and Orders)
DROP TABLE IF EXISTS Apply_Discount_Order;

-- Drop the junction table for Apply_Discount_Pizza (depends on Discounts and Pizza)
DROP TABLE IF EXISTS Apply_Discount_Pizza;

-- Drop the junction table for Contains (depends on Pizza and Toppings)
DROP TABLE IF EXISTS OnPizza;

-- Drop the SeatNumber table (depends on DineIn)
DROP TABLE IF EXISTS SeatNumber;

-- Drop the Pickup table (depends on Orders and Customer)
DROP TABLE IF EXISTS Pickup;

-- Drop the Delivery table (depends on Orders and Customer)
DROP TABLE IF EXISTS Delivery;

-- Drop the DineIn table (depends on Orders)
DROP TABLE IF EXISTS DineIn;

-- Drop the Orders table (dependent tables need to be dropped first)
DROP TABLE IF EXISTS Orders;

-- Drop the Discounts table
DROP TABLE IF EXISTS Discounts;

-- Drop the Toppings table
DROP TABLE IF EXISTS Toppings;

-- Drop the Pizza table
DROP TABLE IF EXISTS Pizza;

-- Drop the BasePizza table
DROP TABLE IF EXISTS BasePizza;

-- Drop the Customer table
DROP TABLE IF EXISTS Customer;

