CREATE INDEX idx_salary ON LibraryEmployee(Salary DESC);
CREATE INDEX idx_expiration_of_contract ON LibraryEmployee(ExpirationOfContract);
CREATE INDEX idx_employee_id ON LibraryEmployee(ID);
CREATE INDEX idx_area_clearance ON Security(Area, ClearanceLevel);

-- -- Query #1
-- EXPLAIN ANALYZE
-- SELECT Name, DateOfBirth, Salary
-- FROM LibraryEmployee
-- ORDER BY Salary DESC
-- LIMIT 100;


-- -- Query #5
-- UPDATE LibraryEmployee
-- SET Salary = Salary * 1.10
-- WHERE ExpirationOfContract > '2028-01-01' AND Salary < 30000;


-- -- Query #6
-- EXPLAIN ANALYZE
-- UPDATE Security
-- SET ClearanceLevel = 5
-- WHERE Area = 'Archives' AND ClearanceLevel < 5;
