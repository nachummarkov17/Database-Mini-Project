BEGIN;
-- Operations for view #1: ObligatedConservators
-- SELECT query for View #1
-- Retrieve all conservators with current obligations.
SELECT *
FROM ObligatedConservators;

-- INSERT: Add new conservators with obligations.
INSERT INTO LibraryEmployee (ID, Name, DateOfBirth, Salary, ExpirationOfContract)
VALUES (300005, 'Tommy Doyle', '1987-09-30', 38000, '2028-06-15');
INSERT INTO Conservator (ID, Duty)
VALUES (300005, 'Disposal Worker');
INSERT INTO Disposal (Conservator_ID, Date, Item, Reason)
VALUES (300005, '2025-02-10', 'Book', 'Damaged');

-- UPDATE: change the pay of obligated conservators.
UPDATE LibraryEmployee
SET Salary = Salary * 1.03
WHERE ID IN ObligatedConservators;

-- DELETE: Remove employees whose contracts have expired and do not have obligations to complete.
Delete FROM LibraryEmployee
WHERE ID NOT IN ObligatedConservators AND ExpirationOfContract <= CURRENT_DATE;



-- Operations for view #2: ArchiveEmployees
-- SELECT query for View #2
-- Retrieve all employees who work in the Archive area.
SELECT *
FROM ArchiveEmployees;

-- INSERT: Add new employees to the Archive area.
INSERT INTO LibraryEmployee (ID, Name, DateOfBirth, Salary, ExpirationOfContract)
VALUES (300006, 'Steve Smith', '1993-04-25', 40000, '2028-08-15');
INSERT INTO Security (ID, Area, Role, ClearanceLevel)
VALUES (300006, 'Archives', 'Guard', 3);

INSERT INTO LibraryEmployee (ID, Name, DateOfBirth, Salary, ExpirationOfContract)
VALUES (300007, 'Robert Green', '1991-12-10', 42000, '2027-05-20');
INSERT INTO Conservator (ID, Duty)
VALUES (300007, 'Archivist');

-- UPDATE: Change the Pay of an employee working in the Archive.
UPDATE LibraryEmployee
SET Salary = Salary * 1.05
WHERE ID IN ArchiveEmployees

-- DELETE: Remove low level security personnel from the Archives.
DELETE FROM LibraryEmployee
WHERE ID IN (
    SELECT ID
    FROM Security
    WHERE ClearanceLevel < 4 AND Area = 'Archives';
); 

COMMIT;
    