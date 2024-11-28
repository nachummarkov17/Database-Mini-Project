-- Load data into LibraryEmployee
COPY LibraryEmployee(ID, Name, DateOfBirth, Salary, ExpirationOfContract)
FROM '../csv files/library_employees.csv'
DELIMITER ',' 
CSV HEADER;

-- Load data into StoreOperator
COPY StoreOperator(ID, StoreType, StoreName, StoreLocation)
FROM '../csv files/store_operators.csv'
DELIMITER ',' 
CSV HEADER;

-- Load data into Librarian
COPY Librarian(ID, Section, Expertise, YearsOfExperience)
FROM '../csv files/librarians.csv'
DELIMITER ',' 
CSV HEADER;

-- Load data into Security
COPY Security(ID, Area, Role, ClearanceLevel)
FROM '../csv files/security.csv'
DELIMITER ',' 
CSV HEADER;

-- Load data into DeskPersonnel
COPY DeskPersonnel(ID, Workstation, DeskNumber, Floor)
FROM '../csv files/desk_personnel.csv'
DELIMITER ',' 
CSV HEADER;

-- Load data into Marketer
COPY Marketer(ID, Specialisation, Certification, CreativeSkill)
FROM '../csv files/marketers.csv'
DELIMITER ',' 
CSV HEADER;

-- Load data into SocialMedia
COPY SocialMedia(Platform, DistributionRating)
FROM '../csv files/social_medias.csv'
DELIMITER ',' 
CSV HEADER;

-- Load data into Manages
COPY Manages(MarketerID, Platform, Username, FollowerCount, TargetAudience)
FROM '../csv files/manages.csv'
DELIMITER ',' 
CSV HEADER;

-- Commit changes
COMMIT;
