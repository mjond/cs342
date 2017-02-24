--Mark Davis
--homework 3, cs342
--February 22, 2017

drop table PartsOrdered;
drop table Orders;
drop table Customer;
drop table Employee;
drop table Part;


create table Employee (
	employeeId integer PRIMARY KEY,
	ZIP integer,
	firstName varchar(20),
	lastName varchar(20)
);

create table Customer (
	customerId integer PRIMARY KEY,
	ZIP integer,
	firstName varchar(20),
	lastName varchar(20)
);


create table Part (
	partId integer PRIMARY KEY,
	partName varchar(25),
	price integer,
	quantity integer
);

create table Orders (
	orderId integer PRIMARY KEY,
	customerId integer NOT NULL,
	employeeId integer NOT NULL,
	dateOfReceipt date,
	expectedShipDate date,
	actualShipDate date,
	foreign key (employeeId) references Employee(employeeId) ON DELETE SET NULL, 
	foreign key (customerId) references Customer(customerId) ON DELETE SET NULL
);

create table PartsOrdered (
	orderId integer,
	partId integer,
	quantityofPart integer,
	foreign key (orderId) references Orders(orderId) ON DELETE CASCADE,
	foreign key (partId) references Part(partId) ON DELETE CASCADE
);

INSERT INTO Employee VALUES (1, 49546, 'Mark', 'Davis');
INSERT INTO Employee VALUES (2, 00001, 'john', 'doe');

INSERT INTO Customer VALUES (1, 99999, 'bob', 'johnson');

INSERT INTO Orders VALUES (1, 1, 2, 2017-01-20, 2017-01-24, 2017-01-23);

INSERT INTO Part VALUES (10, 'Gameboy Advance', 50, 100);

INSERT INTO PartsOrdered VALUES (1, 10, 2);