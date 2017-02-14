--Mark Davis mjd85
--CS342, homework02

-- Drop current database
DROP TABLE Customer;
DROP TABLE Order;
DROP TABLE Order_Item;
DROP TABLE Item;
DROP TABLE Shipment;
DROP TABLE Warehouse;

--Exercise 5.14
CREATE TABLE Customer(
	customer_number integer NOT NULL, --primary keys should not be NULL
	customer_name varchar(40),
	city varchar(30),
	PRIMARY KEY (customer_number)
);

CREATE TABLE Order(
	order_number integer NOT NULL, --primary keys should not be NULL
	order_date date NOT NULL, --primary keys should not be NULL
	customer_number integer,
	order_amount integer,
	PRIMARY KEY (order_number),
	FOREIGN KEY (customer_number) REFERENCES Customer(customer_number) ON DELETE CASCADE --I chose DELETE CASCADE because when a customer is deleted, all the corresponding orders should be deleted as well
);

CREATE TABLE Order_Item(
	order_number integer NOT NULL, --foreign keys should not be NULL
	item_number integer NOT NULL, --foreign keys should not be NULL
	quantity integer,
	FOREIGN KEY (order_number) REFERENCES Order(order_number) ON DELETE CASCADE, -- I chose DELETE CASCADE because if a order is deleted, all the corresponding orders should be deleted as well
	FOREIGN KEY (item_number) REFERENCES Item(item_number) ON DELETE SET NULL -- I chose DELETE CASCADE because if a item is deleted, the item in the order should be set null, not deleted. That would mess up the entire order.
);

CREATE TABLE Item(
	item_number integer NOT NULL, --primary keys should not be NULL
	unit_price decimal (10,2),
	item_name varchar(40),
	PRIMARY KEY (item_number)
);

CREATE TABLE Shipment(
	order_number integer NOT NULL, --foreign keys should not be NULL
	warehouse_number integer NOT NULL, --foreign keys should not be NULL
	ship_date date,
	FOREIGN KEY (order_number) REFERENCES Order(order_number) ON DELETE CASCADE, --I chose DELETE CASCADE because if an order is canceled, the shipment should be deleted too
	FOREIGN KEY (warehouse_number) REFERENCES Warehouse(warehouse_number) ON DELETE CASCADE, --I chose DELETE CASCADE becuase if a warehouse is somehow deleted/destroyed, corresponding shipments should not have a non-existent warehouse.
);

CREATE TABLE Warehouse(
	warehouse_number integer NOT NULL,
	city varchar(30),
	PRIMARY KEY (warehouse_number)
);

INSERT INTO Customer VALUES (1, 'Mark Davis', 'Bracebridge');
INSERT INTO Customer VALUES (2, 'Batman', 'Gotham');
INSERT INTO Customer VALUES (3, 'Superman', 'Metropolis');

INSERT INTO Order VALUES (1, 2016-01-01, 1, 5);
INSERT INTO Order VALUES (2, 2015-12-12, 2, 10);
INSERT INTO Order VALUES (3, 2014-07-07, 2, 15);

INSERT INTO Order_Item VALUES (1, 5, 5);
INSERT INTO Order_Item VALUES (2, 6, 10);
INSERT INTO Order_Item VALUES (3, 7, 15);

INSERT INTO Item VALUES (5, 5.00, 'USB');
INSERT INTO Item VALUES (6, 60.00, 'Batarang');
INSERT INTO Item VALUES (7, 1000000.00, 'Batmobile');

INSERT INTO Shipment VALUES (1, 1, 2016-01-10);
INSERT INTO Shipment VALUES (2, 2, 2015-12-14);
INSERT INTO Shipment VALUES (3, 2, 2014-07-09);

INSERT INTO Warehouse VALUES (1, 'Toronto');
INSERT INTO Warehouse VALUES (2, 'Gotham');


--EXERCISE 5.20
-- A)
-- I would recommend that CIT keeps the surrogate student ID numbers. The student ID numbers are unique to each student and will never be
-- given to a future student. Social Security Numbers should not be used since that requires students to say their SSNs outloud - when at
-- the library or financial aid office - which is a privacy issue. 

-- B) 


