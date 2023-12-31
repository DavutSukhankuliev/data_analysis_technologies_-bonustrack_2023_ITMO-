/*1. Напишите команду,
которая подсчитает количество документов в коллекции student,
в которых в значение по ключу surname равно Ivanova.*/

db.student.find({surname:{$eq:"Ivanova"}}).count()
db.student.find({surname:"Ivanova"}).count()

/*2. Отсортируйте все документы в коллекции student
в лексикографическом порядке (по возрастанию) по ключу name.*/

db.student.find().sort({name:1})

/*3. Выведите первые 10 документов из коллекции student
в лексикографическом порядке (по убыванию) по ключу name.*/

db.student.find().sort({name:-1}).limit(10)