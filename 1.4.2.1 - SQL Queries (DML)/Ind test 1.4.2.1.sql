/*Напишите запрос к базе Общественный транспорт и определите,
  сколько остановок в прямом направлении есть на 3 маршруте (вид транспорта — ТРОЛЛЕЙБУС)?*/
SELECT COUNT(DISTINCT STOP_NUMBER)
FROM ROUTE_BY_STOPS
WHERE ROUTE_NUMBER = 3
  AND ID_VEHICLE IN (SELECT ID_VEHICLE
                     FROM VEHICLE
                     WHERE VEHICLE_NAME = 'ТРОЛЛЕЙБУС')
  AND ID_DIRECTION IN (SELECT ID_DIRECTION
                       FROM DIRECTION
                       WHERE DIRECTION_TYPE = 'ПРЯМОЕ');

/*Напишите запрос к базе Общественный транспорт и определите,
  сколько остановок в обратном направлении есть на 31 маршруте (вид транспорта — ТРОЛЛЕЙБУС)?*/
SELECT COUNT(DISTINCT STOP_NUMBER)
FROM ROUTE_BY_STOPS
WHERE ROUTE_NUMBER = 31
  AND ID_VEHICLE IN (SELECT ID_VEHICLE
                     FROM VEHICLE
                     WHERE VEHICLE_NAME = 'ТРОЛЛЕЙБУС')
  AND ID_DIRECTION IN (SELECT ID_DIRECTION
                       FROM DIRECTION
                       WHERE DIRECTION_TYPE = 'ОБРАТНОЕ');

/*Напишите запрос к базе Общественный транспорт и определите,
  по какому маршруту ездил АВТОБУС с бортовым номером 1171?*/
SELECT DISTINCT ROUTE_NUMBER
FROM TRACK
WHERE CARRIER_BOARD_NUM = 1171;

/*Напишите запрос к базе Общественный транспорт и определите,
  сколько единиц общественного транспорта (с различными бортовыми номерами)
  работали на 14 маршруте (вид транспорта — АВТОБУС)?*/
SELECT COUNT(DISTINCT CARRIER_BOARD_NUM)
FROM TRACK
WHERE ROUTE_NUMBER = 14
  AND ID_VEHICLE IN (SELECT ID_VEHICLE
                     FROM VEHICLE
                     WHERE VEHICLE_NAME = 'АВТОБУС');

/*Напишите запрос к базе Общественный транспорт и определите,
  какое максимальное расстояние между соседними остановками на маршруте АВТОБУСА номер 10?*/
SELECT MAX(DISTANCE_BACK)
FROM ROUTE_BY_STOPS
WHERE ROUTE_NUMBER = 10
  AND ID_VEHICLE IN (SELECT ID_VEHICLE
                     FROM VEHICLE
                     WHERE VEHICLE_NAME = 'АВТОБУС');

/*Напишите запрос к базе Общественный транспорт и определите,
  какому виду транспорта соответствует маршрут 3?*/
SELECT VEHICLE_NAME
FROM VEHICLE
WHERE ID_VEHICLE IN (SELECT ID_VEHICLE
                     FROM TRACK
                     WHERE ROUTE_NUMBER = 3);

/*Напишите запрос к базе Общественный транспорт и определите
  долготу и широту 13-й остановки на ОБРАТНОМ направлении маршрута АВТОБУСА номер 1.*/
SELECT LONGITUDE, LATITUDE
FROM STOPS
WHERE ID_STOP IN (SELECT ID_STOP
                  FROM ROUTE_BY_STOPS
                  WHERE STOP_NUMBER = 13
                    AND ROUTE_NUMBER = 1
                    AND ID_DIRECTION IN (SELECT ID_DIRECTION
                                         FROM DIRECTION
                                         WHERE DIRECTION_TYPE = 'ОБРАТНОЕ')
                    AND ID_VEHICLE IN (SELECT ID_VEHICLE
                                       FROM VEHICLE
                                       WHERE VEHICLE_NAME = 'АВТОБУС'));

/*Напишите запрос к базе Общественный транспорт и определите
  НОМЕРА АВТОБУСНЫХ маршрутов, длина которых в ПРЯМОМ направлении попадает в интервал [11800, 18550].*/
SELECT ROUTE_NUMBER, SUM(DISTANCE_BACK)
FROM ROUTE_BY_STOPS
WHERE ID_VEHICLE IN (SELECT ID_VEHICLE
                     FROM VEHICLE
                     WHERE VEHICLE_NAME = 'АВТОБУС')
  AND ID_DIRECTION IN (SELECT ID_DIRECTION
                       FROM DIRECTION
                       WHERE DIRECTION_TYPE = 'ПРЯМОЕ')
GROUP BY ROUTE_NUMBER
HAVING SUM(DISTANCE_BACK) BETWEEN 11800 AND 18550;

/*В базе Общественный транспорт есть таблица STOPS, в которой содержаться сведения об остановках.
  Определите количество остановок, в названиях которых встречается подстрока ЛИНИЯ.
  При поиске остановки в точности соблюдайте заданный регистр.*/
SELECT count(ID_STOP), STOP_NAME
FROM STOPS
WHERE STOP_NAME LIKE '%ЛИНИЯ%';