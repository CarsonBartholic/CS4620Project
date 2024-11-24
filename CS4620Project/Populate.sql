-- Write your own SQL object definition here, and it'll be included in your package.
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


--Insert data into the Discounts table
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


--Insert data into the BasePizza table
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



--Populates tables related to orders
--Order 1
--Order 2
--Order 3
--Order 4
--Order 5
--Order 6
--Order 7