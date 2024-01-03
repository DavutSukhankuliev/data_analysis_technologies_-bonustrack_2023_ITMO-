/*Напишите запрос, который выводит лексикографически упорядоченный список ФИО студентов.
  Для каждого из них укажите год рождения (это поле назовите birth_year, не используйте двойные кавычки,
  это ограничение системы проверки).*/
SELECT StudentName, EXTRACT(year FROM BirthDate) AS birth_year
FROM STUDENTS
WHERE BirthDate IS NOT NULL
ORDER BY StudentName;

/*Выведите имена студентов,у которых дни рождения в текущем месяце
  (текущий месяц надо вычислять внутри запроса из текущей даты).*/
SELECT StudentName
FROM STUDENTS
WHERE EXTRACT(month FROM BirthDate) = EXTRACT(month FROM CURRENT_DATE);

SELECT studentname
FROM students
WHERE EXTRACT(month FROM BirthDate) = EXTRACT(month FROM sysdate);

/*Выведите список имен студентов в верхнем регистре, отсортировав по дате рождения по возрастанию.
  Выводимое поле назовите upper_name (не используйте двойные кавычки, это ограничение системы проверки).*/
SELECT UPPER(StudentName) AS upper_name
FROM STUDENTS
ORDER BY BirthDate;

/*Выведите идентификаторы студентов и
  соответствующие им средние баллы по сданным экзаменам с точностью до сотых
  (это поле назовите avg_grade, не используйте двойные кавычки, это ограничение системы проверки).
  Отсортируйте список по убыванию среднего балла.*/
SELECT StudentId, ROUND(AVG(Grade), 2) AS avg_grade
FROM EXAM_RESULT
GROUP BY StudentId
ORDER BY avg_grade DESC;