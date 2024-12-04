-- Project Part 3
-- By: Brian Hartman, Carson Bartholic

-- Populates all tables with the given data
-- Insert data into the Toppings table
    INSERT INTO Toppings
    VALUES (1, 'Pepperoni',            1.25, 0.2, 100, 2, 2.27, 3.5, 4.5);

    INSERT INTO Toppings
    VALUES (2, 'Sausage',              1.25, 0.15, 100, 2.5, 3, 3.5, 4.25);

    INSERT INTO Toppings
    VALUES (3, 'Ham',                  1.5, 0.15, 78, 2, 2.5, 3.25, 4);

    INSERT INTO Toppings
    VALUES (4, 'Chicken',              1.75, 0.25, 56, 1.5, 2, 2.25, 3);

    INSERT INTO Toppings
    VALUES (5, 'Green Pepper',         0.5, 0.02, 79, 1, 1.5, 2, 2.5);

    INSERT INTO Toppings
    VALUES (6, 'Onion',                0.5, 0.02, 85, 1, 1.5, 2, 2.75);

    INSERT INTO Toppings
    VALUES (7, 'Roma Tomato',          0.75, 0.03, 86, 2, 3, 3.5, 4.5);

    INSERT INTO Toppings
    VALUES (8, 'Mushrooms',            0.75, 0.1, 52, 1.5, 2, 2.5, 3);

    INSERT INTO Toppings
    VALUES (9, 'Black Olives',         0.6, 0.1, 39, 0.75, 1, 1.5, 2);

    INSERT INTO Toppings
    VALUES (10, 'Pineapple',            1, 0.25, 15, 1, 1.25, 1.75, 2);

    INSERT INTO Toppings
    VALUES (11, 'Jalapenos',            0.5, 0.05, 64, 0.5, 0.75, 1.25, 1.75);

    INSERT INTO Toppings
    VALUES (12, 'Banana Peppers',       0.5, 0.05, 36, 0.6, 1, 1.3, 1.75);

    INSERT INTO Toppings
    VALUES (13, 'Regular Cheese',       1.5, 0.12, 250, 2, 3.5, 5, 7);

    INSERT INTO Toppings
    VALUES (14, 'Four Cheese Blend',    2, 0.15, 150, 2, 3.5, 5, 7);

    INSERT INTO Toppings
    VALUES (15, 'Feta Cheese',          2, 0.18, 75, 1.75, 3, 4, 5.5);

    INSERT INTO Toppings
    VALUES (16, 'Goat Cheese',          2, 0.2, 54, 1.6, 2.75, 4, 5.5);

    INSERT INTO Toppings
    VALUES (17, 'Bacon',                1.5, 0.25, 89, 1, 1.5, 2, 3);

-- Insert data into the Discounts table
    INSERT INTO Discounts 
    VALUES (1, 'employee',             15, NULL);

    INSERT INTO Discounts 
    VALUES (2, 'Lunch Special Medium', NULL, 1);

    INSERT INTO Discounts 
    VALUES (3, 'Lunch Special Large',  NULL, 2);

    INSERT INTO Discounts 
    VALUES (4, 'Specialty Pizza',      NULL, 1.5);

    INSERT INTO Discounts 
    VALUES (5, 'Gameday special',      20, NULL);

-- Insert data into the BasePizza table
    INSERT INTO BasePizza
    VALUES (1, 'small', 'Thin', 3, 0.5);

    INSERT INTO BasePizza
    VALUES (2, 'small', 'Original', 3, 0.75);

    INSERT INTO BasePizza
    VALUES (3, 'small', 'Pan', 3.5, 1);

    INSERT INTO BasePizza
    VALUES (4, 'small', 'Gluten-Free', 4, 2);

    INSERT INTO BasePizza
    VALUES (5, 'medium', 'Thin', 5, 1);

    INSERT INTO BasePizza
    VALUES (6, 'medium', 'Original', 5, 1.5);

    INSERT INTO BasePizza
    VALUES (7, 'medium', 'Pan', 6, 2.25);

    INSERT INTO BasePizza
    VALUES (8, 'medium', 'Gluten-Free', 6.25, 3);

    INSERT INTO BasePizza
    VALUES (9, 'Large', 'Thin', 8, 1.25);

    INSERT INTO BasePizza
    VALUES (10, 'Large', 'Original', 8, 2);

    INSERT INTO BasePizza
    VALUES (11, 'Large', 'Pan', 9, 3);

    INSERT INTO BasePizza
    VALUES (12, 'Large', 'Gluten-Free', 9.5, 4);

    INSERT INTO BasePizza
    VALUES (13, 'X-Large', 'Thin', 10, 2);

    INSERT INTO BasePizza
    VALUES (14, 'X-Large', 'Original', 10, 3);

    INSERT INTO BasePizza
    VALUES (15, 'X-Large', 'Pan', 11.5, 4.5);

    INSERT INTO BasePizza
    VALUES (16, 'X-Large', 'Gluten-Free', 12.5, 6);


-- INSERTING ORDERS
-- Order 1 (1 Pizza, DineIn, three seats)
    -- Insert into Orders table
    INSERT INTO Orders (OrderID, TotalPriceToCustomer, TotalCostToCompany, OrderStatus, TimeStamp)
    VALUES (1, 13.50, 3.68, 'Completed', '2024-03-05 12:03:00');

    -- Insert into Pizza table
    INSERT INTO Pizza (PizzaID, BasePizzaID, PizzaCount, Price, CompanyCost, containedInOrder)
    VALUES (1, 9, 1, 13.50, 3.68, 1);

    -- Insert into OnPizza table for toppings
    INSERT INTO OnPizza (PizzaID, ToppingID, Multiplier)
    VALUES (1, 13, 2);  -- Extra Cheese

    INSERT INTO OnPizza (PizzaID, ToppingID, Multiplier)
    VALUES (1, 1, 1);   -- Pepperoni

    INSERT INTO OnPizza (PizzaID, ToppingID, Multiplier)
    VALUES (1, 2, 1);   -- Sausage

    -- Apply discount to the order
    INSERT INTO Apply_Discount_Order (DiscountID, OrderID)
    VALUES (3, 1);  -- Lunch Special Large

    -- Insert into DineIn table
    INSERT INTO DineIn (OrderID, TableNumber)
    VALUES (1, 14);

    -- Insert into SeatNumber table
    INSERT INTO SeatNumber (OrderID, SeatNumber)
    VALUES (1, 1);

    INSERT INTO SeatNumber (OrderID, SeatNumber)
    VALUES (1, 2);

    INSERT INTO SeatNumber (OrderID, SeatNumber)
    VALUES (1, 3);

-- Order 2 (1 Pizza, DineIn, one seats + 1 Pizza, DineIn, one seat)
    -- First Order: Table 4, Seat 1
    INSERT INTO Orders (OrderID, TotalPriceToCustomer, TotalCostToCompany, OrderStatus, TimeStamp)
    VALUES (2, 10.60, 3.23, 'Completed', '2024-03-03 12:05:00');

    -- Pizza for First Order
    INSERT INTO Pizza (PizzaID, BasePizzaID, PizzaCount ,Price, CompanyCost, containedInOrder)
    VALUES (2, 7, 1 ,10.60, 3.23, 2);

    -- Toppings for First Pizza
    INSERT INTO OnPizza (PizzaID, ToppingID, Multiplier) VALUES (2, 15, 1);  -- Feta Cheese
    INSERT INTO OnPizza (PizzaID, ToppingID, Multiplier) VALUES (2, 9, 1);  -- Black Olives
    INSERT INTO OnPizza (PizzaID, ToppingID, Multiplier) VALUES (2, 7, 1);  -- Roma Tomatoes
    INSERT INTO OnPizza (PizzaID, ToppingID, Multiplier) VALUES (2, 8, 1);  -- Mushrooms
    INSERT INTO OnPizza (PizzaID, ToppingID, Multiplier) VALUES (2, 12, 1);  -- Banana Peppers

    -- Apply Discounts for First Order
    INSERT INTO Apply_Discount_Order (DiscountID, OrderID) VALUES (2, 2);  -- Lunch Special Medium
    INSERT INTO Apply_Discount_Order (DiscountID, OrderID) VALUES (4, 2);  -- Specialty Pizza

    -- DineIn for First Order
    INSERT INTO DineIn (OrderID, TableNumber) VALUES (2, 4);

    -- Seat Number for First Order
    INSERT INTO SeatNumber (OrderID, SeatNumber) VALUES (2, 1);

    -- Second Order: Table 4, Seat 2
    INSERT INTO Orders (OrderID, TotalPriceToCustomer, TotalCostToCompany, OrderStatus, TimeStamp)
    VALUES (3, 6.75, 1.40, 'Completed', '2024-03-03 12:05:00');

    -- Pizza for Second Order
    INSERT INTO Pizza (PizzaID, BasePizzaID, PizzaCount, Price, CompanyCost, containedInOrder)
    VALUES (3, 2, 1 ,6.75, 1.40, 3);

    -- Toppings for Second Pizza
    INSERT INTO OnPizza (PizzaID, ToppingID, Multiplier) VALUES (3, 13, 1);  -- Regular Cheese
    INSERT INTO OnPizza (PizzaID, ToppingID, Multiplier) VALUES (3, 4, 1);  -- Chicken
    INSERT INTO OnPizza (PizzaID, ToppingID, Multiplier) VALUES (3, 12, 1);  -- Banana Peppers

    -- Apply Discount for Second Order
    INSERT INTO Apply_Discount_Order (DiscountID, OrderID) VALUES (2, 3);  -- Lunch Special Medium

    -- DineIn for Second Order
    INSERT INTO DineIn (OrderID, TableNumber) VALUES (3, 4);

    -- Seat Number for Second Order
    INSERT INTO SeatNumber (OrderID, SeatNumber) VALUES (3, 2);

-- Order 3 (6 Pizza, Pickup)
    INSERT INTO Customer (CustomerID, FirstName, LastName, Phone)
    VALUES (1, 'Andrew', 'Wilkes-Krier', '740-254-5861');

    -- Insert Order Data
    INSERT INTO Orders
    VALUES (4, 6 * 10.75, 6 * 3.30, '2024-03-03 21:30:00' ,'Completed');
    
    -- Base Pizza: Large, Original Crust
    INSERT INTO Pizza (PizzaID, BasePizzaID, PizzaCount, Price, CompanyCost, containedInOrder)
    VALUES (4, 10, 6 ,10.75, 3.30, 4);

    -- Add toppings:
    INSERT INTO OnPizza (PizzaID, ToppingID, Multiplier)
    VALUES  (4, 1, 1) -- Pepperoni
            (4, 13, 1); -- Regular Cheese


    -- Insert Pickup Data
    INSERT INTO Pickup (OrderID, PlacedBy)
    VALUES (4, 1);

-- Order 4 (3 Pizzas, Delivery)
    -- Add address for Andrew
    UPDATE Customer
    SET HouseNumber = '115',
        Street ='Party Blvd',
        City ='Athens',
        State ='OH',
        ZipCode = '45791'
    WHERE FirstName = 'Andrew' AND LastName = 'Wilkes-Krier';

    -- Create Order
    INSERT INTO Orders
    VALUES (5, ((14.50)+(17)+(14)),((5.59)+(5.59)+(5.68)) , '2024-03-05 19:11:00' ,'Completed');

    INSERT INTO Delivery (OrderID, PlacedBy)
    VALUES (5, 1);

    -- Add Pizzas
    INSERT INTO Pizza (PizzaID, BasePizzaID, PizzaCount, Price, CompanyCost, containedInOrder)
    VALUES (5, 14, 1, 14.50, 5.59, 5),
           (6, 14, 1, 17, 5.59, 5),
           (7, 14, 1, 14, 5.68, 5);
    
    -- Add Toppings
    INSERT INTO OnPizza (PizzaID, ToppingID, Multiplier)
    VALUES  (5, 14, 1), -- FourCheese
            (5, 1, 1),  -- Pep
            (5, 2, 1),  -- Sausage
            (6, 14, 1), -- FourCheese
            (6, 3, 2),  -- Extra ham
            (6, 10, 2), -- Extra Pineapple
            (7, 14, 1), -- FourCheese
            (7, 11, 1), -- jalapenos
            (7, 17, 1); -- Bacon

    -- Add Discounts
    INSERT INTO Apply_Discount_Order (DiscountID, OrderID)
    VALUES  (5, 5), -- Gameday special
            (4, 5); -- Specialty Pizza

-- Order 5 (1 Pizza, Pickup)
    -- Add Customer
    INSERT INTO Customer (CustomerID, FirstName, LastName, Phone)
    VALUES (2, 'Matt', 'Engers', '740-474-9953');

    -- Add order
    INSERT INTO Orders
    VALUES (6, 16.85, 7.85, '2024-03-02 17:30:00' ,'Completed');

    -- Add Pickup
    INSERT INTO Pickup (OrderID, PlacedBy)
    VALUES (6, 2);

    -- Add Pizza
    INSERT INTO Pizza (PizzaID, BasePizzaID, PizzaCount, Price, CompanyCost, containedInOrder)
    VALUES (8, 16, 1, 16.85, 7.85, 6);

    -- Add Toppings
    INSERT INTO OnPizza (PizzaID, ToppingID, Multiplier)
    VALUES  (8, 16, 1), -- Goat Cheese
            (8, 5, 1), -- Green Pepper
            (8, 6, 1), -- Onion
            (8, 7, 1), -- Roma Tomato
            (8, 8, 1), -- Mushrooms
            (8, 9, 1); -- Black Olives

    -- Add Discounts
    INSERT INTO Apply_Discount_Order (DiscountID, OrderID)
    VALUES  (4, 6); -- Specialty Pizza

-- Order 6 (1 Pizza, Pickup)
    -- Add Customer
    INSERT INTO Customer (CustomerID, FirstName, LastName, Phone, HouseNumber, Street, City, State, ZipCode)
    VALUES (3, 'Frank', 'Turner', '740-232-8944', '6745', 'Wessex St', 'Athens', 'OH', '45701');

    -- Add order 
    INSERT INTO Orders
    VALUES (7, 13.20, 3.20, '2024-03-02 17:30:00' ,'Completed');

    -- Add Pickup
    INSERT INTO Pickup (OrderID, PlacedBy)
    VALUES (7, 3);

    -- Add Pizza
    INSERT INTO Pizza (PizzaID, BasePizzaID, PizzaCount, Price, CompanyCost, containedInOrder)
    VALUES (9, 9, 1, 13.25, 3.20, 7);

    -- Add Toppings
    INSERT INTO OnPizza (PizzaID, ToppingID, Multiplier)
    VALUES  (9, 14, 1), -- Four Cheese Blend
            (9, 4, 1),  -- Chicken
            (9, 5, 1),  -- Green Pepper
            (9, 8, 1);  -- Mushrooms

    -- Add Discounts
    -- None

-- Order 7 (2 Pizzas, Delivery)
    -- Add Customer
    INSERT INTO Customer (CustomerID, FirstName, LastName, Phone, HouseNumber, Street, City, State, ZipCode)
    VALUES (4, 'Milo', 'Aukerman', '740-878-5679', '8879', 'Suburban Home', 'Athens', 'OH', '45701');

    -- Add order 
    INSERT INTO Orders
    VALUES (8, (12 + 12), (3.75 + 2.55), '2024-03-06 20:32:00' ,'Completed');

    -- Add Pickup
    INSERT INTO Delivery (OrderID, PlacedBy)
    VALUES (8, 4);

    -- Add Pizza
    INSERT INTO Pizza (PizzaID, BasePizzaID, PizzaCount, Price, CompanyCost, containedInOrder)
    VALUES (10, 9, 1, 12, 3.75, 8),
           (11, 9, 1, 12, 2.55, 8);

    -- Add Toppings
    INSERT INTO OnPizza (PizzaID, ToppingID, Multiplier)
    VALUES  (10, 14, 2), -- Four Cheese Blend (Extra)
            (11, 13, 1),  -- Regular Cheese
            (11, 1, 2);  -- Pepperoni(extra)

    -- Add Discounts
    INSERT INTO Apply_Discount_Order (DiscountID, OrderID)
    VALUES  (1, 8); -- Employee Discount