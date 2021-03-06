--1. What grades are stored in the database?

SELECT * FROM Grade

--2. What emotions may be associated with a poem?

SELECT * FROM Emotion

--3. How many poems are in the database?

SELECT 
COUNT(Id) AS NumPoems 
FROM Poem

--4. Sort authors alphabetically by name. What are the names of the top 76 authors?

SELECT TOP 76 
Author.Name 
FROM Author

--5. Starting with the above query, add the grade of each of the authors.

SELECT TOP 76
Author.Name,
Grade.Name
FROM Author
JOIN Grade ON Author.GradeId = Grade.Id

--6. Starting with the above query, add the recorded gender of each of the authors.

SELECT TOP 76
Author.Name,
Grade.Name,
Gender.Name
FROM Author
JOIN Grade ON Author.GradeId = Grade.Id
JOIN Gender ON Author.GenderId = Gender.Id

--7. What is the total number of words in all poems in the database?

SELECT
SUM(Poem.WordCount) AS WordCount
FROM Poem

--8. Which poem has the fewest characters?
SELECT TOP 1 *
FROM Poem
ORDER BY Poem.CharCount

--9. How many authors are in the third grade?
SELECT 
COUNT(Author.Id) AS NumAuthors
FROM Author
JOIN Grade ON Author.GradeId = Grade.Id
WHERE Grade.Name = '3rd Grade';

--10. How many total authors are in the first through third grades?
SELECT
COUNT(Author.ID) AS NumAuthors
FROM Author
JOIN Grade ON Author.GradeId = Grade.Id
WHERE Grade.Name = '1st Grade' OR Grade.Name = '2nd Grade' OR Grade.Name = '3rd Grade'

--11. What is the total number of poems written by fourth graders?
SELECT
COUNT(Poem.Id) AS NumPoems
FROM Poem
JOIN Author ON Poem.AuthorId = Author.Id
JOIN Grade ON Author.GradeId = Author.GradeId
WHERE Grade.Name = '4th Grade';

--12. How many poems are there per grade?
SELECT
COUNT(Poem.Id) AS NumPoems,
Grade.Name
FROM Poem
JOIN Author ON Poem.AuthorId = Author.Id
JOIN Grade ON Author.GradeId = Grade.Id
GROUP BY Grade.Id, Grade.Name

--13. How many authors are in each grade?
SELECT
COUNT(Author.Id) AS NumAuthors,
Grade.Name
FROM Author
JOIN Grade ON Author.GradeId = Grade.Id
GROUP BY Grade.Name;

--14. What is the title of the poem that has the most words?
SELECT TOP 1
Poem.Title
FROM Poem
ORDER BY Poem.WordCount DESC

--15. Which author(s) have the most poems? 
SELECT TOP 10
Author.Name,
COUNT(Poem.AuthorId) AS NumPoems
FROM Poem
JOIN Author ON Poem.AuthorId = Author.Id
GROUP BY Author.Id, Author.Name
ORDER BY COUNT(Poem.AuthorId) DESC

--16. How many poems have an emotion of sadness?
SELECT
COUNT(PoemEmotion.PoemId) AS NumPoems
FROM PoemEmotion
JOIN Emotion ON PoemEmotion.EmotionId = Emotion.Id
WHERE Emotion.Name = 'Sadness'

--17. How many poems are not associated with any emotion?
SELECT
COUNT(Poem.Id) AS NumPoems
FROM Poem
LEFT JOIN PoemEmotion ON PoemEmotion.PoemId = Poem.Id
WHERE PoemEmotion.Id IS NULL

--18. Which emotion is associated with the least number of poems?
SELECT TOP 1
COUNT(PoemEmotion.Id) AS NumPoems,
Emotion.Name
FROM PoemEmotion
JOIN Emotion ON PoemEmotion.EmotionId = Emotion.Id
GROUP BY Emotion.Id, Emotion.Name
ORDER BY Count(PoemEmotion.Id)

--19. Which grade has the largest number of poems with an emotion of joy?
SELECT TOP 1
COUNT(PoemEmotion.PoemId) AS NumPoems,
Emotion.Name AS 'Emotion',
Grade.Name AS 'Grade'
FROM PoemEmotion
JOIN Emotion ON PoemEmotion.EmotionId = Emotion.Id
JOIN Poem ON PoemEmotion.PoemId = Poem.Id
JOIN Author ON Poem.AuthorId = Author.Id
JOIN Grade ON Author.GradeId = Grade.Id
GROUP BY Emotion.Name, Grade.Name
HAVING Emotion.Name = 'Joy'
ORDER BY COUNT(PoemEmotion.PoemId) DESC

--20. Which gender has the least number of poems with an emotion of fear?
SELECT TOP 1
COUNT(PoemEmotion.PoemId) AS NumPoems,
Emotion.Name AS 'Emotion',
Gender.Name AS 'Gender'
FROM PoemEmotion
JOIN Emotion ON PoemEmotion.EmotionId = Emotion.Id
JOIN Poem ON PoemEmotion.PoemId = Poem.Id
JOIN Author ON Poem.AuthorId = Author.Id
JOIN Gender ON Author.GenderId = Gender.Id
GROUP BY Emotion.Name, Gender.Name
HAVING Emotion.Name = 'Fear'
ORDER BY COUNT(PoemEmotion.PoemId) ASC