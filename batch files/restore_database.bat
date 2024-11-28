@echo off

psql -U %USERNAME% -f database_dump.sql

if %ERRORLEVEL% equ 0 (
    echo Database restored successfully!
) else (
    echo Failed to restore the database. Please check the dump file and credentials.
)

pause
