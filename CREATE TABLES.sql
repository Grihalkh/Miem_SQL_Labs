CREATE TABLE Genres (GenreName VARCHAR(30) NOT NULL,
CONSTRAINT GenresPK PRIMARY KEY (GenreName));

CREATE TABLE Films (ID NUMERIC(6) NOT NULL,
FilmName VARCHAR(50) NOT NULL, Studio VARCHAR(50) NOT NULL,
ReleaseYear NUMERIC(4) NOT NULL, 
Country VARCHAR(30) NULL,
Duration NUMERIC(4,2) NOT NULL,
Genre VARCHAR(30) NOT NULL,
CONSTRAINT PkFilms PRIMARY KEY (ID),
CONSTRAINT FK_Genre FOREIGN KEY (Genre) REFERENCES Genres (GenreName));

CREATE TABLE Persons (ID NUMERIC(6) NOT NULL,
LFP VARCHAR (100) NOT NULL, Country VARCHAR(30) NOT NULL,
BirthDate DATE NOT NULL, DeathDate DATE NULL,
CONSTRAINT PersonsPk PRIMARY KEY (ID));

CREATE TABLE Creators (FilmID NUMERIC(6) NOT NULL,
PersonID NUMERIC(6) NOT NULL, 
ParticipationCharacter VARCHAR(50) NULL,
ActorRole VARCHAR(100) NULL,
CONSTRAINT FK_FilmID FOREIGN KEY (FilmID) REFERENCES Films (ID),
CONSTRAINT FK_PersonID FOREIGN KEY (PersonID) REFERENCES Persons (ID));

CREATE TABLE ArchiveTab
(changeDate DATE NOT NULL, username VARCHAR(100) NOT NULL,
FilmName VARCHAR(50) NOT NULL);
