-- Query #1: Retrieve a list of top 100 employees (LibraryEmployee) sorted by their salaries in descending order, showing their names, dates of birth, and salaries.
SELECT * 
FROM GetTopEmployeesBySalary(100);


-- Query #2: Find the average, minimum, and maximum salary of employees in the LibraryEmployee table.
SELECT * 
FROM GetSalaryStatistics();



-- Query #3: List all librarians and their expertise whose YearsOfExperience exceed 10 years.
SELECT * 
FROM GetLibrariansByExperience(10);



-- Query #4: Display all social media platforms managed by marketers with a DistributionRating of 4 or higher, along with the marketer's username and follower count.
SELECT * 
FROM GetPlatformsByRating(4);



-- Query #5: Increase the salary of all employees in the LibraryEmployee table whose contract expires after 2028-01-01 and Salary is less then 30000 by 10%.
UPDATE LibraryEmployee
SET Salary = Salary * 1.10
WHERE ExpirationOfContract > '2028-01-01' AND Salary < 30000;

-- Query #6: Update the clearance level of security personnel working in the "Archive" area to level 5 if it's not already at that level.
UPDATE Security
SET ClearanceLevel = 5
WHERE Area = 'Archives' AND ClearanceLevel < 5;


-- Query #7: Delete records of all marketers who no longer manage any social media platforms (no corresponding entry in Manages).
DELETE FROM Marketer
WHERE ID NOT IN (
    SELECT DISTINCT MarketerID
    FROM Manages
);


-- Query #8: Remove employees from the LibraryEmployee table whose salaries are less than 30,000.
DELETE FROM LibraryEmployee
WHERE Salary < 30000;

