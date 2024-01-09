/*Таблица Course была создана в соответствии с описанием:
  - идентификатор курса IdCourse — короткое целое
  - год выпуска курса YearCourse — короткое целое
  - название курса NameCourse — текстовое
  В качестве пространства ключей укажите Education,
  а первичный ключ образуйте из идентификатора курса и года выпуска.*/

CREATE TABLE Education.Course
(
    IdCourse   smallint,
    YearCourse smallint,
    NameCourse text,
    PRIMARY KEY ( IdCourse, YearCourse )
);

/*В каком из следующих запросов можно будет увидеть сведения
  о курсе с идентификатором 5,
  который был выпущен в 2020 году?*/

/*USE AllCourses;
SELECT *
FROM Course;*/
/*Неправильно указано пространство ключей.
  Выбрать данные нельзя.*/

USE Education;
SELECT *
FROM Course;

/*USE Education;
SELECT *
FROM Course
WHERE YearCourse = 2020;*/
/*Исполнить команду не удастся,
  т.к. колонка YearCourse стоит второй в определении
  первичного ключа и без значения первого поля не может быть
  применима.*/

USE Education;
SELECT *
FROM Course
WHERE IdCourse = 5
  AND YearCourse = 2020;

USE Education;
SELECT *
FROM Course
WHERE IdCourse = 5;