DO $$ 
DECLARE
    start_time TIMESTAMP;
    end_time TIMESTAMP;
    duration INTERVAL;
    rows_affected INT; -- For UPDATE/DELETE
BEGIN
    -- Record the start time
    start_time := clock_timestamp();
    
    -- Query Section
    PERFORM * FROM (
        SELECT Name, DateOfBirth, Salary
        FROM LibraryEmployee
        ORDER BY Salary DESC
    ) AS result;

    -- Record the end time
    end_time := clock_timestamp();
    
    -- Calculate and log the duration
    duration := end_time - start_time;
    RAISE NOTICE 'Query Time: %', duration;
END $$;
