WITH base AS (
        SELECT B.genre,
                     BR.id AS borrowing_id,
        		       DATEDIFF('day', CAST(BR.borrow_date AS DATE), CAST(BR.return_date AS
       DATE)) AS gap_days
        FROM BOOKS B
        LEFT JOIN BORROWINGS BR ON B.id = BR.book_id
        AND BR.return_date IS NOT NULL
        ),
CAL_avg_borrowing_duration AS (
        SELECT genre,
                     COUNT(borrowing_id) AS total_borrowings,
                     AVG(gap_days) AS avg_borrowing_duration
        FROM base
        GROUP BY genre
        ORDER BY avg_borrowing_duration DESC
        ),
score AS (
       SELECT genre, 
                    avg_borrowing_duration,
                    total_borrowings,
                    NTILE(4)OVER(ORDER BY total_borrowings) AS score
       FROM CAL_avg_borrowing_duration   ),
classification AS (
       SELECT *,
               CASE
                    WHEN total_borrowings = 0 THEN 'outsided'
                    WHEN score = 4 THEN 'high'
                    WHEN score = 3 THEN 'medium'
                    WHEN score = 2 THEN 'low'
                    WHEN score = 1 THEN 'very low'
                END AS class
        FROM score
        )
SELECT *
FROM classification
ORDER BY total_borrowings DESC
