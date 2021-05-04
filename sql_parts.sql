-- Question 6
SELECT * FROM books WHERE publishing_year < 1985

-- Question 7
SELECT * FROM books
JOIN authors ON books.author_id = authors.id
WHERE authors.name = "Jules Verne"
ORDER BY books.publishing_year DESC
LIMIT 3
