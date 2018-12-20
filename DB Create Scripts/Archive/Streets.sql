USE MockData

IF Object_ID('Street_Type','u') IS NOT NULL
BEGIN
DROP TABLE Street_Type
END

CREATE TABLE Street_Type(
ID INT IDENTITY NOT NULL PRIMARY KEY,
Name Varchar(20) NOT NULL UNIQUE)

INSERT INTO Street_Type(Name)
VALUES
('Street'),
('Road'),
('Mews'),
('Close'),
('Avenue'),
('Square'),
('Way'),
('Place'),
('Drive'),
('Grove'),
('Boulevard'),
('Court'),
('Heights'),
('Lane'),
('Terrace')
