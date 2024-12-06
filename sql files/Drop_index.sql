DROP INDEX IF EXISTS idx_salary;
DROP INDEX IF EXISTS idx_expiration_of_contract;
DROP INDEX IF EXISTS idx_employee_id;
DROP INDEX IF EXISTS idx_area_clearance;


-- -- Query #1
-- EXPLAIN ANALYZE
-- SELECT Name, DateOfBirth, Salary
-- FROM LibraryEmployee
-- ORDER BY Salary DESC
-- LIMIT 100;


-- -- Query #5
-- EXPLAIN ANALYZE
-- UPDATE LibraryEmployee
-- SET Salary = Salary * 1.10
-- WHERE ExpirationOfContract > '2028-01-01' AND Salary < 30000;


-- -- Query #6
-- EXPLAIN ANALYZE
-- UPDATE Security
-- SET ClearanceLevel = 5
-- WHERE Area = 'Archives' AND ClearanceLevel < 5;