-- Retrieve the display names of every user
-- who has received the Badge that has been
-- awarded the most times, excluding those badges
-- that have been awarded over ten thousand times.
-- Order the result in descending order.
-- 1.1 marks: <12 operators
-- 1.0 marks: <15 operators
-- 0.9 marks: <20 operators
-- 0.8 marks: correct answer

SELECT User.DisplayName
FROM User
JOIN Badge
ON User.Id = Badge.UserId AND Badge.Name = (
  SELECT Name
  FROM Badge
  GROUP BY Name
  HAVING COUNT(*) <= 10000
  ORDER BY COUNT(*) DESC LIMIT 1)
GROUP BY User.DisplayName
ORDER BY User.DisplayName DESC;
