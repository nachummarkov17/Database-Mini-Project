BEGIN;

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
    FOREIGN KEY (ID) REFERENCES LibraryEmployee(ID) ON DELETE CASCADE
);

-- Create Librarian Table
CREATE TABLE Librarian (
    ID INT PRIMARY KEY,
    Section VARCHAR(255) NOT NULL,
    Expertise VARCHAR(255) NOT NULL,
    YearsOfExperience INT NOT NULL,
    FOREIGN KEY (ID) REFERENCES LibraryEmployee(ID) ON DELETE CASCADE
);

-- Create Security Table
CREATE TABLE Security (
    ID INT PRIMARY KEY,
    Area VARCHAR(255) NOT NULL,
    Role VARCHAR(255) NOT NULL,
    ClearanceLevel INT NOT NULL CHECK (ClearanceLevel >= 1 AND ClearanceLevel <= 5),
    FOREIGN KEY (ID) REFERENCES LibraryEmployee(ID) ON DELETE CASCADE
);

-- Create Desk Personnel Table
CREATE TABLE DeskPersonnel (
    ID INT PRIMARY KEY,
    Workstation VARCHAR(255) NOT NULL,
    DeskNumber VARCHAR(255) NOT NULL,
    Floor INT NOT NULL,
    FOREIGN KEY (ID) REFERENCES LibraryEmployee(ID) ON DELETE CASCADE,
    UNIQUE (Workstation, DeskNumber, Floor) -- Ensures the tuple is unique
);

-- Create Marketer Table
CREATE TABLE Marketer (
    ID INT PRIMARY KEY,
    Specialisation VARCHAR(255) NOT NULL,
    Certification VARCHAR(255) NOT NULL,
    CreativeSkill VARCHAR(255) NOT NULL,
    FOREIGN KEY (ID) REFERENCES LibraryEmployee(ID) ON DELETE CASCADE
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

--------- The following tables are from the merge ---------

CREATE TABLE Conservator
(
    ID INT PRIMARY KEY,
    Duty VARCHAR(255) NOT NULL,
    FOREIGN KEY (ID) REFERENCES LibraryEmployee(ID) ON DELETE CASCADE
);

CREATE TABLE Book
(
    Book_ID BIGINT NOT NULL,
    Author VARCHAR(50) NOT NULL,
    Rarity VARCHAR(30) NOT NULL,
    Genre VARCHAR(40) NOT NULL,
    Title VARCHAR(100) NOT NULL,
    PRIMARY KEY (Book_ID)
);

CREATE TABLE Disposal
(
    Disposal_ID BIGINT NOT NULL,
    Method VARCHAR(300) NOT NULL,
    Material_of_Book VARCHAR(50) NOT NULL,
    Date DATE NOT NULL,
    Book_ID BIGINT NOT NULL,
    Conservator_ID INT NOT NULL,
    PRIMARY KEY (Disposal_ID),
    FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID) ON DELETE CASCADE,
    FOREIGN KEY (Conservator_ID) REFERENCES Conservator(ID) ON DELETE CASCADE
);

CREATE TABLE Archive_
(
    Archive_Number INT NOT NULL,
    Book_Type VARCHAR(50) NOT NULL,
    Capacity INT NOT NULL,
    PRIMARY KEY (Archive_Number)
);

CREATE TABLE Upkeep
(
    Upkeep_ID BIGINT NOT NULL,
    Tools_used VARCHAR(300) NOT NULL,
    Reason_for_Upkeep VARCHAR(300) NOT NULL,
    Date DATE NOT NULL,
    Conservator_ID INT NOT NULL,
    Book_ID BIGINT NOT NULL,
    PRIMARY KEY (Upkeep_ID),
    FOREIGN KEY (Conservator_ID) REFERENCES Conservator(ID) ON DELETE CASCADE,
    FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID) ON DELETE CASCADE
);

CREATE TABLE Archival_Assignment
(
    Old_shelf VARCHAR(100) NOT NULL,
    Assignment_ID BIGINT NOT NULL,
    Date DATE NOT NULL,
    Old_Archive_Room INT NOT NULL,
    New_Shelf INT NOT NULL,
    Conservator_ID INT NOT NULL,
    Book_ID BIGINT NOT NULL,
    New_Archive_Room INT NOT NULL,
    PRIMARY KEY (Assignment_ID),
    FOREIGN KEY (Conservator_ID) REFERENCES Conservator(ID) ON DELETE CASCADE,
    FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID) ON DELETE CASCADE,
    FOREIGN KEY (New_Archive_Room) REFERENCES Archive_(Archive_Number)
);

CREATE TABLE Shelf
(
    Shelf_Number INT NOT NULL,
    Archive_Number INT NOT NULL,
    PRIMARY KEY (Shelf_Number, Archive_Number),
    FOREIGN KEY (Archive_Number) REFERENCES Archive_(Archive_Number) ON DELETE CASCADE
);


COMMIT;