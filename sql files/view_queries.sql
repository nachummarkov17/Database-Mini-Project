BEGIN;

-- Operations for View #1: LibrarianExpertise
-- SELECT query for View #1
-- Retrieve all librarians specializing in "History".
SELECT * 
FROM LibrarianExpertise
WHERE Section = 'History';

-- INSERT: Add a new librarian to the system.
INSERT INTO LibraryEmployee (ID, Name, DateOfBirth, Salary, ExpirationOfContract)
VALUES (300000, 'Alice Carter', '1985-06-15', 45000, '2029-12-31');

INSERT INTO Librarian (ID, Section, Expertise, YearsOfExperience)
VALUES (300000, 'History', 'Ancient Civilizations', 12);

-- UPDATE: Update expertise of a specific librarian.
UPDATE Librarian
SET Expertise = 'Medieval History'
WHERE ID = 300000;

-- DELETE: Remove a librarian and corresponding employee record.
DELETE FROM Librarian
WHERE ID = 300000;

DELETE FROM LibraryEmployee
WHERE ID = 300000;


-- Operations for View #2: SecurityClearance
-- SELECT query for View #2
-- Retrieve security personnel with a clearance level of 5.
SELECT * 
FROM SecurityClearance
WHERE ClearanceLevel = 5;

-- INSERT: Add a new security personnel to the system.
INSERT INTO LibraryEmployee (ID, Name, DateOfBirth, Salary, ExpirationOfContract)
VALUES (300001, 'John Doe', '1990-08-20', 35000, '2027-06-30');

INSERT INTO Security (ID, Area, Role, ClearanceLevel)
VALUES (300001, 'Archive', 'Guard', 5);

-- UPDATE: Change the clearance level for security personnel in the Archive.
UPDATE Security
SET ClearanceLevel = 4
WHERE ID = 300001 AND Area = 'Archive';

-- DELETE: Remove a security personnel and corresponding employee record.
DELETE FROM Security
WHERE ID = 300001;

DELETE FROM LibraryEmployee
WHERE ID = 300001;


-- Operations for View #3: MarketerPerformance
-- SELECT query for View #3
-- Retrieve all platforms managed by marketers specializing in "Digital Marketing".
SELECT * 
FROM MarketerPerformance
WHERE Specialisation = 'Digital Marketing';

-- INSERT: Add a new marketer and assign them to a platform.
INSERT INTO LibraryEmployee (ID, Name, DateOfBirth, Salary, ExpirationOfContract)
VALUES (300003, 'Emily Smith', '1988-03-10', 40000, '2028-11-15');

INSERT INTO Marketer (ID, Specialisation, Certification, CreativeSkill)
VALUES (300003, 'Digital Marketing', 'Google Ads Certified', 'Content Creation');

INSERT INTO Manages (MarketerID, Platform, Username, FollowerCount, TargetAudience)
VALUES (300003, 'x', 'emily_social', 15000, 'Tech Enthusiasts');

-- UPDATE: Increase the follower count of a marketer.
UPDATE Manages
SET FollowerCount = FollowerCount + 5000
WHERE Username = 'emily_social';

-- DELETE: Remove a marketer and their associated platform management records.
DELETE FROM Manages
WHERE MarketerID = 300003;

DELETE FROM Marketer
WHERE ID = 300003;

DELETE FROM LibraryEmployee
WHERE ID = 300003;


-- Operations for View #4: EmployeeContractDetails
-- SELECT query for View #4
-- Retrieve employees earning more than 50,000 with contracts expiring before 2028.
SELECT * 
FROM EmployeeContractDetails
WHERE Salary > 50000 AND ExpirationOfContract < '2028-01-01';

-- INSERT: Add a new employee to the system.
INSERT INTO LibraryEmployee (ID, Name, DateOfBirth, Salary, ExpirationOfContract)
VALUES (300004, 'Michael Brown', '1992-11-05', 52000, '2026-07-01');

-- UPDATE: Extend the contract expiration date for a specific employee.
UPDATE LibraryEmployee
SET ExpirationOfContract = '2029-01-01'
WHERE ID = 300004;

-- DELETE: Remove an employee from the system.
DELETE FROM LibraryEmployee
WHERE ID = 300004;

COMMIT;
