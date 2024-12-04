-- Project Part 4
-- By: Brian Hartman, Carson Bartholic

-- 1

-- 2
SELECT DATE(TimeStamp) AS order_date, SUM(TotalPriceToCustomer) AS total_revenue, SUM(TotalCostToCompany) AS total_expenses, (SUM(TotalPriceToCustomer) - SUM(TotalCostToCompany)) AS total_profit
FROM Orders
GROUP BY order_date
ORDER BY order_date ASC;

-- 3

-- 4 CHECK GROUP BY( ORDERID or TABLENUMBER)
SELECT COUNT(SeatNumber.SeatNumber) AS average_seat_per_order, ROUND(AVG(TotalPriceToCustomer), 2) AS average_price_per_order, SUM(DISTINCT Orders.TotalPriceToCustomer) AS total_order_price, MAX(TotalPriceToCustomer) AS max_price_per_order, MIN(TotalPriceToCustomer) AS min_price_per_order
FROM Orders JOIN DineIn ON Orders.OrderID = DineIn.OrderID JOIN SeatNumber ON DineIn.OrderID = SeatNumber.OrderID
GROUP BY DineIn.tableNumber;

-- 5

-- 6

-- 7

-- 8


-- 9

-- 10
SELECT BasePizza.CrustType, SUM(Pizza.PizzaCount) AS pizza_count, AVG(Pizza.Price) AS avg_price, AVG(Pizza.CompanyCost) AS avg_cost
FROM Pizza JOIN BasePizza ON Pizza.BasePizzaID = BasePizza.BasePizzaID
GROUP BY BasePizza.CrustType
ORDER BY pizza_count DESC;
