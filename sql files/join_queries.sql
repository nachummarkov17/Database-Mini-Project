-- Query #13: Retrieve the names, salaries, and years of experience of librarians who work in the "Children" section of the library.
SELECT le.Name, le.Salary, l.YearsOfExperience
FROM LibraryEmployee le
JOIN Librarian l ON le.ID = l.ID
WHERE l.Section = 'Children';


-- Query #14: Retrieve the names, roles, clearance levels, and salaries of security personnel assigned to the "Archive" area.
SELECT le.Name, s.Role, s.ClearanceLevel, le.Salary
FROM LibraryEmployee le
JOIN Security s ON le.ID = s.ID
WHERE s.Area = 'Archive';


-- Query #15: Retrieve the specializations, usernames, and follower counts of marketers managing social media platforms with a distribution rating of 4 or higher.
SELECT m.Specialisation, ma.Username, ma.FollowerCount
FROM Marketer m
JOIN Manages ma ON m.ID = ma.MarketerID
JOIN SocialMedia sm ON ma.Platform = sm.Platform
WHERE sm.DistributionRating >= 4;

