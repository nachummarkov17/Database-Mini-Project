-- Function #1:
CREATE FUNCTION GetTopEmployeesBySalary(n INT)
RETURNS TABLE(Name VARCHAR(255), DateOfBirth DATE, Salary INT)
AS $$
BEGIN
    RETURN QUERY 
    SELECT LibraryEmployee.Name, LibraryEmployee.DateOfBirth, LibraryEmployee.Salary
    FROM LibraryEmployee
    ORDER BY Salary DESC
    LIMIT n;
END;
$$ LANGUAGE plpgsql;


-- Function #2:
CREATE FUNCTION GetSalaryStatistics()
RETURNS TABLE(AverageSalary DOUBLE PRECISION, MinimumSalary INT, MaximumSalary INT)
AS $$
BEGIN
    RETURN QUERY
    SELECT 
        AVG(Salary)::DOUBLE PRECISION AS AverageSalary,
        MIN(Salary) AS MinimumSalary,
        MAX(Salary) AS MaximumSalary
    FROM LibraryEmployee;
END;
$$ LANGUAGE plpgsql;

-- Function #3:
CREATE FUNCTION GetLibrariansByExperience(threshold INT)
RETURNS TABLE(ID INT, Name VARCHAR(255), Expertise VARCHAR(255), YearsOfExperience INT)
AS $$
BEGIN
    RETURN QUERY
    SELECT 
        l.ID, 
        le.Name, 
        l.Expertise, 
        l.YearsOfExperience
    FROM Librarian l
    JOIN LibraryEmployee le ON l.ID = le.ID
    WHERE l.YearsOfExperience > threshold;
END;
$$ LANGUAGE plpgsql;

-- Function #4:
CREATE FUNCTION GetPlatformsByRating(rating INT)
RETURNS TABLE(Platform VARCHAR(255), Username VARCHAR(255), FollowerCount INT)
AS $$
BEGIN
    RETURN QUERY
    SELECT 
        sm.Platform, 
        m.Username, 
        m.FollowerCount
    FROM Manages m
    JOIN SocialMedia sm ON m.Platform = sm.Platform
    WHERE sm.DistributionRating >= rating;
END;
$$ LANGUAGE plpgsql;
