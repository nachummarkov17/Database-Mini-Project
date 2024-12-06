-- Query #13:
SELECT le.Name, le.Salary, l.YearsOfExperience
FROM LibraryEmployee le
JOIN Librarian l ON le.ID = l.ID
WHERE l.Section = 'Children';


-- Query #14:
SELECT le.Name, s.Role, s.ClearanceLevel, le.Salary
FROM LibraryEmployee le
JOIN Security s ON le.ID = s.ID
WHERE s.Area = 'Archive';


-- Query #15:
SELECT m.Specialisation, ma.Username, ma.FollowerCount
FROM Marketer m
JOIN Manages ma ON m.ID = ma.MarketerID
JOIN SocialMedia sm ON ma.Platform = sm.Platform
WHERE sm.DistributionRating >= 4;

