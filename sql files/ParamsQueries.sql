-- Query 9: Find Employees with Specific Attributes: "Find all employees who earn more than a specific salary and whose contract expires before a given date." Parameters: Minimum salary, expiration date.
SELECT Name, Salary, ExpirationOfContract
FROM LibraryEmployee
WHERE Salary > 90000 AND ExpirationOfContract < '2027-01-01'
ORDER BY Salary DESC;


-- Query 10: List Marketers Managing Specific Social Media Platforms: "Retrieve marketers who manage a specific social media platform, along with their follower count and target audience." Parameters: Social media platform name.
SELECT m.ID, m.Specialisation, ma.Platform, ma.FollowerCount, ma.TargetAudience
FROM Marketer m
JOIN Manages ma ON m.ID = ma.MarketerID
WHERE ma.Platform = 'x'
ORDER BY ma.FollowerCount DESC;


-- Query 11: Update Salaries for Employees in a Specific Department: "Increase the salaries of employees in a specified section of the library by a given percentage." Parameters: Section name, percentage increase.
UPDATE Librarian
SET YearsOfExperience = YearsOfExperience + 30 / 100 * YearsOfExperience
WHERE Section = 'Children'
RETURNING ID, Section, YearsOfExperience;


-- Query 12: Delete Desk Personnel from a Specific Workstation: "Remove desk personnel assigned to a specific workstation on a particular floor." Parameters: Workstation name, floor number.
DELETE FROM DeskPersonnel
WHERE Workstation = 'Workstation-97' AND Floor = 4
RETURNING ID, Workstation, DeskNumber, Floor;
