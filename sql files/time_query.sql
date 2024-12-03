DO $$ 
DECLARE
    start_time TIMESTAMP;
    end_time TIMESTAMP;
    duration INTERVAL;
BEGIN
    -- Record the start time
    start_time := clock_timestamp();
    
    -- Query Section. Query #1: Retrieve a list of top 100 employees (LibraryEmployee) sorted by their salaries in descending order, showing their names, dates of birth, and salaries.
    PERFORM * FROM (
        SELECT Name, DateOfBirth, Salary
        FROM LibraryEmployee
        ORDER BY Salary DESC
        LIMIT 100
    ) AS result;

    -- Record the end time
    end_time := clock_timestamp();
    
    -- Calculate and log the duration
    duration := end_time - start_time;
    RAISE NOTICE 'Query Time: %', duration;
END $$;
