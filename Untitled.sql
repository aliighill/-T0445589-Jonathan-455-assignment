CREATE DATABASE VideoGameDB_A;  

USE VideoGameDB_A;  


CREATE TABLE Player (  

id INT AUTO_INCREMENT PRIMARY KEY,  
username VARCHAR(50) NOT NULL,  
email VARCHAR(100) NOT NULL, join_date DATETIME NOT NULL );  

 

CREATE TABLE Characters (  
id INT AUTO_INCREMENT PRIMARY KEY,  
name VARCHAR(50) NOT NULL,  
level INT NOT NULL,  
player_id INT,  
FOREIGN KEY (player_id) REFERENCES Player(id) );  

 

CREATE TABLE Quest (  

id INT AUTO_INCREMENT PRIMARY KEY,  
name VARCHAR(100) NOT NULL,  
description TEXT,  
reward VARCHAR(100) ); 

  

CREATE TABLE Item (  
id INT AUTO_INCREMENT PRIMARY KEY,  
name VARCHAR(50) NOT NULL,  
type VARCHAR(50) NOT NULL,  
character_id INT,  
FOREIGN KEY (character_id) REFERENCES Characters(id) );  

 

CREATE TABLE Guild (  
id INT AUTO_INCREMENT PRIMARY KEY,  
name VARCHAR(50) NOT NULL,  
creation_date DATETIME NOT NULL ); 

  

CREATE TABLE Achievement (  
id INT AUTO_INCREMENT PRIMARY KEY,  
name VARCHAR(100) NOT NULL,  
description TEXT,  
player_id INT,  
FOREIGN KEY (player_id) REFERENCES Player(id) ); 

  

CREATE TABLE PlayerGuild (  
id INT AUTO_INCREMENT PRIMARY KEY,  
player_id INT,  
guild_id INT,  
FOREIGN KEY (player_id) REFERENCES Player(id),  
FOREIGN KEY (guild_id) REFERENCES Guild(id) );  
 

 

 

 

 

 

 

 

 

 


-- Adding data validation to Player table 

ALTER TABLE Player 

ADD CONSTRAINT unique_username UNIQUE (username), 

ADD CONSTRAINT unique_email UNIQUE (email), 

ADD CONSTRAINT check_email_format CHECK (email LIKE '%_@__%.__%'); 

  

-- Adding data validation to Characters table 

ALTER TABLE Characters 

ADD CONSTRAINT check_level_positive CHECK (level >= 0), 

ADD CONSTRAINT unique_character_name_per_player UNIQUE (name, player_id); 

  

-- Adding data validation to Quest table 

ALTER TABLE Quest 

ADD CONSTRAINT unique_quest_name UNIQUE (name), 

ADD CONSTRAINT check_reward_not_null CHECK (reward IS NOT NULL); 

  

-- Adding data validation to Item table 

ALTER TABLE Item 

ADD CONSTRAINT unique_item_name_per_character UNIQUE (name, character_id), 

ADD CONSTRAINT check_item_type CHECK (type IN ('Weapon', 'Armor', 'Potion', 'Accessory')); 

  

-- Adding data validation to Guild table 

ALTER TABLE Guild 

ADD CONSTRAINT unique_guild_name UNIQUE (name); 

  

-- Adding data validation to Achievement table 

ALTER TABLE Achievement 

ADD CONSTRAINT unique_achievement_name_per_player UNIQUE (name, player_id); 

  

-- Adding data validation to PlayerGuild table 

ALTER TABLE PlayerGuild 

ADD CONSTRAINT unique_player_guild UNIQUE (player_id, guild_id); 

 

 

 

 

 
  

-- Inserting records into Player table 

INSERT INTO Player (username, email, join_date) VALUES 

('player1', 'player1@example.com', '2023-01-01 10:00:00'), 

('player2', 'player2@example.com', '2023-01-02 10:00:00'), 

('player3', 'player3@example.com', '2023-01-03 10:00:00'), 

('player4', 'player4@example.com', '2023-01-04 10:00:00'), 

('player5', 'player5@example.com', '2023-01-05 10:00:00'), 

('player6', 'player6@example.com', '2023-01-06 10:00:00'), 

('player7', 'player7@example.com', '2023-01-07 10:00:00'), 

('player8', 'player8@example.com', '2023-01-08 10:00:00'), 

('player9', 'player9@example.com', '2023-01-09 10:00:00'), 

('player10', 'player10@example.com', '2023-01-10 10:00:00'), 

('player11', 'player11@example.com', '2023-01-11 10:00:00'), 

('player12', 'player12@example.com', '2023-01-12 10:00:00'), 

('player13', 'player13@example.com', '2023-01-13 10:00:00'), 

('player14', 'player14@example.com', '2023-01-14 10:00:00'), 

('player15', 'player15@example.com', '2023-01-15 10:00:00'), 

('player16', 'player16@example.com', '2023-01-16 10:00:00'), 

('player17', 'player17@example.com', '2023-01-17 10:00:00'), 

('player18', 'player18@example.com', '2023-01-18 10:00:00'), 

('player19', 'player19@example.com', '2023-01-19 10:00:00'), 

('player20', 'player20@example.com', '2023-01-20 10:00:00'); 

  

-- Inserting records into Character table 

INSERT INTO Characters (name, level, player_id) VALUES 

('char1', 10, 1), 

('char2', 12, 1), 

('char3', 15, 2), 

('char4', 20, 3), 

('char5', 8, 4), 

('char6', 9, 5), 

('char7', 11, 6), 

('char8', 14, 7), 

('char9', 16, 8), 

('char10', 5, 9), 

('char11', 7, 10), 

('char12', 13, 11), 

('char13', 17, 12), 

('char14', 19, 13), 

('char15', 22, 14), 

('char16', 25, 15), 

('char17', 18, 16), 

('char18', 21, 17), 

('char19', 23, 18), 

('char20', 24, 19); 

  

-- Inserting records into Quest table 

INSERT INTO Quest (name, description, reward) VALUES 

('quest1', 'Find the lost sword', '100 gold'), 

('quest2', 'Defeat the dragon', '200 gold'), 

('quest3', 'Rescue the princess', '150 gold'), 

('quest4', 'Explore the cave', '50 gold'), 

('quest5', 'Gather herbs', '10 gold'), 

('quest6', 'Escort the merchant', '75 gold'), 

('quest7', 'Defend the village', '120 gold'), 

('quest8', 'Hunt wolves', '30 gold'), 

('quest9', 'Collect mushrooms', '15 gold'), 

('quest10', 'Retrieve the magic amulet', '250 gold'), 

('quest11', 'Defeat the bandits', '100 gold'), 

('quest12', 'Find the hidden treasure', '300 gold'), 

('quest13', 'Investigate the ruins', '80 gold'), 

('quest14', 'Help the blacksmith', '60 gold'), 

('quest15', 'Deliver the message', '20 gold'), 

('quest16', 'Protect the caravan', '110 gold'), 

('quest17', 'Find the ancient scroll', '130 gold'), 

('quest18', 'Kill the giant spider', '90 gold'), 

('quest19', 'Escort the noble', '140 gold'), 

('quest20', 'Recover the stolen goods', '70 gold'); 

  

-- Inserting records into Item table 

INSERT INTO Item (name, type, character_id) VALUES 

('sword', 'Weapon', 1), 

('shield', 'Armor', 2), 

('potion', 'Potion', 3), 

('ring', 'Accessory', 4), 

('axe', 'Weapon', 5), 

('helmet', 'Armor', 6), 

('elixir', 'Potion', 7), 

('necklace', 'Accessory', 8), 

('bow', 'Weapon', 9), 

('armor', 'Armor', 10), 

('herb', 'Potion', 11), 

('bracelet', 'Accessory', 12), 

('dagger', 'Weapon', 13), 

('boots', 'Armor', 14), 

('tonic', 'Potion', 15), 

('amulet', 'Accessory', 16), 

('mace', 'Weapon', 17), 

('gloves', 'Armor', 18), 

('antidote', 'Potion', 19), 

('belt', 'Accessory', 20); 

  

-- Inserting records into Guild table 

INSERT INTO Guild (name, creation_date) VALUES 

('guild1', '2023-01-01 12:00:00'), 

('guild2', '2023-01-02 12:00:00'), 

('guild3', '2023-01-03 12:00:00'), 

('guild4', '2023-01-04 12:00:00'), 

('guild5', '2023-01-05 12:00:00'), 

('guild6', '2023-01-06 12:00:00'), 

('guild7', '2023-01-07 12:00:00'), 

('guild8', '2023-01-08 12:00:00'), 

('guild9', '2023-01-09 12:00:00'), 

('guild10', '2023-01-10 12:00:00'), 

('guild11', '2023-01-11 12:00:00'), 

('guild12', '2023-01-12 12:00:00'), 

('guild13', '2023-01-13 12:00:00'), 

('guild14', '2023-01-14 12:00:00'), 

('guild15', '2023-01-15 12:00:00'), 

('guild16', '2023-01-16 12:00:00'), 

('guild17', '2023-01-17 12:00:00'), 

('guild18', '2023-01-18 12:00:00'), 

('guild19', '2023-01-19 12:00:00'), 

('guild20', '2023-01-20 12:00:00'); 

  

-- Inserting records into Achievement table 

INSERT INTO Achievement (name, description, player_id) VALUES 

('achievement1', 'Complete 10 quests', 1), 

('achievement2', 'Defeat 50 enemies', 2), 

('achievement3', 'Reach level 10', 3), 

('achievement4', 'Join a guild', 4), 

('achievement5', 'Collect 100 items', 5), 

('achievement6', 'Complete main storyline', 6), 

('achievement7', 'Earn 1000 gold', 7), 

('achievement8', 'Explore entire map', 8), 

('achievement9', 'Win 10 battles', 9), 

('achievement10', 'Craft 10 items', 10), 

('achievement11', 'Complete side quests', 11), 

('achievement12', 'Reach level 20', 12), 

('achievement13', 'Defeat final boss', 13), 

('achievement14', 'Unlock all skills', 14), 

('achievement15', 'Find all secrets', 15), 

('achievement16', 'Help 50 NPCs', 16), 

('achievement17', 'Earn 2000 gold', 17), 

('achievement18', 'Craft rare item', 18), 

('achievement19', 'Win 20 battles', 19), 

('achievement20', 'Reach level 30', 20); 

  

-- Inserting records into PlayerGuild table 

INSERT INTO PlayerGuild (player_id, guild_id) VALUES 

(1, 1), 

(2, 1), 

(3, 2), 

(4, 2), 

(5, 3), 

(6, 3), 

(7, 4), 

(8, 4), 

(9, 5), 

(10, 5), 

(11, 6), 

(12, 6), 

(13, 7), 

(14, 7), 

(15, 8), 

(16, 8), 

(17, 9), 

(18, 9), 

(19, 10), 

(20, 10);