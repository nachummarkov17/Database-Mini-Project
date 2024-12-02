CREATE INDEX idx_salary ON LibraryEmployee(Salary DESC);
CREATE INDEX idx_expiration_of_contract ON LibraryEmployee(ExpirationOfContract);
CREATE INDEX idx_employee_id ON LibraryEmployee(ID);
CREATE INDEX idx_area_clearance ON Security(Area, ClearanceLevel);


-- -- Retrieve a list of all employees (LibraryEmployee) sorted by their salaries in descending order, showing their names, dates of birth, and salaries.
-- EXPLAIN ANALYZE
-- SELECT Name, DateOfBirth, Salary
-- FROM LibraryEmployee
-- ORDER BY Salary DESC;


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


-- Unique Constraint: Situation that Name must be unique
ALTER TABLE LibraryEmployee
ADD CONSTRAINT unique_employee_name UNIQUE (Name);

-- Check Constraint: Situation that employees can't be paid more than 80000
ALTER TABLE LibraryEmployee
ADD CONSTRAINT check_salary_range CHECK (Salary BETWEEN 20000 AND 80000);

-- Check Constraint: Situation that security can't be clearance level 1
ALTER TABLE Security
ADD CONSTRAINT check_clearance_level CHECK (ClearanceLevel >= 2 AND ClearanceLevel <= 5);

COMMIT;
INSERT INTO LibraryEmployee (ID, Name, DateOfBirth, Salary, ExpirationOfContract)
VALUES (101, 'Alice', '1985-06-15', 60000, '2029-12-31'),
       (102, 'Alice', '1990-08-10', 45000, '2027-01-01');
-- This should fail due to unique constraint on Name.

INSERT INTO Security (ID, Area, Role, ClearanceLevel)
VALUES (103, 'Lobby', 'Guard', 1);
-- This should fail due to ClearanceLevel = 1.

UPDATE LibraryEmployee
SET Salary = 150000
WHERE ID = 101;
-- This should fail due to salary exceeding the upper limit.