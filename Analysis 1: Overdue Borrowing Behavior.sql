WITH base AS (
    SELECT CONCAT_WS('  ',M.first_name, M.last_name) AS member, 
           	    M.email,
                 M.phone,
                 B.title,
                 B.isbn,
                 BR.id AS borrowing_id,
                 BR.due_date,
                 BR.return_date
    FROM BORROWINGS BR
    JOIN MEMBERS M ON BR.member_id = M.id
    JOIN BOOKS B ON BR.book_id = B.id
    WHERE BR.return_date IS NOT NULL
    AND CAST(BR.return_date AS DATE) > CAST(BR.due_date AS DATE)
    ),
gap_days AS (
    SELECT *,
DATEDIFF('day', CAST(due_date AS DATE), CAST(return_date AS DATE)) AS overdue_days
     FROM base
    )
SELECT *
FROM (SELECT *,
             		CASE
                		WHEN overdue_days = 1 THEN 'Minor Delay'
                		WHEN overdue_days = 2 THEN 'Short Delay'
                		WHEN overdue_days = 3 THEN 'Moderate Delay'
                		WHEN overdue_days = 4 THEN 'Significant Delay'
                		WHEN overdue_days = 5 THEN 'Severe Delay'
                		ELSE 'Critical Delay'
            		END AS classification 
      FROM gap_days) T
WHERE classification = 'Severe Delay'
