drop table books
CREATE TABLE books 
	(
		book_id INT identity(1,1) NOT NULL,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
('Where Im Calling From: Selected Stories', 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

select CONCAT_WS('--',author_fname, ' ',author_lname) from books --separator between objects exlamation

select SUBSTRING('Hello word',2, 3) -- from second and takes 3 letters substract the rest of letters

select SUBSTRING(title,1, 15) from books

select concat(SUBSTRING(title, 1, 10), '...') from books

select replace ('i am Colt!', 'Colt', 'Mr Steele!')

select replace (title, ' ', '-') from books -- we do not alter anything, just retrieve difference during selecting

select concat(author_fname, reverse(author_fname)) from books

select concat(title, ' is ', len(title), ' characters long') from books

select upper('hello')

select upper('helloo')

select REPLACE(title, ' ', '->') from books
select concat(upper(author_fname),' ', upper(author_lname)) as full_name from books


select concat('i love', upper(title), ' !!!') from books

select INSERT('Hello Bobby', 6, 0,'There') -- WHERE  to replace, second number stands for how many chars replace

select left(title, 1) from books
select repeat('ha', 3) 


select concat(SUBSTRING(title, 1, 10),'...'), CONCAT(author_lname, ',', author_fname),
concat(stock_quantity, ' in stock')
from books