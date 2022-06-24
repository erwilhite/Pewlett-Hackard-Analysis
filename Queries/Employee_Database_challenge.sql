--Deliverable 1

SELECT e.emp_no, 
	e.first_name, 
	e.last_name, 
	t.title, 
	t.from_date, 
	t.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles t 
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '01/01/1952' AND '12/31/1955')
ORDER BY e.emp_no;

SELECT * FROM retirement_titles

SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	rt.first_name, 
	rt.last_name, 
	rt.title
INTO unique_titles
FROM retirement_titles AS rt
WHERE rt.to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles

SELECT COUNT (ut.emp_no), ut.title
INTO retiring_titles 
FROM unique_titles AS ut
GROUP BY title
ORDER BY COUNT (title) DESC;

SELECT * FROM retiring_titles

--Deliverable 2

SELECT DISTINCT ON (e.emp_no) e.emp_no, 
	e.first_name, 
	e.last_name, 
	e.birth_date, 
	d.from_date, 
	d.to_date, 
	t.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS d ON (e.emp_no = d.emp_no)
INNER JOIN titles AS t ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '01/01/1965' AND '12/31/1965')
AND (d.to_date = '9999-01-01')
ORDER BY e.emp_no

SELECT * FROM mentorship_eligibility