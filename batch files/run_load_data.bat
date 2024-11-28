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

REM Absolute path for Librarians (assuming it's in the same directory as the batch file)
set LIBRARIANS_CSV=%CURRENT_DIR%\librarians.csv

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

echo -- Commit the transaction >> temp_load_data.sql
echo COMMIT; >> temp_load_data.sql

REM Run the SQL script using psql
psql -U postgres -d library_employees_db -f temp_load_data.sql

REM Clean up by deleting the temporary SQL file
del temp_load_data.sql
