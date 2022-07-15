
--Create Table Persons
CREATE TABLE Persons (
	PersonID int IDENTITY(1,1) PRIMARY KEY,
	LastName varchar(25),
	FirstName varchar(25),
);

--Adding new column
ALTER TABLE Persons
ADD PersonID int NOT NULL PRIMARY KEY;

ALTER TABLE Persons
ALTER COLUMN PersonID int;

ALTER TABLE Persons
ADD CONSTRAINT PK_Person PRIMARY KEY (PersonID);

--Delete selected column
ALTER TABLE Persons
DROP COLUMN PersonID;

--Delete elements with condition
DELETE FROM Persons
WHERE PersonID = 1;

--Delete 5 elements in table persons
DELETE TOP (5) FROM Persons;

--Populate our table
INSERT INTO Persons (LastName, FirstName)
VALUES	('Druta', 'Ion'),
		('Tataru', 'Igor'),
		('Munteanu', 'Oleg'),
		('Barber', 'Valentin');

--Select all elements from persons
SELECT * FROM Persons;

--Delete table persons
DROP TABLE Persons;

--Create new table 
CREATE TABLE Orders (
	OrderID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	PersonID int FOREIGN KEY REFERENCES Persons(PersonID),
	Details varchar(25)
);

ALTER TABLE Orders
ADD PersonID int;

ALTER TABLE Orders
ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);

INSERT INTO Orders (PersonID, Details)
VALUES	(1, 'First Order'),
		(2, 'Second Order');

SELECT * FROM Orders;

TRUNCATE TABLE Orders;

DROP TABLE Orders;

CREATE TABLE Product (
	ProductID int IDENTITY(1,1) NOT NULL,
	ProductName varchar(25)
);

--How to inner join tabels
SELECT p.FirstName, od.Details
FROM Persons AS p
JOIN Orders AS od
ON p.PersonID = od.PersonID;