-- Retrieve the Post that has the highest
-- score, summed over itself and all its children
-- 1.1 marks: <8 operators
-- 1.0 marks: <10 operators
-- 0.9 marks: <12 operators
-- 0.8 marks: correct answer

SELECT Parent.Id AS Id, SUM(Child.Score) + Parent.Score AS FamilyScore
FROM Post AS Parent
INNER JOIN Post AS Child ON Child.ParentId = Parent.Id
GROUP BY Child.ParentId
ORDER BY FamilyScore DESC
LIMIT 1;
