USE MockData
GO

IF OBJECT_ID('dbo.County','u') IS NOT NULL
BEGIN
DROP TABLE dbo.County
END


IF OBJECT_ID('dbo.Country','u') IS NOT NULL
BEGIN
DROP TABLE dbo.COUNTRY
END

CREATE TABLE dbo.Country
(
CountryID int IDENTITY NOT NULL PRIMARY KEY,
Name Varchar(16) NOT NULL UNIQUE
)

SET IDENTITY_INSERT dbo.COUNTRY ON

INSERT INTO dbo.COUNTRY(CountryID, Name)
VALUES(1,'England')
INSERT INTO COUNTRY(CountryID,Name)
VALUES(2,'Wales')
INSERT INTO COUNTRY(CountryID, Name)
VALUES(3,'Scotland')
INSERT INTO COUNTRY(CountryID,Name)
VALUES(4,'Northern Ireland')
GO

SET IDENTITY_INSERT dbo.COUNTRY OFF



CREATE TABLE dbo.County(
  countyID INT IDENTITY NOT NULL PRIMARY KEY,
  county varchar(50) NOT NULL,
  CountryID INT NULL -- Will Create at a later date
) 

--Add Foreign Key
ALTER TABLE dbo.County
ADD CONSTRAINT FK_CountryID
FOREIGN KEY (CountryID) REFERENCES Country(CountryID)

--
-- Dumping data for table `counties`
--

INSERT INTO dbo.COUNTY (county, CountryID) VALUES
('London',1),
('Bedfordshire',1),
('Buckinghamshire',1),
('Cambridgeshire',1),
('Cheshire',1),
('Cornwall and Isles of Scilly',1),
('Cumbria',1),
('Derbyshire',1),
('Devon',1),
('Dorset',1),
('Durham',1),
('East Sussex',1),
('Essex',1),
('Gloucestershire',1),
('Greater London',1),
('Greater Manchester',1),
('Hampshire',1),
('Hertfordshire',1),
('Kent',1),
('Lancashire',1),
('Leicestershire',1),
('Lincolnshire',1),
('Merseyside',1),
('Norfolk',1),
('North Yorkshire',1),
('Northamptonshire',1),
('Northumberland',1),
('Nottinghamshire',1),
('Oxfordshire',1),
('Shropshire',1),
('Somerset',1),
('South Yorkshire',1),
('Staffordshire',1),
('Suffolk',1),
('Surrey',1),
('Tyne and Wear',1),
('Warwickshire',1),
('West Midlands',1),
('West Sussex',1),
('West Yorkshire',1),
('Wiltshire',1),
('Worcestershire',1),
('Flintshire',2),
('Glamorgan',2),
('Merionethshire',2),
('Monmouthshire',2),
('Montgomeryshire',2),
('Pembrokeshire',2),
('Radnorshire',2),
('Anglesey',2),
('Breconshire',2),
('Caernarvonshire',2),
('Cardiganshire',2),
('Carmarthenshire',2),
('Denbighshire',2),
('Kirkcudbrightshire',3),
('Lanarkshire',3),
('Midlothian',3),
('Moray',3),
('Nairnshire',3),
('Orkney',3),
('Peebleshire',3),
('Perthshire',3),
('Renfrewshire',3),
('Ross & Cromarty',3),
('Roxburghshire',3),
('Selkirkshire',3),
('Shetland',3),
('Stirlingshire',3),
('Sutherland',3),
('West Lothian',3),
('Wigtownshire',3),
('Aberdeenshire',3),
('Angus',3),
('Argyll',3),
('Ayrshire',3),
('Banffshire',3),
('Berwickshire',3),
('Bute',3),
('Caithness',3),
('Clackmannanshire',3),
('Dumfriesshire',3),
('Dumbartonshire',3),
('East Lothian',3),
('Fife',3),
('Inverness',3),
('Kincardineshire',3),
('Kinross-shire',3),
('Antrim',4),
('Armagh',4),
('Down',4),
('Fermanagh',4),
('Londonerry',4),
('Tyrone',4);