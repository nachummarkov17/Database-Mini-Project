-- Disconnect from the current database before dropping it
\c postgres;

-- Drop the database
DROP DATABASE IF EXISTS library_employees_db;
