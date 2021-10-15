-- DELIVERABLE #1
-- creating a table to hold all employees retiring
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	titles.title,
	titles.from_date,
	titles.to_date
INTO retirement_titles
FROM employees AS e
LEFT JOIN titles
ON (e.emp_no = titles.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_title
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

--retiring count by department
SELECT COUNT(emp_no), title
INTO retiring_titles_tbl
FROM unique_title
GROUP BY title
ORDER BY COUNT DESC

-- DELIVERABLE #2
-- mentorship eligibility table

SELECT DISTINCT ON(e.emp_no) e.emp_no, 
	e.first_name, 
	e.last_name, 
	e.birth_date,
	de.from_date,
	de.to_date,
	titles.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dep_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles
ON (e.emp_no = titles.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no





