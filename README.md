# sql-window-function-and-cte-
i currently use GPC bigquery as mysql server 


WITH vals AS   
    ( SELECT gender,
    parental_level_of_education,
    race_ethnicity,
    lunch,
    math_score,
    reading_score,
    writing_score,
    (math_score+reading_score+writing_score) as total,
    ROW_NUMBER() OVER( PARTITION BY race_ethnicity ORDER BY (math_score+reading_score+writing_score) DESC ) rownumber, 
    RANK( ) OVER ( partition by race_ethnicity ORDER BY 'total' DESC) ranks 
    FROM 
    `myfirstsandboxproject121.student.student_performance`) 
select * from vals 
