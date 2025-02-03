DO $$ 
DECLARE
    start_time TIMESTAMP;
    end_time TIMESTAMP;
    duration INTERVAL;
BEGIN
    -- Record the start time
    start_time := clock_timestamp();
    
DELETE FROM LibraryEmployee AS le
WHERE le.ID IN (
    SELECT ae.ID
    FROM Security, ArchiveEmployees AS ae
    WHERE Security.ID = ae.ID AND ClearanceLevel < 4 AND Area = 'Archives'
);

    -- Record the end time
    end_time := clock_timestamp();
    
    -- Calculate and log the duration
    duration := end_time - start_time;
    RAISE NOTICE 'Query Time: %', duration;
END $$;
