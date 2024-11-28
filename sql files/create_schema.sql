-- Create Library Employee Table
CREATE TABLE LibraryEmployee (
    ID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    DateOfBirth DATE NOT NULL, -- between 1/1/1960 and 1/1/2000
    Salary INT NOT NULL, -- betweem 20,000 and 100,000
    ExpirationOfContract DATE NOT NULL -- between 1/1/2026 and 1/1/2030
);

-- Create Store Operator Table
CREATE TABLE StoreOperator (
    ID INT PRIMARY KEY,
    StoreType VARCHAR(255) NOT NULL,
    StoreName VARCHAR(255) UNIQUE NOT NULL,
    StoreLocation VARCHAR(255) NOT NULL,
    FOREIGN KEY (ID) REFERENCES LibraryEmployee(ID)
);

-- Create Librarian Table
CREATE TABLE Librarian (
    ID INT PRIMARY KEY,
    Section VARCHAR(255) NOT NULL,
    Expertise VARCHAR(255) NOT NULL,
    YearsOfExperience INT NOT NULL,
    FOREIGN KEY (ID) REFERENCES LibraryEmployee(ID)
);

-- Create Security Table
CREATE TABLE Security (
    ID INT PRIMARY KEY,
    Area VARCHAR(255) NOT NULL,
    Role VARCHAR(255) NOT NULL,
    ClearanceLevel INT NOT NULL CHECK (ClearanceLevel >= 1 AND ClearanceLevel <= 5),
    FOREIGN KEY (ID) REFERENCES LibraryEmployee(ID)
);

-- Create Desk Personnel Table
CREATE TABLE DeskPersonnel (
    ID INT PRIMARY KEY,
    Workstation VARCHAR(255) NOT NULL,
    DeskNumber VARCHAR(255) NOT NULL,
    Floor INT NOT NULL,
    FOREIGN KEY (ID) REFERENCES LibraryEmployee(ID),
    UNIQUE (Workstation, DeskNumber, Floor) -- Ensures the tuple is unique
);

-- Create Marketer Table
CREATE TABLE Marketer (
    ID INT PRIMARY KEY,
    Specialisation VARCHAR(255) NOT NULL,
    Certification VARCHAR(255) NOT NULL,
    CreativeSkill VARCHAR(255) NOT NULL,
    FOREIGN KEY (ID) REFERENCES LibraryEmployee(ID)
);

-- Create Social Media Table
CREATE TABLE SocialMedia (
    Platform VARCHAR(255) PRIMARY KEY NOT NULL,
    DistributionRating INT NOT NULL CHECK (DistributionRating >= 1 AND DistributionRating <= 5)
);

-- Create Manages Table
CREATE TABLE Manages (
    MarketerID INT NOT NULL,
    Platform VARCHAR(255) NOT NULL,
    Username VARCHAR(255) NOT NULL,
    FollowerCount INT NOT NULL,
    TargetAudience VARCHAR(255) NOT NULL,
    PRIMARY KEY (Username, Platform),
    FOREIGN KEY (MarketerID) REFERENCES Marketer(ID),
    FOREIGN KEY (Platform) REFERENCES SocialMedia(Platform)
);
