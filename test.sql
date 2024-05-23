ctegories
# database commands to create and to set the database as default
CREATE DATABASE jonathans_orders;
USE jonathans_orders;

CREATE TABLE Users (
user_ID INT PRIMARY KEY,
username VARCHAR(100) NOT NULL,
password VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL CHECK (email LIKE '%_@__%.__%'),
first_name VARCHAR(50) CHECK (first_name <> ''),
last_name VARCHAR(50) CHECK (last_name <> ''),
address TEXT, 
phone VARCHAR(15) CHECK (phone REGEXP '^[0-9-]+$'),
create_at DATETIME DEFAULT CURRENT_TIMESTAMP,
update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);