-- 1. 
SELECT 
    Name AS ToppingName,
    InventoryLevel,
    FLOOR(InventoryLevel / AmountXLarge) AS MaxXLargePizzas -- Rounding down to the nearest whole number
FROM 
    Toppings
ORDER BY 
    ToppingName;

-- 2.
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

-- 3.
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
INNER JOIN Pizza P ON O.OrderID = D.OrderID
INNER JOIN BasePizza BP ON P.BasePizzaID = BP.BasePizzaID
LEFT JOIN OnPizza OP ON P.PizzaID = OP.PizzaID
LEFT JOIN Toppings T ON OP.ToppingID = T.ToppingID
WHERE 
    O.TimeStamp = '2024-03-05 19:11:00'
    AND C.CustomerID = 1
    -- AND C.LastName = 'Wilkes-Krier'
    -- AND C.FirstName = 'Andrew'
    AND P.PizzaID IN (5, 6, 7)  -- Only the pizzas inserted
ORDER BY 
    P.PizzaID;

-- 4.
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

-- 5.
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

