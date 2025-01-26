BEGIN;

-- View #1: EmployeeID of Obligated Conservators
-- Provides a list of employee IDs for conservators who have current upkeep or archive jobs.
CREATE VIEW ObligatedConservators AS
SELECT EmployeeID
FROM (
    SELECT Conservator_ID AS EmployeeID
    FROM Disposal
    WHERE Date >= CURRENT_DATE
)
UNION
SELECT EmployeeID
FROM (
    SELECT Conservator_ID AS EmployeeID
    FROM Upkeep
    WHERE Date >= CURRENT_DATE
);

-- View #2: Employees who work in the Archive
-- Provides a list of employees who work in the Archive area.
CREATE VIEW ArchiveEmployees AS
SELECT *
FROM LibraryEmployee
WHERE ID IN (
    SELECT ID
    FROM Security
    WHERE Area = 'Archives'
) OR ID IN (
    SELECT ID
    FROM Conservator
    WHERE Duty = 'Archivist'
);

-- Commit transaction to finalize changes
COMMIT;
