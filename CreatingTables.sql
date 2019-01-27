CREATE TABLE Countries (ID INT NOT NULL AUTO_INCREMENT,
CountryName VARCHAR(100) NOT NULL, VisaNeededForRus VARCHAR(100) NULL,
PRIMARY KEY (ID));

CREATE TABLE Cities (ID INT NOT NULL AUTO_INCREMENT,
CityName VARCHAR(100) NOT NULL, CityStatus VARCHAR(50) NULL, # Biggest City, Capital, etc
CountryID INT NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY FK_Cities_CountryID (CountryID) REFERENCES Countries (ID));

CREATE TABLE Chains (ID INT NOT NULL AUTO_INCREMENT,
ChainName VARCHAR(100),
PRIMARY KEY (ID));

CREATE TABLE BonusPrograms (ID INT NOT NULL AUTO_INCREMENT,
ProgramName VARCHAR(100) NOT NULL,
RoomDiscount FLOAT NOT NULL, RestaurantDiscount FLOAT NULL,
BreakfastDiscount FLOAT NULL, SPADiscount FLOAT NULL,
ChainID INT NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY FK_BonusPrograms_ChainID (ChainID) REFERENCES Chains (ID));

CREATE TABLE Hotels (ID INT NOT NULL AUTO_INCREMENT,
HotelName VARCHAR(100) NOT NULL, Address VARCHAR (100) NOT NULL, 
AddressCategory VARCHAR(100) NOT NULL, # Center, Distance, Aeroport
Rating FLOAT NULL, # 0 - 10, based on Reviews
Stars INT NULL, # NULL, 1 - 5
ArrivalTime Time NULL, DepartureTime Time NULL,
NumberOfRooms INT NOT NULL, NumberOfFreeRooms INT NOT NULL,
ParkingCapacity INT NULL, # NULL or some number
RoomServiceincluded BOOL NOT NULL, PoolIncluded BOOL NOT NULL,
SPAIncluded BOOL NOT NULL,
ChainID INT NOT NULL, CityID INT NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY FK_Hotels_ChainID (ChainID) REFERENCES Chains (ID),
FOREIGN KEY FK_Hotels_CityID (CityID) REFERENCES Cities (ID));

CREATE TABLE Rooms (ID INT NOT NULL AUTO_INCREMENT,
PricePerPerson FLOAT NOT NULL, Capacity INT NOT NULL,
Category VARCHAR (50) NULL, # Lux, standard, double, etc
BedWidth VARCHAR(50) NULL, # king size, queen size, basic
ShowerIncluded BOOL NULL, BathIncluded BOOL NULL, JacuzziIncluded BOOL NULL,
MiniBarIncluded BOOL NULL, InternetIncluded BOOL NULL,
ConnectionRoomId INT NULL,
HotelID INT NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY FK_Rooms_HotelID (HotelID) REFERENCES Hotels (ID));

CREATE TABLE Reviews (UserNickName VARCHAR (100) NOT NULL,
ReviewText TEXT, Rating FLOAT NOT NULL,
HotelID INT NOT NULL,
FOREIGN KEY FK_Reviews_HotelID (HotelID) REFERENCES Hotels (ID));

CREATE TABLE Aeroports (AeroportCode VARCHAR(3) NOT NULL,
AeroportName VARCHAR(100) NOT NULL, 
CityID INT NOT NULL,
PRIMARY KEY (AeroportCode),
FOREIGN KEY FK_Aeroports_CityID (CityID) REFERENCES Cities (ID));

# This table is for N-M Connection
CREATE TABLE Aeroports_Hotels (AeroportCode VARCHAR(3) NOT NULL, HotelID INT NOT NULL,
Distance FLOAT NOT NULL,
FOREIGN KEY FK_AH_AeroportCode (AeroportCode) REFERENCES Aeroports (AeroportCode),
FOREIGN KEY FK_AH_HotelID (HotelID) REFERENCES Hotels (ID));

CREATE TABLE Sightseeings (ID INT NOT NULL AUTO_INCREMENT,
SightName VARCHAR(100) NOT NULL, 
CityID INT NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY FK_Sightseeings_CityID (CityID) REFERENCES Cities (ID));

# This table is for N-M Connection
CREATE TABLE Sightseeings_Hotels (SightID INT NOT NULL, HotelID INT NOT NULL,
Distance FLOAT NOT NULL,
FOREIGN KEY FK_SH_SightID (SightID) REFERENCES Sightseeings (ID),
FOREIGN KEY FK_SH_HotelID (HotelID) REFERENCES Hotels (ID));
