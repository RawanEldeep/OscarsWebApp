-- 1. Show the total nominations and oscars for a given director, actor, or singer
-- Replace 'Directed by', 'Christopher', and 'Nolan' as needed
SELECT w.Role, n.FName, n.MName, n.LName, 
       COUNT(*) AS TotalNominations, 
       SUM(CASE WHEN n.IsGranted = 1 THEN 1 ELSE 0 END) AS TotalOscarsWon
FROM nomination n
JOIN worksat w ON n.FName = w.FName AND n.LName = w.LName AND n.Title = w.Title AND n.ReleaseDate = w.ReleaseDate
WHERE w.Role = 'Director' AND n.FName = 'Frank' AND n.LName = 'Borzage'
GROUP BY w.Role, n.FName, n.MName, n.LName;

-- 2. Show the top 5 birth countries for actors who won the best actor category
SELECT p.CountryOfBirth, COUNT(*) AS WinCount
FROM nomination n
JOIN person p ON n.FName = p.FName AND n.LName = p.LName
WHERE n.IsGranted = 1 AND n.Category = 'Best Actor'
GROUP BY p.CountryOfBirth
ORDER BY WinCount DESC;


-- 3. Show all nominated staff members born in a given country, with stats
-- Replace 'USA' as needed
SELECT n.FName, n.MName, n.LName, n.Category, 
       COUNT(*) AS TotalNominations, 
       SUM(CASE WHEN n.IsGranted = 1 THEN 1 ELSE 0 END) AS TotalWins
FROM nomination n
JOIN person p ON n.FName = p.FName AND n.LName = p.LName
WHERE p.CountryOfBirth LIKE '%USA%' OR p.CountryOfBirth LIKE '%U.S%'
GROUP BY n.FName, n.MName, n.LName, n.Category
ORDER BY TotalWins DESC;


-- 4. Dream Team - cast members who won the most Oscars in specific roles
SELECT Role, FName, MName, LName, TotalWins FROM (
  SELECT w.Role, n.FName, n.MName, n.LName,
         SUM(CASE WHEN n.IsGranted = 1 THEN 1 ELSE 0 END) AS TotalWins,
         RANK() OVER (PARTITION BY w.Role ORDER BY SUM(CASE WHEN n.IsGranted = 1 THEN 1 ELSE 0 END) DESC) AS rnk
  FROM nomination n
  JOIN worksat w ON n.FName = w.FName AND n.LName = w.LName AND n.Title = w.Title AND n.ReleaseDate = w.ReleaseDate
  WHERE w.Role IN ('Dirctor', 'Actor', 'Producer', 'Composer', 'Cinematographer', 'Screenwriter', 'Writter')
  GROUP BY w.Role, n.FName, n.MName, n.LName
) AS ranked
WHERE rnk = 1;

-- 5. Top 5 production companies by won Oscars
SELECT mp.ProductionCompany, COUNT(*) AS Wins
FROM nomination n
JOIN movieproductioncom mp ON n.Title = mp.Title AND n.ReleaseDate = mp.ReleaseDate
WHERE n.IsGranted = 1
GROUP BY mp.ProductionCompany
ORDER BY Wins DESC
LIMIT 5;

-- 6. Non-English speaking movies that won an Oscar
SELECT m.Title, m.ReleaseDate, n.Year, m.Language
FROM nomination n
JOIN movie m ON n.Title = m.Title AND n.ReleaseDate = m.ReleaseDate
WHERE n.IsGranted = 1 
  AND m.Language NOT LIKE '%English%'
  AND m.Language IS NOT NULL
  AND m.Language <> '';