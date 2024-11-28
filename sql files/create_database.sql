-- Check if the database already exists, and drop it if needed
DO $$ 
BEGIN
    IF EXISTS (SELECT 1 FROM pg_database WHERE datname = 'library_employees_db') THEN
        PERFORM pg_terminate_backend(pid)
        FROM pg_stat_activity
        WHERE datname = 'library_employees_db';
        DROP DATABASE library_employees_db;
    END IF;
END $$;

-- Create the database
CREATE DATABASE library_employees_db;
