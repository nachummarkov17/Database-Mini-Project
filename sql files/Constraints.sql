CREATE INDEX idx_salary ON LibraryEmployee(Salary DESC);
CREATE INDEX idx_expiration_of_contract ON LibraryEmployee(ExpirationOfContract);
CREATE INDEX idx_employee_id ON LibraryEmployee(ID);
CREATE INDEX idx_area_clearance ON Security(Area, ClearanceLevel);


-- Retrieve a list of all employees (LibraryEmployee) sorted by their salaries in descending order, showing their names, dates of birth, and salaries.
EXPLAIN ANALYZE
SELECT Name, DateOfBirth, Salary
FROM LibraryEmployee
ORDER BY Salary DESC
LIMIT 100;


-- -- Increase the salary of all employees in the LibraryEmployee table whose contract expires after 2028-01-01 by 10%.
-- EXPLAIN ANALYZE
-- UPDATE LibraryEmployee
-- SET Salary = Salary * 1.10
-- WHERE ExpirationOfContract > '2028-01-01' AND Salary < 30000;


-- -- Update the clearance level of security personnel working in the "Archive" area to level 5 if it's not already at that level.
-- EXPLAIN ANALYZE
-- UPDATE Security
-- SET ClearanceLevel = 5
-- WHERE Area = 'Archives' AND ClearanceLevel < 5;
