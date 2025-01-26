@echo off
REM Get the current directory where the batch script is located
for /f "delims=" %%i in ('cd') do set CURRENT_DIR=%%i

REM Define the path to the CSV files
set CSV_PATH=%CURRENT_DIR%\..\csv files

REM Define the full absolute paths for the CSV files
set LIBRARY_EMPLOYEES_CSV=%CSV_PATH%\library_employees.csv
set STORE_OPERATORS_CSV=%CSV_PATH%\store_operators.csv
set SECURITY_CSV=%CSV_PATH%\security.csv
set DESK_PERSONNEL_CSV=%CSV_PATH%\desk_personnel.csv
set MARKETERS_CSV=%CSV_PATH%\marketers.csv
set SOCIAL_MEDIA_CSV=%CSV_PATH%\social_medias.csv
set MANAGES_CSV=%CSV_PATH%\manages.csv
set LIBRARIANS_CSV=%CSV_PATH%\librarians.csv
set ARCHIVAL_ASSIGNMENTS_CSV=%CSV_PATH%\archival_assignments.csv
set ARCHIVES_CSV=%CSV_PATH%\archives.csv
set BOOKS_CSV=%CSV_PATH%\books.csv
set CONSERVATORS_CSV=%CSV_PATH%\conservators.csv
set DISPOSALS_CSV=%CSV_PATH%\disposals.csv
set SHELVES_CSV=%CSV_PATH%\shelves.csv
set UPKEEPS_CSV=%CSV_PATH%\upkeeps.csv

REM Write SQL queries to a temporary file
echo BEGIN; > temp_load_data.sql
echo. >> temp_load_data.sql

echo -- Load data into LibraryEmployee >> temp_load_data.sql
echo COPY LibraryEmployee(ID, Name, DateOfBirth, Salary, ExpirationOfContract) FROM '%LIBRARY_EMPLOYEES_CSV%' WITH (FORMAT csv, HEADER, DELIMITER ','); >> temp_load_data.sql
echo. >> temp_load_data.sql

echo -- Load data into StoreOperator >> temp_load_data.sql
echo COPY StoreOperator(ID, StoreType, StoreName, StoreLocation) FROM '%STORE_OPERATORS_CSV%' WITH (FORMAT csv, HEADER, DELIMITER ','); >> temp_load_data.sql
echo. >> temp_load_data.sql

echo -- Load data into Librarian >> temp_load_data.sql
echo COPY Librarian(ID, Section, Expertise, YearsOfExperience) FROM '%LIBRARIANS_CSV%' WITH (FORMAT csv, HEADER, DELIMITER ','); >> temp_load_data.sql
echo. >> temp_load_data.sql

echo -- Load data into Security >> temp_load_data.sql
echo COPY Security(ID, Area, Role, ClearanceLevel) FROM '%SECURITY_CSV%' WITH (FORMAT csv, HEADER, DELIMITER ','); >> temp_load_data.sql
echo. >> temp_load_data.sql

echo -- Load data into DeskPersonnel >> temp_load_data.sql
echo COPY DeskPersonnel(ID, Workstation, DeskNumber, Floor) FROM '%DESK_PERSONNEL_CSV%' WITH (FORMAT csv, HEADER, DELIMITER ','); >> temp_load_data.sql
echo. >> temp_load_data.sql

echo -- Load data into Marketer >> temp_load_data.sql
echo COPY Marketer(ID, Specialisation, Certification, CreativeSkill) FROM '%MARKETERS_CSV%' WITH (FORMAT csv, HEADER, DELIMITER ','); >> temp_load_data.sql
echo. >> temp_load_data.sql

echo -- Load data into SocialMedia >> temp_load_data.sql
echo COPY SocialMedia(Platform, DistributionRating) FROM '%SOCIAL_MEDIA_CSV%' WITH (FORMAT csv, HEADER, DELIMITER ','); >> temp_load_data.sql
echo. >> temp_load_data.sql

echo -- Load data into Manages >> temp_load_data.sql
echo COPY Manages(MarketerID, Platform, Username, FollowerCount, TargetAudience) FROM '%MANAGES_CSV%' WITH (FORMAT csv, HEADER, DELIMITER ','); >> temp_load_data.sql
echo. >> temp_load_data.sql

echo -- Load data into Conservator >> temp_load_data.sql
echo COPY Conservator(ID, Duty) FROM '%CONSERVATORS_CSV%' WITH (FORMAT csv, HEADER, DELIMITER ','); >> temp_load_data.sql
echo. >> temp_load_data.sql

echo -- Load data into Book >> temp_load_data.sql
echo COPY Book(Book_ID, Title, Author, Rarity, Genre) FROM '%BOOKS_CSV%' WITH (FORMAT csv, HEADER, DELIMITER ','); >> temp_load_data.sql
echo. >> temp_load_data.sql

echo -- Load data into Archive_ >> temp_load_data.sql
echo COPY Archive_(Archive_Number, Book_Type, Capacity) FROM '%ARCHIVES_CSV%' WITH (FORMAT csv, HEADER, DELIMITER ','); >> temp_load_data.sql
echo. >> temp_load_data.sql

echo -- Load data into Disposal >> temp_load_data.sql
echo COPY Disposal(Disposal_ID, Book_ID, Conservator_ID, Method, Material_of_Book, Date) FROM '%DISPOSALS_CSV%' WITH (FORMAT csv, HEADER, DELIMITER ','); >> temp_load_data.sql
echo. >> temp_load_data.sql

echo -- Load data into Shelf >> temp_load_data.sql
echo COPY Shelf(Archive_Number, Shelf_Number) FROM '%SHELVES_CSV%' WITH (FORMAT csv, HEADER, DELIMITER ','); >> temp_load_data.sql
echo. >> temp_load_data.sql

echo -- Load data into Upkeep >> temp_load_data.sql
echo COPY Upkeep(Upkeep_ID, Book_ID, Conservator_ID, Tools_Used, Reason_for_Upkeep, Date) FROM '%UPKEEPS_CSV%' WITH (FORMAT csv, HEADER, DELIMITER ','); >> temp_load_data.sql
echo. >> temp_load_data.sql

echo -- Load data into Archival_Assignment >> temp_load_data.sql
echo COPY Archival_Assignment(Assignment_ID, Date, Book_ID, Old_Archive_Room, Old_Shelf, New_Archive_Room, New_Shelf, Conservator_ID) FROM '%ARCHIVAL_ASSIGNMENTS_CSV%' WITH (FORMAT csv, HEADER, DELIMITER ','); >> temp_load_data.sql
echo. >> temp_load_data.sql

echo -- Commit the transaction >> temp_load_data.sql
echo COMMIT; >> temp_load_data.sql

REM Run the SQL script using psql
psql -U postgres -d library_employees_db -f temp_load_data.sql

REM Clean up by deleting the temporary SQL file
del temp_load_data.sql
