-- Create Library Employee Table
CREATE TABLE LibraryEmployee (
    ID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    ExpirationOfContract DATE
);

-- Create Store Operator Table
CREATE TABLE StoreOperator (
    ID INT PRIMARY KEY,
    StoreType VARCHAR(255),
    StoreName VARCHAR(255) UNIQUE,
    StoreLocation VARCHAR(255),
    LibraryEmployeeID INT,
    FOREIGN KEY (LibraryEmployeeID) REFERENCES LibraryEmployee(ID)
);

-- Create Librarian Table
CREATE TABLE Librarian (
    ID INT PRIMARY KEY,
    Section VARCHAR(255),
    Expertise VARCHAR(255),
    YearsOfExperience INT,
    LibraryEmployeeID INT,
    FOREIGN KEY (LibraryEmployeeID) REFERENCES LibraryEmployee(ID)
);

-- Create Security Table
CREATE TABLE Security (
    ID INT PRIMARY KEY,
    Area VARCHAR(255),
    Role VARCHAR(255),
    ClearanceLevel VARCHAR(255),
    LibraryEmployeeID INT,
    FOREIGN KEY (LibraryEmployeeID) REFERENCES LibraryEmployee(ID)
);

-- Create Desk Personnel Table
CREATE TABLE DeskPersonnel (
    ID INT PRIMARY KEY,
    Workstation VARCHAR(255),
    DeskNumber VARCHAR(255) UNIQUE,
    Floor INT,
    LibraryEmployeeID INT,
    FOREIGN KEY (LibraryEmployeeID) REFERENCES LibraryEmployee(ID)
);

-- Create Marketer Table
CREATE TABLE Marketer (
    ID INT PRIMARY KEY,
    Specialisation VARCHAR(255),
    Certification VARCHAR(255),
    CreativeSkill VARCHAR(255),
    LibraryEmployeeID INT,
    FOREIGN KEY (LibraryEmployeeID) REFERENCES LibraryEmployee(ID)
);

-- Create Social Media Table
CREATE TABLE SocialMedia (
    ID INT PRIMARY KEY,
    Platform VARCHAR(255) UNIQUE,
    DistributionRating DECIMAL(3, 2),
    MarketerID INT,
    FOREIGN KEY (MarketerID) REFERENCES Marketer(ID)
);
