@echo off
set /p USERNAME="Enter your PostgreSQL username: "
set /p PASSWORD="Enter your PostgreSQL password (if required): "

psql -U %USERNAME% -f database_dump.sql

if %ERRORLEVEL% equ 0 (
    echo Database restored successfully!
) else (
    echo Failed to restore the database. Please check the dump file and credentials.
)

pause
