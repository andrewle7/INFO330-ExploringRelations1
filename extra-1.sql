
SELECT 
    CASE
        WHEN female_doctor.age = male_reverend.age THEN "Yes"
        ELSE "No"
    END AS are_same_age
FROM
    (SELECT age FROM persons
     WHERE title = "Dr"
       AND gender = "female"
       AND city = "West Palm Beach"
       AND state = "Florida"
     LIMIT 1) AS female_doctor
JOIN
    (SELECT age FROM persons
     WHERE title = "Rev"
       AND gender = "male"
       AND city = "Phoenix"
       AND state = "Arizona"
     LIMIT 1) AS male_reverend;
