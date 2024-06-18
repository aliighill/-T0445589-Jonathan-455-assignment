CREATE DATABASE ali ;
CREATE TABLE passengeer_one (
    order_id INT ,
    passenger_id INT ,
    cruise_no INT
);
ALTER TABLE passengeer_one
MODIFY COLUMN order_id VARCHAR (3),
MODIFY COLUMN passenger_id VARCHAR (4);
INSERT INTO passengeer_one 
VALUES ("O23" ,"P001",1012),
	   ("O32","P005",2121),
	   ("O01","P003",1012);
CREATE TABLE table2 (
   passenger_id VARCHAR(4),
   passenger_name VARCHAR (10),
   cabin INT 
);
INSERT INTO table2
VALUES ("P001" ,"Weber",2345),
	   ("P005","Elshaw",3777),
	   ("P003","Brown",8124);
CREATE TABLE table3 (
   passenger_id int,
   passenger_name VARCHAR (25)
);
ALTER TABLE table3
RENAME COLUMN passenger_id TO cruise_no,
RENAME COLUMN passenger_name TO cruise_name;
INSERT INTO table3
VALUES (1012,"Baltic Highlights"),
	   (2121,"Fjords"),
	   (1012,"Baltic Highlights");
CREATE TABLE table4 (
     passenger_id VARCHAR (4),
     port VARCHAR (20),
     qty INT ,
     excursion_no VARCHAR (5),
     excursion_leader_id VARCHAR (5)
);      
INSERT INTO table4
VALUES ("P001","Copenhagen",5,"C001","E0001"),
	   ("P001","Oslo",2,"O002","E0002"),
       ("P001","St Petersburg",1,"P002","E1008"),
       ("P001","St Petersburg",3,"P003","E1008"),
       ("P005","Bergen",4,"B001","E0070"),
       ("P005","Bergen",10,"B111","E0070"),
       ("P005","Holden",5,"H002","E0101"),
       ("P003","Oslo",3,"O002","E0002"),
       ("P003","St Petersburg",2,"P002","E1008");
CREATE TABLE table5(
     excursion_no VARCHAR (5),
     excursion VARCHAR (20)
);     
INSERT INTO table5
VALUES ("C001", "Little Mermaid"),
	   ("O002","Museums"),
       ("P002","Palaces"),
       ("P003","Ballet"),
       ("B001","Biking"),
       ("B111","Hiking"),
       ("H002","Puffins"),
       ("O002","Museums"),
       ("P002","Palaces");
CREATE TABLE table6(
    excursion_leader_id VARCHAR (5),
    excursion_leader VARCHAR (10)
);       
INSERT INTO table6
VALUES ("E0001","Wermter"),
	   ("E0002","Smith"),
       ("E1008","Jones"),
       ("E1008","Jones"),
       ("E0070","Malone"),
       ("E0070","Malone"),
       ("E0101","Ham"),
       ("E0002","Smith"),
       ("E1008","Jones");
CREATE TABLE table7(
    qty INT,
     price_per_excursion INT
);
INSERT INTO table7
VALUES ( 5	,200 ),
	   ( 2	,150),
       ( 1	,300),
       ( 3	,100 ),
       ( 4	,50 ),
       ( 10	,75 ),
       ( 5	,100),
       ( 3	,150),
       ( 2	,300 );
CREATE TABLE table8(
     price_per_excursion INT,
     total_cost INT
);
INSERT INTO table8
VALUES ( 200,1900 ),
	   (150,1900),
       ( 300,1900),
       ( 100,1900 ),
       (50,1450),
       (75,1450),
       ( 100,1450),
       (150,1050),
       ( 30,1450 );  
       
       