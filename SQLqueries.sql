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