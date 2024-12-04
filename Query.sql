-- Project Part 4
-- By: Brian Hartman, Carson Bartholic

-- 1

-- 2
    SELECT DATE(TimeStamp) AS order_date, SUM(TotalPriceToCustomer) AS total_revenue, SUM(TotalCostToCompany) AS total_expenses, (SUM(TotalPriceToCustomer) - SUM(TotalCostToCompany)) AS total_profit
    FROM Orders
    GROUP BY order_date
    ORDER BY order_date ASC;

-- 3

-- 4 CHECK GROUP BY( ORDERID or TABLENUMBER?)
    SELECT COUNT(SeatNumber.SeatNumber) AS average_seat_per_order, ROUND(AVG(TotalPriceToCustomer), 2) AS average_price_per_order, SUM(DISTINCT Orders.TotalPriceToCustomer) AS total_order_price, MAX(TotalPriceToCustomer) AS max_price_per_order, MIN(TotalPriceToCustomer) AS min_price_per_order
    FROM Orders JOIN DineIn ON Orders.OrderID = DineIn.OrderID JOIN SeatNumber ON DineIn.OrderID = SeatNumber.OrderID
    GROUP BY DineIn.tableNumber;

-- 5

-- 6
    SELECT DATE(Orders.TimeStamp) AS order_date,
            
            CASE
                WHEN Delivery.OrderID IS NOT NULL THEN 'Delivery'
                WHEN Pickup.OrderID IS NOT NULL THEN 'Pickup'
                WHEN DineIn.OrderID IS NOT NULL THEN 'Dine-in'
                ELSE 'UNKNOWN'
            END AS order_type,

            -- total number of orders for a type
            COUNT(DISTINCT Orders.OrderID) AS order_count,

            -- total pizzas per type on a certain day
            SUM(Pizza.PizzaCount) AS pizza_amount,

            -- total price of all orders of a certain type on a certain day
            SUM(DISTINCT Orders.TotalPriceToCustomer) AS total_price

        FROM Orders 
        LEFT JOIN Pizza ON Orders.OrderID = Pizza.containedInOrder 
        LEFT JOIN Delivery ON Orders.OrderID = Delivery.OrderID 
        LEFT JOIN Pickup ON Orders.OrderID = Pickup.OrderID 
        LEFT JOIN DineIn ON Orders.OrderID = DineIn.OrderID
        GROUP BY order_date, order_type 
        ORDER BY order_date, order_type;

-- 7

-- 8
-- Inventory usage: For each topping, show the name and the total amount used (even if it is 0) on 
-- March 3rd. Order by Topping name. 
    SELECT Toppings.Name, coalesce(SUM((Toppings.AmountPersonal*OnPizza.Multiplier*Pizza.PizzaCount)+(Toppings.AmountMedium*OnPizza.Multiplier*Pizza.PizzaCount)+(Toppings.AmountLarge*OnPizza.Multiplier*Pizza.PizzaCount)+(Toppings.AmountXLarge*OnPizza.Multiplier*Pizza.PizzaCount)), 0) AS total_amount_used
    FROM Toppings
    LEFT JOIN OnPizza ON Toppings.ToppingID = OnPizza.ToppingID
    LEFT JOIN Pizza ON OnPizza.PizzaID = Pizza.PizzaID
    LEFT JOIN Orders ON Pizza.containedInOrder = Orders.OrderID AND (DATE(Orders.TimeStamp) = '2024-03-03')
    GROUP BY Toppings.Name
    ORDER BY Toppings.Name;

-- 9

-- 10
    SELECT BasePizza.CrustType, ROUND(SUM(Pizza.PizzaCount), 2) AS pizza_count, ROUND(AVG(Pizza.Price), 2) AS avg_price, ROUND(AVG(Pizza.CompanyCost), 2) AS avg_cost
    FROM Pizza JOIN BasePizza ON Pizza.BasePizzaID = BasePizza.BasePizzaID
    GROUP BY BasePizza.CrustType
    ORDER BY pizza_count DESC;
