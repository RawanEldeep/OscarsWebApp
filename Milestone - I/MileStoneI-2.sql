create Database IF NOT EXISTS Oscars; 

create table  IF NOT EXISTS Oscars.Movie(
Title VARCHAR(50) NOT NULL,
ReleaseDate DATE NOT NULL, 
Language VARCHAR(20) NOT NULL, 
Country VARCHAR(50)  NOT NULL, 
Runtime INT NOT NULL, 
Primary key (Title, ReleaseDate)
);

create table  IF NOT EXISTS Oscars.MovieProductionCom(
Title VARCHAR(50) NOT NULL,
ReleaseDate DATE NOT NULL, 
ProductionCompany VARCHAR(50) NOT NULL ,
PRIMARY KEY (Title, ReleaseDate, ProductionCompany), 
FOREIGN KEY (Title, ReleaseDate) REFERENCES Movie(Title, ReleaseDate) ON DELETE CASCADE ON UPDATE NO ACTION
);

create table  IF NOT EXISTS Oscars.Person(
FName VARCHAR(50)  NOT NULL, 
MName VARCHAR(50)  NOT NULL,
LName VARCHAR(50) NOT NULL,
BIRTHDATE DATE NOT NULL, 
CountryOfBirth VARCHAR(20) NOT NULL, 
DeathDate DATE , 
PRIMARY KEY (FName, MName, LName)
);

create table  IF NOT EXISTS Oscars.WorksAt(
FName VARCHAR(50)  NOT NULL, 
MName VARCHAR(50)  NOT NULL,
LName VARCHAR(50)  NOT NULL,
Title VARCHAR(50)  NOT NULL,
ReleaseDate DATE   NOT NULL, 
Role VARCHAR(50) NOT NULL,
PRIMARY KEY (FName, MName, LName, Title , ReleaseDate),
FOREIGN KEY (FName, MName, LName) REFERENCES Person(FName, MName, LName) ON DELETE CASCADE ON UPDATE CASCADE,  
FOREIGN KEY (Title, ReleaseDate) REFERENCES Movie(Title, ReleaseDate) ON DELETE CASCADE ON UPDATE CASCADE
);

create table  IF NOT EXISTS Oscars.AcademyAwards(
IterationNo INT NOT NULL,  
Year INT NOT NULL, 
Site VARCHAR(50) NOT NULL, 
PRIMARY KEY (IterationNo, Year)
);
create table  IF NOT EXISTS Oscars.AcademyAwardsHost(
IterationNo INT  NOT NULL,  
Year INT NOT NULL,
Host VARCHAR(50) NOT NULL, 
PRIMARY KEY (IterationNo, Year, Host) ,
FOREIGN KEY (IterationNo, Year) REFERENCES AcademyAwards(IterationNo, Year) ON DELETE CASCADE ON UPDATE CASCADE
);    


create Table  IF NOT EXISTS Oscars.Nomination(
Title VARCHAR(50) NOT NULL,
ReleaseDate DATE  NOT NULL, 
IterationNo INT  NOT NULL,  
Year INT  NOT NULL, 
Category VARCHAR(50) NOT NULL, 
IsGranted boolean NOT NULL, 
PRIMARY KEY (Title, ReleaseDate, IterationNo, Year, Category),
FOREIGN KEY (Title, ReleaseDate) REFERENCES Movie(Title, ReleaseDate) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (IterationNo, Year) REFERENCES AcademyAwards(IterationNo, Year) ON DELETE CASCADE ON UPDATE CASCADE
); 

create table IF NOT EXISTS Oscars.User(
EmailAddress VARCHAR(50) PRIMARY KEY NOT NULL, 
Username VARCHAR(50) NOT NULL, 
Age INT NOT NULL, 
Gender CHAR(10) NOT NULL, 
Birthdate DATE NOT NULL, 
CountryOfBirth VARCHAR(20) NOT NULL
);

create table  IF NOT EXISTS Oscars.UserNomination(
EmailAddress VARCHAR(50)  NOT NULL, 
Category VARCHAR(50)  NOT NULL, 
Title VARCHAR(50)  NOT NULL,
ReleaseDate DATE  NOT NULL, 
IterationNo INT  NOT NULL,  
Year INT NOT NULL,
FName VARCHAR(50) , 
MName VARCHAR(50) ,
LName VARCHAR(50) ,
PRIMARY KEY (EmailAddress, Category, Title, ReleaseDate, IterationNo, Year),
FOREIGN KEY (Title, ReleaseDate) REFERENCES Movie(Title, ReleaseDate) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (IterationNo, Year) REFERENCES AcademyAwards(IterationNo, Year) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (EmailAddress) REFERENCES User(EmailAddress) ON DELETE CASCADE ON UPDATE CASCADE
);