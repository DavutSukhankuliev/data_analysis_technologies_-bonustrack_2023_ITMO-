/*Опишите на CQL структуру таблицы Course:
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
)