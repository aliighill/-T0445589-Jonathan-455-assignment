CREATE DATABASE  cruise;
CREATE TABLE order_passenger (
    order_id INT ,
    passenger_id INT,
    cruise_no INT
);
ALTER TABLE order_passenger
MODIFY COLUMN order_id VARCHAR (3),
MODIFY COLUMN passenger_id VARCHAR (4);
ALTER TABLE order_passenger
ADD CONSTRAINT 
PRIMARY KEY(order_id);
INSERT INTO order_passenger
VALUES ("O23" ,"P001",1012),
	   ("O32","P005",2121),
	   ("O01","P003",1012);
ALTER TABLE order_passenger
ADD CONSTRAINT 
FOREIGN KEY (Passenger_id) REFERENCES Passenger (Passenger_id);   
ALTER TABLE order_passenger
ADD CONSTRAINT 
FOREIGN KEY (cruise_no) REFERENCES Cruise(Cruise_no);    
CREATE TABLE Passenger (
   passenger_id VARCHAR(4),
   passenger_name VARCHAR (10),
   cabin INT 
);
ALTER TABLE Passenger
ADD CONSTRAINT 
PRIMARY KEY(passenger_id);
INSERT INTO Passenger
VALUES ("P001" ,"Weber",2345),
	   ("P005","Elshaw",3777),
	   ("P003","Brown",8124);         
CREATE TABLE Cruise (
   cruise_no int PRIMARY KEY,
   cruise_name VARCHAR (25)
);
INSERT INTO Cruise
VALUES (1012,"Baltic Highlights"),
	   (2121,"Fjords");
CREATE TABLE trip_cost (
   Order_id VARCHAR (3),
   Excursion_no VARCHAR (5),
   Qty INT,
   total_cost INT
);
ALTER TABLE trip_cost
RENAME COLUMN Order_id TO order_id;
INSERT INTO trip_cost
VALUES ("O23","C001",5,100),
	   ("O23","O002",2,300),
	   ("O23","P002",1,300),
       ("O23","P003",3,900),
       ("O32","B001",4,200),
       ("O32","B111",10,750),
       ("O32","H002",5,500),
       ("O01","O002",3,450),
       ("O01","P002",2,600);
ALTER TABLE trip_cost
RENAME COLUMN Order_id TO order_id;
ALTER TABLE trip_cost
ADD CONSTRAINT 
FOREIGN KEY (order_id) REFERENCES order_passenger(order_id);  
ALTER TABLE trip_cost
ADD CONSTRAINT 
FOREIGN KEY (Excursion_no) REFERENCES Excursion(Excursion_no); 
CREATE TABLE Excursion(
    Excursion_no VARCHAR(5) PRIMARY KEY,
    Excursion VARCHAR(25),
    Excursion_leader_Id VARCHAR(5),
    Price_per_Excursion INT,
    PORTE VARCHAR(15)
);
INSERT INTO Excursion
VALUES ("C001","Little Mermaid","E0001",200,"Copenhagen"),
       ("O002","Museums","E0002",150,"Oslo"),
       ("P002","Palaces","E1008",300,"St Petersburg"),
       ("P003","Ballet","E1008",100,"St Petersburg"),
       ("B001","Biking","E0070",50,"Bergen"),
       ("B111","Hiking","E0070",75,"Bergen"),
       ("H002","Puffins","E0101",100,"Holden");
ALTER TABLE Excursion
ADD CONSTRAINT 
FOREIGN KEY (Excursion_leader_Id) REFERENCES Excursion_leader(Excursion_leader_Id);
CREATE TABLE Excursion_leader(
    Excursion_leader_Id VARCHAR(5) PRIMARY KEY,
    Excursion_leader VARCHAR(10)
);
INSERT INTO Excursion_leader
VALUES ("E0001","Wermter"),
       ("E0002","Smith"),
       ("E0070","Malone"),
       ("E0101","Ham"),
       ("E1008","Jones");
UPDATE Excursion
SET Price_per_Excursion = Price_per_Excursion * 1.55
WHERE PORTE = 'Copenhagen';

SELECT 
    op.order_id AS "Order_ID",
    op.passenger_id AS "Passenger_ID",
    p.passenger_name AS "Passenger_Name",
    p.cabin AS "Cabin"
FROM 
    order_passenger op
JOIN 
    Passenger p ON op.passenger_id = p.passenger_id;
    
SELECT 
    DISTINCT 
    p.passenger_id, 
    p.passenger_name, 
    p.cabin
FROM 
    order_passenger op
JOIN 
    trip_cost tc ON op.order_id = tc.order_id
JOIN 
    Excursion e ON tc.Excursion_no = e.Excursion_no
JOIN 
    Passenger p ON op.passenger_id = p.passenger_id
WHERE 
    e.PORTE IN ("St Petersburg", "Oslo");
    
SELECT 
    op.order_id,
    p.passenger_name
FROM 
    order_passenger op
JOIN 
    trip_cost tc ON op.order_id = tc.order_id
JOIN 
    Passenger p ON op.passenger_id = p.passenger_id
WHERE 
    tc.Excursion_no = "C001" AND tc.Qty > 4;
    
    SELECT 
    el.Excursion_leader,
    COUNT(DISTINCT op.passenger_id) AS number_of_passengers
FROM 
    order_passenger op
JOIN 
    trip_cost tc ON op.order_id = tc.order_id
JOIN 
    Excursion e ON tc.Excursion_no = e.Excursion_no
JOIN 
    Excursion_leader el ON e.Excursion_leader_Id = el.Excursion_leader_Id
GROUP BY 
    el.Excursion_leader;
    
SELECT 
    p.passenger_id, 
    p.passenger_name, 
    p.cabin, 
    e.Excursion, 
    e.Price_per_Excursion
FROM 
    Passenger p
JOIN 
    order_passenger op ON p.passenger_id = op.passenger_id
JOIN 
    trip_cost tc ON op.order_id = tc.order_id
JOIN 
    Excursion e ON tc.Excursion_no = e.Excursion_no
WHERE 
    p.passenger_name LIKE "al"
    AND p.passenger_name NOT LIKE "il";
    





       

