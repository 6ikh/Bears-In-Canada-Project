-- Region Table: 
INSERT INTO Region (RegionID, RegionName, Size) VALUES  

('NR', 'North Region', '9x9'), 

('SR', 'South Region', '5x5'), 

('CR', 'Central Region', '9x9'); 

 

-- Study Table: 
INSERT INTO Study (StudyID, StudyName, Size, RegionID) VALUES  

('N22', 'North 2022', '9x9', 'NR'), 

('S22', 'South 2022', '5x5', 'SR'), 

('C22', 'Central 2022', '9x9', 'CR'), 

('C23', 'Central 2023', '9x9', 'CR'); 

 

-- Classification Table: 
INSERT INTO Classification (ClassID, Classification) VALUES  

('S', 'Scat'), 

('H', 'Hair Snag'), 

('T', 'Telemetry'); 

 

-- Status Table: 
INSERT INTO Status (Status, StatusCode) VALUES  

(1, 1), -- Sample exists 

(0, 0); -- Sample Used Up 

 

-- Species Table 

INSERT INTO Species (SpeciesCode, AveragePHT, Description) VALUES  

('B', 113.0, 'Black Bear'), 

('G', 142.0, 'Grizzly Bear'), 

('U', NULL, 'Undetermined'); 

 

-- Animal Table: 
INSERT INTO Animal (AnimalNumber, StudyID, Sex, SpeciesCode) VALUES  

(42, 'N22', 'M', 'B'), 

(89, 'S22', 'F', 'B'), 

(59, 'C22', 'M', 'B'), 

(113, 'C22', 'F', 'G'), 

(59, 'C23', 'F' ,'B'), 

(50, 'C23', '?', 'B'), 

(118, 'N22', 'F', 'B'), 

(112, 'C23', 'M', 'G'), 

(66, 'C22', 'F', 'G'), 

(66, 'N22', '?', 'U'), 

(66, 'S22', 'M', 'B'), 

(113, 'N22', 'F', 'G'); 

(63, 'S22', 'M', 'B'); 

(114, 'C22', 'F', 'G'); 
(114, 'C22', '?', 'G'); 

 

-- Sample Table: 
INSERT INTO Sample (SampleNumber, AnimalNumber, StudyID, SampleDate, Location, Status, ClassID) VALUES  

('17', 42, 'N22', 'Jul 2022', '5:8:03', 1, 'S'), 

('22', 89, 'S22', 'Nov 2022', '93:2:4', 1, 'T'), 

('44', 59, 'C22', 'Sep 2022', '32:1:9', 0, 'T'), 

('45', 113, 'C22', 'Oct 2022', '40:1:1', 0, 'H'), 

('47', 59, 'C22', 'Sep 2022', '41:2:3', 0, 'T'), 

('48', 59, 'C23', 'Sep 2023', '34:4:4', 1, 'S'), 

('56', 50, 'C23', 'Jul 2023', '40:1:1', 1, 'S'), 

('59', 118, 'N22', 'Jun 2022', '7:1:2', 1, 'S'), 

('79', 112, 'C23', 'Jul 2023', '32:5:5', 1, 'S'), 

('82', 66, 'C22', 'Nov 2022', '31:5:8', 0, 'T'), 

('100', 66, 'N22', 'Jul 2022', '1:1:9', 0, 'S'), 

('68', 66, 'S22', 'Jul 2022', '80:3:2', 0, 'H'), 

('27', 42, 'N22', 'Aug 2022', '15:2:6', 1, 'S'), 

('11', 113, 'N22', 'Jul 2022', '19:4:7', 0, 'S'), 

('45', 63, 'S22', 'Jul 2022', '90:3:4', 0, 'S'), 

('17', 114, 'C22', 'Oct 2022', '40:4:1', 1, 'T'), 

('18', 114, 'C22', 'Oct 2022', '40:4:1', 1, 'S'); 

 

-- Participant Table: 

INSERT INTO Participant (ParticipantID, Name, StartDate, EndDate) VALUES  

('P2001', 'Bill Brown', '2022-02-14', NULL), 

('P2004', 'Jane Smith', '2022-02-14', NULL), 

('P2036', 'Frank Martin', '2020-08-15', '2022-01-01'), 

('P2045', 'Anne Dough', '2021-06-12', NULL), 

('P2046', 'Mike Green', '2020-10-28', NULL), 

('P3038', 'Parm Singh', '2024-12-06', NULL), 

('D0004', 'Max', 2022-06-01, NULL),  

('D0008', 'Sampson', 2022-02-05, NULL), 

('D0013', 'Cindy', 2021-12-10, 2022-02-14), 

('D0022', 'Rover', 2022-05-20, NULL), 

 

('P2000', 'Bob Bureaucrat', '2023-03-23', NULL), 

('P0101', NULL, '2023-05-23', NULL), 

('P0102', NULL, '2023-03-23', NULL), 

('P0102', NULL, '2023-03-23', NULL), 

('P0103', NULL, '2023-03-23', NULL); 

 

-- Dogs Table: 

INSERT INTO Dogs (ParticipantID, LocateCount) VALUES  

('D0004', '3'), 

('D0008', '3'), 

('D0013', '2'), 

('D0022', '2'); 

 

-- Scat Table: 
INSERT INTO Scat (SampleNumber, AnimalNumber, StudyID, PHTValue, ParticipantID) VALUES  

('17', 42, 'N22', 109.0, 'D0004'), 

('48', 59, 'C23', 100.0, 'D0013'), 

('56', 50, 'C23', 103.5, 'D0004'), 

('59', 118, 'N22', 120, 'D0022'), 

('79', 112, 'C23', 135, 'D0004'), 

('100', 66, 'N22', NULL , 'D0022'), 

('27', 42, 'N22', 115.0, 'D0008'), 

('11', 113, 'N22', 135.0, 'D0008'), 

('45', 63, 'S22', 117.0, 'D0013'), 

('17', 114, 'C22', NULL, 'P3038'), 

('18', 114, 'C22', 1050, 'D0004'); 

 

-- Manager Table: 
INSERT INTO Manager (ParticipantID, LastAccessDate, RegionID) VALUES  

('P2000', '2023-01-01', 'CR'), 

('P0101', '2022-10-01', 'NR'), 

('P0102', '2022-01-01', 'CR'), 

('P0103', '2022-05-20', 'SR'); 

 

-- Lab_Tech Table: 
INSERT INTO Lab_Tech (ParticipantID, ClassificationType) VALUES  

('P2036', 'Telemetry'), 

('P2046', 'Hair Snag'), 

('P2045', 'Telemetry'), 

('P2001', 'Telemetry'),

('P2004', 'Hair Snag'), 

('P3038', 'Telemetry');

 

-- HairTelem Table: 
INSERT INTO Hair_Telem (SampleNumber, AnimalNumber, StudyID) VALUES  

('45', 113, 'C22'), 

('44', 59, 'C22'), 

('47', 59, 'C22'),   

('68', 66, 'S22'),   

('82', 66, 'S22'),   

('17', 114, 'C22'),    

('22', 89, 'S22');    

 

-- Director Table: 
INSERT INTO Director (ParticipantID) VALUES  

('P3038'); 

 
