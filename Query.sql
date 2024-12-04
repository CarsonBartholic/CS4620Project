-- Project Part 4
-- By: Brian Hartman, Carson Bartholic

-- 1

-- 2
SELECT DATE(TimeStamp) AS order_date, SUM(TotalPriceToCustomer) AS total_revenue, SUM(TotalCostToCompany) AS total_expenses, (SUM(TotalPriceToCustomer) - SUM(TotalCostToCompany)) AS total_profit
FROM Orders
GROUP BY order_date
ORDER BY order_date ASC;

-- 3

-- 4
SELECT AVG() AS 
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
