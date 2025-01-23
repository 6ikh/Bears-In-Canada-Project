CREATE TABLE Region 

(  

RegionID             char(2)  NOT NULL , 

RegionName           char(14)  NULL , 

Size                 char(3)  NULL , 

PRIMARY KEY  CLUSTERED (RegionID ASC) 

) 

go 

 

CREATE TABLE Study 

(  

StudyID              char(3)  NOT NULL , 

StudyName            char(12)  NULL , 

Size                 char(3)  NULL , 

RegionID             char(2)  NULL , 

PRIMARY KEY  CLUSTERED (StudyID ASC), 

FOREIGN KEY (RegionID) REFERENCES Region(RegionID) 

) 

go 

 

CREATE TABLE Classification 

(  

ClassID              char(1)  NOT NULL , 

Classification       char(9)  NULL , 

PRIMARY KEY  CLUSTERED (ClassID ASC) 

) 

go 

 

CREATE TABLE Status 

(  

Status               integer  NOT NULL , 

StatusCode           integer  NULL , 

PRIMARY KEY  CLUSTERED (Status ASC) 

) 

go 

 

CREATE TABLE Species 

(  

SpeciesCode          char(1)  NOT NULL , 

AveragePHT           decimal(5,1)  NULL , 

Description          char(12)  NULL , 

PRIMARY KEY  CLUSTERED (SpeciesCode ASC) 

) 

go 

 

CREATE TABLE Animal 

(  

AnimalNumber         int  NOT NULL , 

StudyID              char(3)  NOT NULL , 

Sex                  char(1)  NULL , 

SpeciesCode          char(1)  NULL , 

PRIMARY KEY  CLUSTERED (AnimalNumber ASC,StudyID ASC), 

FOREIGN KEY (StudyID) REFERENCES Study(StudyID), 

FOREIGN KEY (SpeciesCode) REFERENCES Species(SpeciesCode) 

) 

go 

 

CREATE TABLE Sample 

(  

SampleNumber         char(3)  NOT NULL , 

AnimalNumber         int  NOT NULL , 

StudyID              char(3)  NOT NULL , 

SampleDate           char(8)  NULL , 

Location             char(6)  NULL , 

Status               integer  NULL , 

ClassID              char(1)  NULL , 

PRIMARY KEY  CLUSTERED (SampleNumber ASC,AnimalNumber ASC,StudyID ASC), 

FOREIGN KEY (StudyID) REFERENCES Study(StudyID), 

FOREIGN KEY (ClassID) REFERENCES Classification(ClassID), 

FOREIGN KEY (Status) REFERENCES Status(Status), 

FOREIGN KEY (AnimalNumber,StudyID) REFERENCES Animal(AnimalNumber,StudyID) 

) 

go 

 

CREATE TABLE Participant 

(  

ParticipantID        char(5)  NOT NULL , 

Name                 char(12)  NULL , 

StartDate            char(10)  NULL , 

EndDate              char(10)  NULL , 

PRIMARY KEY  CLUSTERED (ParticipantID ASC) 

) 

go 

 

CREATE TABLE Dogs 

(  

ParticipantID        char(5)  NOT NULL , 

LocateCount          char(1)  NULL , 

PRIMARY KEY  CLUSTERED (ParticipantID ASC), 

FOREIGN KEY (ParticipantID) REFERENCES Participant(ParticipantID) 

) 

go 

 

CREATE TABLE Scat 

(  

SampleNumber         char(3)  NOT NULL , 

AnimalNumber         int  NOT NULL , 

StudyID              char(3)  NOT NULL , 

PHTValue             decimal(5,1)  NULL , 

ParticipantID        char(5)  NULL , 

PRIMARY KEY  CLUSTERED (SampleNumber ASC,AnimalNumber ASC,StudyID ASC), 

FOREIGN KEY (SampleNumber,AnimalNumber,StudyID) REFERENCES Sample(SampleNumber,AnimalNumber,StudyID), 

FOREIGN KEY (ParticipantID) REFERENCES Dogs(ParticipantID) 

) 

go 

 

CREATE TABLE Manager 

(  

ParticipantID        char(5)  NOT NULL , 

LastAccessDate       char(10)  NULL , 

RegionID             char(2)  NULL , 

PRIMARY KEY  CLUSTERED (ParticipantID ASC), 

FOREIGN KEY (ParticipantID) REFERENCES Participant(ParticipantID), 

FOREIGN KEY (RegionID) REFERENCES Region(RegionID) 

) 

go 

 

CREATE TABLE Lab_Tech 

(  

ParticipantID        char(5)  NOT NULL , 

ClassificationType   char(9)  NULL , 

PRIMARY KEY  CLUSTERED (ParticipantID ASC), 

FOREIGN KEY (ParticipantID) REFERENCES Participant(ParticipantID) 

) 

go 

 

CREATE TABLE Hair_Telem 

(  

SampleNumber         char(3)  NOT NULL , 

AnimalNumber         int  NOT NULL , 

StudyID              char(3)  NOT NULL , 

PRIMARY KEY  CLUSTERED (SampleNumber ASC,AnimalNumber ASC,StudyID ASC), 

FOREIGN KEY (SampleNumber,AnimalNumber,StudyID) REFERENCES Sample(SampleNumber,AnimalNumber,StudyID) 

) 

go 

 

CREATE TABLE Director 

(  

ParticipantID        char(5)  NOT NULL , 

PRIMARY KEY  CLUSTERED (ParticipantID ASC), 

FOREIGN KEY (ParticipantID) REFERENCES Participant(ParticipantID) 

) 

Go 

 
