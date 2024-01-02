/*Напишите запрос, который выведет имена студентов, получивших два балла на экзаменах хотя бы по одному курсу.
  Для определения идентификаторов студентов используйте вложенный запрос.
  Имена студентов не должны повторяться!*/
SELECT StudentName
FROM STUDENTS
WHERE StudentId IN (SELECT DISTINCT StudentId
                    FROM EXAM_RESULT
                    WHERE Grade = 2);

/*Напишите запрос, который выведет названия курсов и даты экзаменов по этим курсам.
  Для выборки названий курсов используйте вложенный подзапрос.
  Столбец с названием курса в итоговой выборке назовите CourseTitle. Порядок полей не меняйте!*/
SELECT (SELECT CourseTitle
        FROM COURSE
        WHERE COURSE.CourseId = EXAM_SHEET.CourseId) AS CourseTitle, ExamDate
FROM EXAM_SHEET;