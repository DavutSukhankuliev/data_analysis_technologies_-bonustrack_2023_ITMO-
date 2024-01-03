/*Напишите запрос, который выводит идентификаторы студентов,
  в чьих номерах мобильных телефонов встречаются подряд идущие цифры 3 и 4.*/
SELECT StudentId
FROM PHONE_LIST
WHERE Phone LIKE '%34%'
  AND PhoneType = 'cell';

/*Напишите запрос, который выводит даты, когда бакалавры (поле Groupcode начинается с буквы 'B') сдавали экзамены?
  Если в один день было назначено несколько экзаменов, то одну и ту же дату выводить несколько раз не нужно.*/
SELECT DISTINCT ExamDate
FROM EXAM_SHEET
WHERE GroupCode LIKE 'B%';

/*Напишите запрос, который выводит даты, когда бакалавры сдавали экзамены в аудитории 2410?
  Каждую дату выводить один раз.*/
SELECT DISTINCT ExamDate
FROM EXAM_SHEET
WHERE GroupCode LIKE 'B%'
  AND ClassRoom = 2410;

/*Напишите запрос, который считает, сколько экзаменов бакалавры сдавали в аудитории 2410?
  Назовите столбец выборки с результатом Number_of_exams (не используйте двойные кавычки,
  это ограничение системы проверки).*/
SELECT COUNT(*) AS Number_of_exams
FROM EXAM_SHEET
WHERE GroupCode LIKE 'B%'
  AND ClassRoom = 2410;

