-- Challenge 1 - Who Have Published What At Where? 
SELECT A.au_id AS Author_ID, A.au_lname AS LAST_NAME, A.au_fname AS FIRST_NAME, T.title AS TITLE, P.pub_name AS PUBLISHER_NAME
FROM titleauthor
JOIN authors as A
ON A.au_id = titleauthor.au_id
JOIN titles AS T
ON T.title_id = titleauthor.title_id
JOIN publishers as P
ON P.pub_id = T.pub_id;

-- Challenge 2 - Who Have Published How Many At Where? 
SELECT A.au_id AS Author_ID, A.au_lname AS LAST_NAME, A.au_fname AS FIRST_NAME, count(T.title) AS title_count, P.pub_name AS PUBLISHER_NAME
FROM titleauthor
JOIN authors as A
ON A.au_id = titleauthor.au_id
JOIN titles AS T
ON T.title_id = titleauthor.title_id
JOIN publishers as P
ON P.pub_id = T.pub_id
GROUP BY PUBLISHER_NAME, Author_ID, LAST_NAME, FIRST_NAME;

-- Challenge 3 - Best Selling Authors

SELECT A.au_id AS Author_ID, A.au_lname AS LAST_NAME, A.au_fname AS FIRST_NAME, T.title, P.pub_name AS PUBLISHER_NAME, qty 
FROM titleauthor
JOIN authors as A
ON A.au_id = titleauthor.au_id
JOIN titles AS T
ON T.title_id = titleauthor.title_id
JOIN publishers as P
ON P.pub_id = T.pub_id
JOIN sales AS S 
ON  T.title_id = S.title_id
ORDER BY qty DESC
LIMIT 3; 

-- Challenge 4 - Best Selling Authors RANKING
SELECT A.au_id AS Author_ID, A.au_lname AS LAST_NAME, A.au_fname AS FIRST_NAME, sum(qty) AS agg_TOTAL
FROM titleauthor -- LEFT TABLE (A)
JOIN authors as A
ON A.au_id = titleauthor.au_id
JOIN titles AS T
ON T.title_id = titleauthor.title_id
JOIN publishers as P
ON P.pub_id = T.pub_id
LEFT JOIN sales AS S 
ON  T.title_id = S.title_id
GROUP BY Author_ID
ORDER BY agg_TOTAL DESC;


