/*Напишите запрос, который выведет идентификаторы студентов, которые не сдавали ни одного экзамена (если такие есть).
  Используйте теоретико-множественные операции.*/
SELECT StudentId
FROM STUDENTS
MINUS
SELECT StudentId
FROM EXAM_RESULT;

/*Напишите запрос, который выведет идентификаторы преподавателей,
  которые не были указаны в расписании экзаменов по курсу с идентификатором 1 (если такие есть).
  Используйте теоретико-множественные операции.*/
SELECT TeacherId
FROM TEACHER
MINUS
SELECT TeacherId
FROM EXAM_SHEET
WHERE CourseId = 1;

/*Напишите запрос, который выведет имена преподавателей,
  которые не были указаны в расписании экзаменов по курсу с идентификатором 1 (если такие есть).
  В этом запросе используйте запрос из предыдущего задания в качестве вложенного подзапроса.*/
SELECT TeacherName
FROM TEACHER
WHERE TeacherId
          IN
      (SELECT TeacherId
        FROM TEACHER
        MINUS
        SELECT TeacherId
        FROM EXAM_SHEET
        WHERE CourseId = 1);

/*Напишите запрос, который выведет имена преподавателей,
  которые не были указаны в расписании экзаменов по курсу с названием 'Data processing and analysis' (если такие есть).
  Для определения идентификатора курса используйте вложенный подзапрос!*/
SELECT TeacherName
FROM TEACHER
WHERE TeacherId IN (SELECT TeacherId
                    FROM TEACHER
                    MINUS
                    SELECT TeacherId
                    FROM EXAM_SHEET
                    WHERE CourseId = (SELECT CourseId
                                        FROM COURSE
                                        WHERE CourseTitle = 'Data processing and analysis'));

