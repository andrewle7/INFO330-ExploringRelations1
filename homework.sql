<?xml version="1.0" encoding="UTF-8"?><sqlb_project><db path="/Users/andrewle/Documents/School/INFO330/INFO330-ExploringRelations1/people.db" readonly="0" foreign_keys="1" case_sensitive_like="0" temp_store="0" wal_autocheckpoint="1000" synchronous="2"/><attached/><window><main_tabs open="structure browser pragmas query" current="3"/></window><tab_structure><column_width id="0" width="300"/><column_width id="1" width="0"/><column_width id="2" width="100"/><column_width id="3" width="1294"/><column_width id="4" width="0"/><expanded_item id="0" parent="1"/><expanded_item id="1" parent="1"/><expanded_item id="2" parent="1"/><expanded_item id="3" parent="1"/></tab_structure><tab_browse><current_table name="4,7:mainpersons"/><default_encoding codec=""/><browse_table_settings/></tab_browse><tab_sql><sql name="SQL 1">-- (question-1.sql) What are the first names of all the people who live in the city of Omaha?

SELECT first_name FROM persons
WHERE city = 'Omaha';

-- * (question-2.sql) What are the full name(s) (last and first, in sorted order by last name) who have an age less than 30 (meaning age 29 and down)?

SELECT last_name, first_name FROM persons
WHERE age &lt; 30
ORDER BY last_name ASC;

-- (question-3.sql) What are the full name(s) (last and first, in sorted order by last name) of all the female clergy in the database? (**Hint**: look at the &quot;title&quot; column and keep in mind that &quot;Rev&quot; is short for &quot;Reverend&quot;.)

SELECT last_name, first_name FROM persons
WHERE title = 'Rev' AND gender = 'Female'
ORDER BY last_name ASC;

-- * (question-4.sql) What is/are the full name(s) of the youngest people in the database?

SELECT first_name, last_name, age FROM persons
ORDER BY age ASC
LIMIT 10;

--* (question-5.sql) What is the first name of everybody who has a last name similar to &quot;Smith&quot; (that is to say, their last name starts with &quot;Smith&quot;)?

SELECT first_name FROM persons 
WHERE last_name LIKE 'Smith%';

--* (question-6.sql) What are all the email domains (just the domain, not the username) of all the people living in the city of Seattle? (**Hint**: Look at the SQLite documentation here: https://sqlite.org/lang_corefunc.html and at the functions `substr` and `instr`.)
SELECT  DISTINCT substr(email, instr(email, '@') + 1) FROM persons
WHERE city = 'Seattle';

-- (question-7.sql) The United States has decided that Sacramento is a terrible place to live, and everybody has to leave. Write a SQL statement to change the city for all persons currently living in Sacramento to now live in the city of Tulsa.

UPDATE persons SET city = 'Tulsa' 
WHERE city = 'Sacramento';

-- * (question-8.sql) President Biden has issued an executive order that everyone who lives on a &quot;Street&quot; (as opposed to a &quot;Trail&quot;, &quot;Hill&quot;, &quot;Drive&quot; or other kind of address suffix) is actually 18 years old. Update the database accordingly.
UPDATE persons SET age = 18
WHERE address LIKE '%Street%';

-- * (question-9.sql) Your instructor has had some bad memories he'd like to purge from the data. Write a single SQL statement to remove anybody who lives in Kansas City (bad experience with BBQ), Pittsburgh (I dislike their football team), or Jacksonville (because Florida) from the database.
DELETE FROM persons 
WHERE city = 'Kansas City' OR 'Pittsburgh' OR 'Jacksonville';

-- * (question-10.sql) Put your own information into the database. (You may used falsified information for anything you feel is too personal to share, just make sure your first and last name are the same as what we see in Canvas.)
INSERT INTO persons (first_name, last_name, email, gender, title, age, address, city, state, postalcode, phone) VALUES('Andrew', 'Le', 'andrewle361@gmail.com', 'Male', 'Mr', 20, '1224 University of Washington Street', 'Seattle', 'WA', 98105, 2066677777); 

-- * (extra-1.sql) Is the female doctor from West Palm Beach, Florida the same age as the male reverend from Phoenix, Arizona? (1 pt)
SELECT 
    CASE
        WHEN female_doctor.age = male_reverend.age THEN 'Yes'
        ELSE 'No'
    END AS are_same_age
FROM
    (SELECT age FROM persons
     WHERE title = 'Dr'
       AND gender = 'female'
       AND city = 'West Palm Beach'
       AND state = 'Florida'
     LIMIT 1) AS female_doctor
JOIN
    (SELECT age FROM persons
     WHERE title = 'Rev'
       AND gender = 'male'
       AND city = 'Phoenix'
       AND state = 'Arizona'
     LIMIT 1) AS male_reverend;

-- * (extra-2.sql) How many different values are there for &quot;Gender&quot; in this database? (1 pt)
SELECT count(DISTINCT gender) from persons;

-- * (extra-3.sql) What is the maximum, minimum, and average age of the people in this database? (1 pt)
SELECT avg(age), min(age), max(age) FROM persons;</sql><current_tab id="0"/></tab_sql></sqlb_project>
