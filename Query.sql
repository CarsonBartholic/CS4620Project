-- Project Part 4
-- By: Brian Hartman, Carson Bartholic

-- 1
    SELECT 
        Name AS ToppingName,
        InventoryLevel,
        FLOOR(InventoryLevel / AmountXLarge) AS MaxXLargePizzas -- Rounding down to the nearest whole number
    FROM 
        Toppings
    ORDER BY 
        ToppingName;

-- 2
    SELECT SUM(TotalPriceToCustomer) AS total_revenue, SUM(TotalCostToCompany) AS total_expenses, (SUM(TotalPriceToCustomer) - SUM(TotalCostToCompany)) AS total_profit
    FROM Orders
    GROUP BY DATE(TimeStamp)
    ORDER BY DATE(TimeStamp) ASC;

-- 3
    SELECT 
        FirstName,
        LastName,
        COUNT(O.OrderID) AS TotalOrders,
        ROUND(AVG(TotalPriceToCustomer), 2) AS AverageOrderPrice,
        SUM(TotalPriceToCustomer) AS TotalOrderPrice,
        MAX(TotalPriceToCustomer) AS MaxOrderPrice,
        MIN(TotalPriceToCustomer) AS MinOrderPrice
    FROM 
        Customer
    LEFT JOIN Delivery D ON CustomerID = D.PlacedBy
    LEFT JOIN Pickup P ON CustomerID = P.PlacedBy
    LEFT JOIN Orders O ON O.OrderID = D.OrderID OR O.OrderID = P.OrderID
    GROUP BY 
        CustomerID;

-- 4
SELECT 
    AVG(SeatCount) AS average_seat_per_order, 
    ROUND(AVG(o.TotalPriceToCustomer), 2) AS average_price_per_order, 
    SUM(DISTINCT o.TotalPriceToCustomer) AS total_order_price,
    MAX(o.TotalPriceToCustomer) AS max_price_per_order, 
    MIN(o.TotalPriceToCustomer) AS min_price_per_order
FROM (
    SELECT 
        COUNT(s.SeatNumber) AS SeatCount,
        o.OrderID
    FROM 
        SeatNumber s
    JOIN 
        Orders o ON s.OrderID = o.OrderID
    GROUP BY 
        o.OrderID
) SubQuery JOIN Orders o ON SubQuery.OrderID = o.OrderID;    

-- 5
    SELECT 
        BP.CrustType AS Crust,
        BP.Size AS PizzaSize,
        T.Name AS ToppingName,
        P.PizzaID,
        CASE 
            WHEN OP.Multiplier > 1 THEN 'Yes'
            ELSE 'No'
        END AS ExtraTopping
    FROM 
        Orders O
    INNER JOIN Delivery D ON O.OrderID = D.OrderID
    INNER JOIN Customer C ON D.PlacedBy = C.CustomerID
    INNER JOIN Pizza P ON O.OrderID = P.containedInOrder
    INNER JOIN BasePizza BP ON P.BasePizzaID = BP.BasePizzaID
    LEFT JOIN OnPizza OP ON P.PizzaID = OP.PizzaID
    LEFT JOIN Toppings T ON OP.ToppingID = T.ToppingID
    WHERE 
        O.TimeStamp = '2024-03-05 19:11:00'
        AND C.CustomerID = 1
        AND C.LastName = 'Wilkes-Krier'
        AND C.FirstName = 'Andrew'
    ORDER BY 
        P.PizzaID;

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
    SELECT 
        D.Name,
        COUNT(DO.OrderID) AS OrdersUsingDiscount,
        SUM(
            CASE
                WHEN D.PercentDiscount IS NOT NULL THEN O.TotalPriceToCustomer * D.PercentDiscount / 100
                WHEN D.DollarDiscount IS NOT NULL THEN D.DollarDiscount
                ELSE 0
            END
        ) AS TotalMoneySaved
    FROM 
        Orders O
    JOIN 
        Apply_Discount_Order DO ON O.OrderID = DO.OrderID
    JOIN 
        Discounts D ON D.DiscountID = DO.DiscountID
    GROUP BY 
        D.Name;

-- 8
    SELECT * FROM OnPizza WHERE OnPizza.ToppingID = 1;
    SELECT 
        Toppings.Name AS ToppingName, 
        SUM(
            CASE 
                WHEN DATE(Orders.TimeStamp) = '2024-03-03' THEN
                    CASE
                        WHEN Pizza.BasePizzaID IN (1, 2, 3, 4) THEN (Toppings.AmountPersonal * COALESCE(OnPizza.Multiplier, 1) * COALESCE(Pizza.PizzaCount, 1))
                        WHEN Pizza.BasePizzaID IN (5, 6, 7, 8) THEN (Toppings.AmountMedium * COALESCE(OnPizza.Multiplier, 1) * COALESCE(Pizza.PizzaCount, 1))
                        WHEN Pizza.BasePizzaID IN (9, 10, 11, 12) THEN (Toppings.AmountLarge * COALESCE(OnPizza.Multiplier, 1) * COALESCE(Pizza.PizzaCount, 1))
                        WHEN Pizza.BasePizzaID IN (13, 14, 15, 16) THEN (Toppings.AmountXLarge * COALESCE(OnPizza.Multiplier, 1) * COALESCE(Pizza.PizzaCount, 1))
                        ELSE 0
                    END
                ELSE 0
            END
        ) AS TotalAmountUsed
    FROM 
        Toppings
    LEFT JOIN 
        OnPizza ON Toppings.ToppingID = OnPizza.ToppingID
    LEFT JOIN 
        Pizza ON OnPizza.PizzaID = Pizza.PizzaID
    LEFT JOIN 
        Orders ON Pizza.containedInOrder = Orders.OrderID
    GROUP BY 
        Toppings.Name
    ORDER BY 
        Toppings.Name;

-- 9
    SELECT
        BP.Size AS PizzaSize,
        COUNT(P.PizzaID) AS TotalPizzasOrdered,
        AVG(P.Price) AS AveragePrice,
        AVG(P.Price - P.CompanyCost) AS AverageCost
    FROM
        BasePizza BP
        JOIN Pizza P ON BP.BasePizzaID = P.BasePizzaID
    GROUP BY
        BP.Size;

-- 10
    SELECT BasePizza.CrustType, ROUND(SUM(Pizza.PizzaCount), 2) AS pizza_count, ROUND(AVG(Pizza.Price), 2) AS avg_price, ROUND(AVG(Pizza.CompanyCost), 2) AS avg_cost
    FROM Pizza JOIN BasePizza ON Pizza.BasePizzaID = BasePizza.BasePizzaID
    GROUP BY BasePizza.CrustType
    ORDER BY pizza_count DESC;
