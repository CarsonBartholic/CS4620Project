-- Table: BasePizza
CREATE TABLE BasePizza (
    BasePizzaID INT PRIMARY KEY,
    Size VARCHAR(50) NOT NULL,
    CrustType VARCHAR(50) NOT NULL,
    BasePrice DECIMAL(10, 2) NOT NULL
    BaseCompanyCost DECIMAL(10, 2) NOT NULL,
);

-- Table: Pizza
CREATE TABLE Pizza (
    PizzaID INT PRIMARY KEY,
    Price DECIMAL(10, 2) NOT NULL,
    CompanyCost DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (PizzaID) REFERENCES BasePizza(BasePizzaID)
);

-- Table: Toppings
CREATE TABLE Toppings (
    ToppingID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    CompanyCost DECIMAL(10, 2) NOT NULL,
    InventoryLevel INT NOT NULL,
    AmountPersonal DECIMAL(10, 2),
    AmountMedium DECIMAL(10, 2),
    AmountLarge DECIMAL(10, 2),
    AmountXLarge DECIMAL(10, 2)
);


-- Table: Contains (junction table for Pizza and Toppings)
CREATE TABLE Contains (
    PizzaID INT NOT NULL,
    ToppingID INT NOT NULL,
    PRIMARY KEY (PizzaID, ToppingID),
    FOREIGN KEY (PizzaID) REFERENCES Pizza(PizzaID),
    FOREIGN KEY (ToppingID) REFERENCES Toppings(ToppingID)
);

-- Table: Discounts
CREATE TABLE Discounts (
    DiscountID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
    PercentDiscount INT,
    DollarDiscount DECIMAL(3, 2),
);

-- Table: Apply (junction table for Discounts and Pizza)
CREATE TABLE Apply_Discount_Pizza (
    DiscountID INT NOT NULL,
    PizzaID INT NOT NULL,
    PRIMARY KEY (DiscountID, PizzaID),
    FOREIGN KEY (DiscountID) REFERENCES Discounts(DiscountID),
    FOREIGN KEY (PizzaID) REFERENCES Pizza(PizzaID)
);

-- Table: Apply (junction table for Discounts and Orders)
CREATE TABLE Apply_Discount_Order (
    DiscountID INT NOT NULL,
    OrderID INT NOT NULL,
    PRIMARY KEY (DiscountID, OrderID),
    FOREIGN KEY (DiscountID) REFERENCES Discounts(DiscountID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Table: Orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    TotalPriceToCustomer DECIMAL(10, 2) NOT NULL,
    TotalCostToCompany DECIMAL(10, 2) NOT NULL,
    TimeStamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    OrderStatus VARCHAR(50)
);

-- Table: DineIn
CREATE TABLE DineIn (
    OrderID INT PRIMARY KEY,
    TableNumber INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Table: Delivery
CREATE TABLE Delivery (
    OrderID INT PRIMARY KEY,
    PlacedBy INT FOREIGN KEY,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (PlacedBy) REFERENCES Customer(CustomerID)
);

-- Table: Pickup
CREATE TABLE Pickup (
    OrderID INT PRIMARY KEY,
    PlacedBy INT FOREIGN KEY,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (PlacedBy) REFERENCES Customer(CustomerID)
);

-- Table: SeatNumber (junction table for DineIn and Seats)
CREATE TABLE SeatNumber (
    OrderID INT NOT NULL,
    SeatNumber INT NOT NULL,
    PRIMARY KEY (OrderID, SeatNumber),
    FOREIGN KEY (OrderID) REFERENCES DineIn(OrderID)
);

-- Table: Customer
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    MiddleName VARCHAR(50),
    LastName VARCHAR(50) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    HouseNumber VARCHAR(10),
    Street VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(20),
    ZipCode VARCHAR(10)
);
