

SELECT first_name, last_name, age FROM persons
WHERE age = (SELECT min(age) FROM persons);
