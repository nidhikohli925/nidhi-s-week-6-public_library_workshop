/*--Retrieve the titles and publication years of all books published after 2000, ordered by publication year (newest first).
SELECT title, publication_year
FROM books
WHERE publication_year > 2000
ORDER BY publication_year DESC;

--Find all books with more than 5 copies owned in the fiction genre (genre_id = 1).
SELECT title, genre_id, copies_owned
FROM books
WHERE genre_id = 1
	AND copies_owned > 5;
	
	
-- List all books whose titles contain the word "History".
SELECT book_id, title
FROM books
WHERE title like '%History%';


-- Display loan information (loan_id, checkout_date, due_date) along with patron details (first_name, last_name, email) for all loans made in January 2023.
SELECT loans.loan_id, checkout_date, due_date, patrons.first_name, last_name, email
FROM loans
JOIN patrons
ON loans.patron_id = patrons.patron_id
WHERE checkout_date BETWEEN '2023-01-01' AND '2023-01-31';

--Show book details (title, author's full name, genre_name) for each loan, along with the checkout_date and due_date.

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
	


-- Find pairs of patrons who live in the same city. Show both patrons' names and their city.
	
SELECT patrons.first_name AS name, patrons.first_name AS city
FROM
	
	
*/

--Find all fiction books (genre_id = 1) that have been borrowed, along with the patron name and the branch where they were borrowed from.


	
	
	
	