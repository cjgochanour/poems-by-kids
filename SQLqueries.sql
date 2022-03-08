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
COUNT(Poem.WordCount) AS WordCount
FROM Poem

--8. Which poem has the fewest characters?
SELECT TOP 1 *
FROM Poem
ORDER BY Poem.CharCount

--9. How many authors are in the third grade?
SELECT 
COUNT(Author.Id)
FROM Author
JOIN Grade ON Author.GradeId = Grade.Id
WHERE Grade.Name = '3rd Grade';

--10. How many total authors are in the first through third grades?
SELECT
COUNT(Author.ID)
FROM Author
JOIN Grade ON Author.GradeId = Grade.Id
WHERE Grade.Name = '1st Grade' OR Grade.Name = '2nd Grade' OR Grade.Name = '3rd Grade'