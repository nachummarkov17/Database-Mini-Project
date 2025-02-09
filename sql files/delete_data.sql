-- Begin the transaction
BEGIN;

-- Truncate all tables to remove all data

TRUNCATE TABLE LibraryEmployee RESTART IDENTITY CASCADE;
TRUNCATE TABLE StoreOperator RESTART IDENTITY CASCADE;
TRUNCATE TABLE Librarian RESTART IDENTITY CASCADE;
TRUNCATE TABLE Security RESTART IDENTITY CASCADE;
TRUNCATE TABLE DeskPersonnel RESTART IDENTITY CASCADE;
TRUNCATE TABLE Marketer RESTART IDENTITY CASCADE;
TRUNCATE TABLE SocialMedia RESTART IDENTITY CASCADE;
TRUNCATE TABLE Manages RESTART IDENTITY CASCADE;
TRUNCATE TABLE Archival_Assignment RESTART IDENTITY CASCADE;
TRUNCATE TABLE Upkeep RESTART IDENTITY CASCADE;
TRUNCATE TABLE Shelf RESTART IDENTITY CASCADE;
TRUNCATE TABLE Disposal RESTART IDENTITY CASCADE;
TRUNCATE TABLE Archive_ RESTART IDENTITY CASCADE;
TRUNCATE TABLE Book RESTART IDENTITY CASCADE;
TRUNCATE TABLE Conservator RESTART IDENTITY CASCADE;


-- Commit the transaction
COMMIT;
