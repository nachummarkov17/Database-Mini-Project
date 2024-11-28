@echo off
:: Prompt for PostgreSQL username
set /p DB_USER=Enter your PostgreSQL username: 

:: Database name and output file
set DB_NAME=library_employees_db
set OUTPUT_FILE=database_dump.sql

:: Full path to PostgreSQL's pg_dump.exe
set PG_DUMP_PATH="C:\Program Files\PostgreSQL\17\bin\pg_dump.exe"

:: Execute the dump command
%PG_DUMP_PATH% -U %DB_USER% -d %DB_NAME% -F p -f %OUTPUT_FILE%

:: Check if the dump command was successful
if %ERRORLEVEL%==0 (
    echo Database dump complete! File saved as %OUTPUT_FILE%
) else (
    echo Database dump failed. Please check your configuration and try again.
)

:: Pause to allow the user to see the output
pause
