/*--1.Retrieve the titles and publication years of all books published after 2000, ordered by publication year (newest first).
SELECT title, publication_year
FROM books
WHERE publication_year > 2000
ORDER BY publication_year DESC;


--2.Find all books with more than 5 copies owned in the fiction genre (genre_id = 1).
SELECT title, genre_id, copies_owned
FROM books
WHERE genre_id = 1
	AND copies_owned > 5;
	
	
-- 3.List all books whose titles contain the word "History".
SELECT book_id, title
FROM books
WHERE title like '%History%';


-- 4.Display loan information (loan_id, checkout_date, due_date) along with patron details (first_name, last_name, email) for all loans made in January 2023.
SELECT loans.loan_id, checkout_date, due_date, patrons.first_name, last_name, email
FROM loans
JOIN patrons
ON loans.patron_id = patrons.patron_id
WHERE checkout_date BETWEEN '2023-01-01' AND '2023-01-31';


--5.Show book details (title, author's full name, genre_name) for each loan, along with the checkout_date and due_date.

SELECT books.title, 
	authors.first_name, last_name, 
	genres.genre_name, 
	loans.checkout_date, due_date
FROM books
INNER JOIN authors
	ON books.author_id = authors.author_id
INNER JOIN genres
	ON books.genre_id = genres. genre_id
INNER JOIN loans
	ON books.book_id = loans.book_id 
	ORDER BY title ASC;


--6.Find pairs of patrons who live in the same city. Show both patrons' names and their city.

SELECT
  p1.first_name AS patron1_first_name,
  p1.last_name  AS patron1_last_name,
  p2.first_name AS patron2_first_name,
  p2.last_name  AS patron2_last_name,
  p1.city
FROM patrons p1
JOIN patrons p2
  ON p1.city = p2.city
  AND p1.patron_id < p2.patron_id   
ORDER BY p1.city, patron1_first_name, patron2_first_name;

*/

/*--7. Find all fiction books (genre_id = 1) that have been borrowed, along with the patron name and the branch where they were borrowed from.
SELECT genres.genre_id,
	genres.genre_name,
	patrons.first_name,
	patrons.last_name,
	branches.branch_name,
	branches.city
FROM genres
JOIN books
	ON genres.genre_id = books.genre_id
JOIN loans
	ON loans.book_id = books.book_id
JOIN branches
	ON branches.branch_id = loans.branch_id
JOIN patrons 
	ON patrons.branch_id = loans.branch_id
	WHERE genres.genre_id = 1;


--8. COUNT aggregation: Count the number of books in each genre category.

SELECT 
	genres.genre_id,
	genres.genre_name,
	COUNT(books.book_id) AS "Number of Books"
FROM genres
LEFT JOIN books
	ON genres.genre_id = books.genre_id
GROUP BY genres.genre_name;



--9.Calculate the average, minimum, and maximum loan duration (days between checkout and return) for each library branch. Include only returned books.
SELECT 
	branches.branch_id,
	branches.branch_name,
	ROUND(AVG(julianday(loans.return_date) - julianday(loans.checkout_date))) AS Average,
	round(MIN(julianday(loans.return_date) - julianday(loans.checkout_date))) AS Shortest,
	round(MAX(julianday(loans.return_date) - julianday(loans.checkout_date))) AS Longest
FROM loans
JOIN branches
	ON loans.branch_id = branches.branch_id
WHERE loans.return_date IS NOT NULL
group by branches.branch_id, branches.branch_name;


--10.Find patrons with overdue books (due_date < CURRENT_DATE and return_date = ' '), along with the count of overdue books they have.

SELECT
    p.patron_id,
    p.first_name,
    p.last_name,
    COUNT(l.loan_id) AS overdue_count
FROM patrons p
JOIN loans l
    ON p.patron_id = l.patron_id
WHERE l.due_date < CURRENT_DATE
  AND (l.return_date IS NULL OR l.return_date = '')
GROUP BY p.patron_id, p.first_name, p.last_name
HAVING COUNT(l.loan_id) > 0
ORDER BY overdue_count DESC;


--11.Analyze monthly borrowing trends. Show the year, month, number of loans, and number of unique patrons for each month.
SELECT
    SUBSTR(l.checkout_date, 1, 4) AS loan_year,
    SUBSTR(l.checkout_date, 6, 2) AS loan_month,
    COUNT(l.loan_id) AS total_loans,
    COUNT(DISTINCT l.patron_id) AS unique_patrons
FROM loans l
GROUP BY SUBSTR(l.checkout_date, 1, 4),
         SUBSTR(l.checkout_date, 6, 2)
ORDER BY loan_year, loan_month;

*/



	
	
	

	
