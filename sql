---- using cte to get {total score, ranks_per_group and overall_ranks} ------

WITH vals AS  
    ( SELECT gender,
    parental_level_of_education,
    race_ethnicity,
    lunch,
    math_score,
    reading_score,
    writing_score,
    (math_score+reading_score+writing_score) total,
    ROW_NUMBER() OVER( PARTITION BY race_ethnicity ORDER BY (math_score+reading_score+writing_score) DESC ) rownumber, 
    RANK( ) OVER ( ORDER BY (math_score+reading_score+writing_score) DESC) ranks 
    FROM 
    `myfirstsandboxproject121.student.student_performance`) 

SELECT *
 FROM vals 
WHERE rownumber IN(1, 2, 3, 4,5)
order by race_ethnicity, total desc
