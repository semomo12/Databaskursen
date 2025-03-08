--
-- Table structure for database `eshop`
--

-- drop tables
DROP TABLE IF EXISTS Inventory_Event;
DROP TABLE IF EXISTS Invoice;
DROP TABLE IF EXISTS Delivery;
DROP TABLE IF EXISTS Order_Item;
DROP TABLE IF EXISTS `Order`;
DROP TABLE IF EXISTS Stock;
DROP TABLE IF EXISTS Product_Category;
DROP TABLE IF EXISTS Category;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Customer;


-- Kundregister
CREATE TABLE Customer (
    KundID INT AUTO_INCREMENT PRIMARY KEY,
    Fornamn VARCHAR(100) NOT NULL,
    Efternamn VARCHAR(100) NOT NULL,
    Epost VARCHAR(255) NOT NULL UNIQUE,
    Adress VARCHAR(255) NOT NULL,
    Telefonnummer VARCHAR(20) NOT NULL UNIQUE
);


-- Produktregister
CREATE TABLE Product (
    ProduktID INT AUTO_INCREMENT PRIMARY KEY,
    Produktnamn VARCHAR(255) NOT NULL UNIQUE,
    Beskrivning TEXT,
    Pris DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    Lagerkvantitet INT NOT NULL DEFAULT 0
);



-- Kategori
CREATE TABLE Category (
    KategoriID INT AUTO_INCREMENT PRIMARY KEY,
    Kategorinamn VARCHAR(255) NOT NULL UNIQUE
);

-- Kopplingstabell mellan produkt och kategori
CREATE TABLE Product_Category (
    ProduktID INT NOT NULL,
    KategoriID INT NOT NULL,
    PRIMARY KEY (ProduktID, KategoriID),
    FOREIGN KEY (ProduktID) REFERENCES Product(ProduktID),
    FOREIGN KEY (KategoriID) REFERENCES Category(KategoriID)
);

--lagerregister
CREATE TABLE Stock (
    LagerID INT AUTO_INCREMENT PRIMARY KEY,
    ProduktID INT NOT NULL,
    Lagerkvantitet INT NOT NULL DEFAULT 0,
    Hyllplacering VARCHAR(100) NOT NULL,
    FOREIGN KEY (ProduktID) REFERENCES Product(ProduktID)
);



-- Orderhantering
CREATE TABLE `Order` (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    KundID INT NOT NULL,
    Orderdatum DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    OrderStatus VARCHAR(50) NOT NULL DEFAULT 'väntar', -- väntar, bearbetas, slutförd, avbruten
    Totalpris DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    FOREIGN KEY (KundID) REFERENCES Customer(KundID)
);


-- Produkter i en order
CREATE TABLE Order_Item (
    OrderradID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    ProduktID INT NOT NULL,
    Antal INT NOT NULL DEFAULT 1,
    Pris DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID),
    FOREIGN KEY (ProduktID) REFERENCES Product(ProduktID)
);


-- leveranshantering och plocklista
CREATE TABLE Delivery (
    LeveransID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    Leveransdatum DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    LeveransStatus VARCHAR(50) NOT NULL DEFAULT 'väntar', -- packad, skickad, levererad
    FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID)
);



-- fakturering
CREATE TABLE Invoice (
    FakturaID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    Faktureringsdatum DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Totalpris DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID)
);


-- lagerhändelser
CREATE TABLE Inventory_Event (
    EventID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    FakturaID INT NOT NULL,
    Eventbeskrivning TEXT,
    Eventdatum DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID),
    FOREIGN KEY (FakturaID) REFERENCES Invoice(FakturaID)
);

