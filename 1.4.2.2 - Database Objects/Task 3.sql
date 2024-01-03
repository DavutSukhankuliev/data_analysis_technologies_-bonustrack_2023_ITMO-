/*Напишите команду, которая создает представление V_student,
  которое скроет приватную информацию о студентах — адрес и дату рождения,
  а позволит отобразить ФИО, номер группы и идентификатор студента (в указанном порядке).
  Не используйте двойные кавычки, это ограничение системы проверки.*/
CREATE VIEW V_student (StudentName, GroupCode, StudentId) AS
SELECT StudentName, GroupCode, StudentId
FROM STUDENTS;

/*Напишите команду, которая создает представление V_exam_count,
  которое отобразит для каждой аудитории количество запланированных экзаменов.
  Поле с количеством экзаменов назовите exam_count.
  Не используйте двойные кавычки, это ограничение системы проверки*/
CREATE VIEW V_exam_count (ClassRoom, exam_count) AS
SELECT ClassRoom, COUNT(ClassRoom)
FROM EXAM_SHEET
WHERE ClassRoom IS NOT NULL
GROUP BY ClassRoom;
