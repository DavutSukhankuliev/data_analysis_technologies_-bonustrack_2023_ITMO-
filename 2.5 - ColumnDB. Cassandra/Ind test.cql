/*Доступ к СУБД Cassandra можно получить по адресу: https://online.ifmo.ru/cassandra/. По этому адресу хранится база Top 100 Cartoon, которая обсуждалась в лекции.

Данные для доступа к базе:

Enter user-name: itmo (логин действителен только для чтения базы)
Enter password: online (пароль не отображается при вводе)*/

/*1. Как называется мультфильм,
  для которого идентификатор (поле cartoon_id) равен 1.*/

USE Cartoon;
SELECT Cartoon_name
FROM Cartoon_by_id
WHERE Cartoon_id = 1;

/*Сколько просмотров мультфильмов соответствует режиссеру,
  для которого идентификатор (поле director_id) равен 1.*/

USE Director;
SELECT views
FROM Cartoon_by_director_id
WHERE director_id = 1;

/*Сколько в базе мульфильмов,
  для которых выполнено условие country = 'USA'?*/

USE Cartoon;
SELECT COUNT(*)
FROM Cartoon_by_Country
WHERE Country = 'USA';