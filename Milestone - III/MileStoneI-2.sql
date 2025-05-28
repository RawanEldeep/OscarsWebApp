Drop Schema Oscars; 


create Schema IF NOT EXISTS Oscars; 

create table  IF NOT EXISTS Oscars.Movie(
Title VARCHAR(150) NOT NULL,
ReleaseDate DATE NOT NULL,  
Country VARCHAR(150)  DEFAULT 'N/A', 
Language VARCHAR(200)  DEFAULT 'N/A',
RunTime VARCHAR(150)  DEFAULT 'N/A', 
Primary key (Title, ReleaseDate)
);


create table  IF NOT EXISTS Oscars.MovieProductionCom(
Title VARCHAR(150) NOT NULL,
ReleaseDate DATE NOT NULL, 
ProductionCompany VARCHAR(150) NOT NULL,
PRIMARY KEY (Title, ReleaseDate, ProductionCompany), 
FOREIGN KEY (Title, ReleaseDate) REFERENCES Movie(Title, ReleaseDate) ON DELETE CASCADE ON UPDATE NO ACTION
);


create table  IF NOT EXISTS Oscars.Person(
FName VARCHAR(150)  NOT NULL, 
MName VARCHAR(150)  ,
LName VARCHAR(150) NOT NULL,
BirthDate DATE DEFAULT '1999-01-01', 
CountryOfBirth VARCHAR(150)  DEFAULT 'Unknown', 
DeathDate DATE DEFAULT NULL, 
PRIMARY KEY (FName, LName)
);

create table  IF NOT EXISTS Oscars.WorksAt(
FName VARCHAR(150)  NOT NULL, 
MName VARCHAR(150) ,
LName VARCHAR(150)  NOT NULL,
Title VARCHAR(150)  NOT NULL,
ReleaseDate DATE   NOT NULL, 
Role VARCHAR(150) NOT NULL,
PRIMARY KEY (FName, LName, Title , ReleaseDate, Role),
FOREIGN KEY (FName, LName) REFERENCES Person(FName, LName) ON DELETE CASCADE ON UPDATE CASCADE,  
FOREIGN KEY (Title, ReleaseDate) REFERENCES Movie(Title, ReleaseDate) ON DELETE CASCADE ON UPDATE CASCADE
);

create table  IF NOT EXISTS Oscars.AcademyAwards(
IterationNo INT NOT NULL,  
Year INT NOT NULL, 
Site VARCHAR(150) NOT NULL DEFAULT 'N/A', 
PRIMARY KEY (IterationNo, Year)
);

create table  IF NOT EXISTS Oscars.AcademyAwardsHost(
IterationNo INT  NOT NULL,  
Year INT NOT NULL,
Host VARCHAR(150) NOT NULL, 
PRIMARY KEY (IterationNo, Year, Host) ,
FOREIGN KEY (IterationNo, Year) REFERENCES AcademyAwards(IterationNo, Year) ON DELETE CASCADE ON UPDATE CASCADE
);    

create Table  IF NOT EXISTS Oscars.Nomination(
IterationNo INT  NOT NULL,  
Year INT  NOT NULL, 
Category VARCHAR(150) NOT NULL, 
IsGranted TINYINT(1) NOT NULL, 
Title VARCHAR(150) NOT NULL,
ReleaseDate DATE NOT NULL, 
FName VARCHAR(150) NULL, 
MName VARCHAR(150) NULL ,
LName VARCHAR(150) NULL ,
PRIMARY KEY (Title, ReleaseDate, IterationNo, Year, Category),
FOREIGN KEY (Title, ReleaseDate) REFERENCES Movie(Title, ReleaseDate) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (IterationNo, Year) REFERENCES AcademyAwards(IterationNo, Year) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (FName,  LName) REFERENCES Person(FName, LName) 
); 



create table IF NOT EXISTS Oscars.User(
EmailAddress VARCHAR(150) PRIMARY KEY NOT NULL, 
Username VARCHAR(150) NOT NULL, 
Age INT NOT NULL, 
Gender CHAR(10) NOT NULL , 
Birthdate DATE NOT NULL, 
CountryOfBirth VARCHAR(200) 
);

create table  IF NOT EXISTS Oscars.UserNomination(
EmailAddress VARCHAR(150)  NOT NULL, 
Category VARCHAR(150)  NOT NULL, 
Title VARCHAR(150)  NOT NULL,
ReleaseDate DATE  NOT NULL, 
IterationNo INT  NOT NULL,  
Year INT NOT NULL,
FName VARCHAR(150) , 
MName VARCHAR(150) ,
LName VARCHAR(150) ,
PRIMARY KEY (EmailAddress, Category, Title, ReleaseDate, IterationNo, Year)
);


