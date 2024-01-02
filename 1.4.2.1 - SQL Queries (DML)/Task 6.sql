/*Напишите запрос, который выведет имена преподавателей, которые были указаны в расписании экзаменов в аудитории 2410.
  Для соединения таблиц используйте конструкцию JOIN!
  Для выборки нужной аудитории должна быть использована конструкция WHERE. Имена преподавателей не должны повторяться.*/
SELECT DISTINCT TeacherName
FROM TEACHER
         JOIN EXAM_SHEET ON TEACHER.TeacherId = EXAM_SHEET.TeacherId
WHERE ClassRoom = 2410;

/*Напишите запрос, который выведет названия курсов, которые были указаны в расписании экзаменов в аудитории 2410.
  При соединении таблиц используйте конструкцию JOIN. Для выборки аудитории используйте конструкцию WHERE.
  Названия курсов не должны повторяться.*/
SELECT DISTINCT CourseTitle
FROM COURSE
         JOIN EXAM_SHEET ON COURSE.CourseId = EXAM_SHEET.CourseId
WHERE ClassRoom = 2410;

/*Напишите запрос, который выведет имена преподавателей и даты проведения экзаменов.
  Порядок полей не меняйте. Для соединения таблиц используйте конструкцию WHERE (не используйте JOIN).*/
SELECT TEACHER.TeacherName, EXAM_SHEET.ExamDate
FROM TEACHER,
     EXAM_SHEET
WHERE TEACHER.TeacherId = EXAM_SHEET.TeacherId;

/*Напишите запрос, который выведет названия курсов, номера аудиторий и даты проведения экзаменов.
  Порядок полей не меняйте. При написании запроса не используйте конструкцию JOIN, а используйте конструкцию WHERE!*/
SELECT COURSE.CourseTitle, EXAM_SHEET.ClassRoom, EXAM_SHEET.ExamDate
FROM COURSE,
     EXAM_SHEET
WHERE COURSE.CourseId = EXAM_SHEET.CourseId;