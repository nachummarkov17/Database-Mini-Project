-- Begin transaction for consistency
BEGIN;

-- View #1: Librarian Expertise Summary
-- Provides a summary of librarians' section, their years of experience, and the sections they manage.
CREATE VIEW LibrarianExpertise AS
SELECT le.Name, l.Section, l.Expertise, l.YearsOfExperience
FROM LibraryEmployee le
JOIN Librarian l ON le.ID = l.ID;


-- View #2: Security Clearance Overview
-- Provides details about security personnel, their clearance levels, and assigned areas.
CREATE VIEW SecurityClearance AS
SELECT le.Name, s.Role, s.ClearanceLevel, s.Area
FROM LibraryEmployee le
JOIN Security s ON le.ID = s.ID;


-- View #3: Marketer Performance
-- Provides details on marketers, their managed platforms, follower counts, and the platform distribution rating.
CREATE VIEW MarketerPerformance AS
SELECT m.Specialisation, ma.Platform, ma.FollowerCount, sm.DistributionRating
FROM Marketer m
JOIN Manages ma ON m.ID = ma.MarketerID
JOIN SocialMedia sm ON ma.Platform = sm.Platform;


-- View #4: Employee Contract and Salary Overview
-- Provides details about employee salaries and contract expiration dates.
CREATE VIEW EmployeeContractDetails AS
SELECT le.Name, le.Salary, le.ExpirationOfContract
FROM LibraryEmployee le;

-- Commit transaction to finalize changes
COMMIT;
