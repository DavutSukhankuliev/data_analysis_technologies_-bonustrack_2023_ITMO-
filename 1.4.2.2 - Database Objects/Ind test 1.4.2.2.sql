/*В демонстрационных базах ORACLE и PostgreSQL определена
  функция GetNumber с двумя числовыми параметрами. Спецификация функции GetNumber (X, Y):

X — целое число
Y – целое число
Результат функции: целое число.
Вызовите эту функцию c параметрами X = 5, Y = 7.*/
DECLARE
    x      INTEGER := 5;
    y      INTEGER := 7;
    result INTEGER;
BEGIN
    result := GetNumber(X, Y);
    DBMS_OUTPUT.PUT_LINE(Result);
END;

/*Обратите внимание, что в среде ORACLE APEX поля типа DATE отображаются в формате:
  dd.mm.yyyy. Тем не менее, этот тип данных кроме даты содержит и время.
  Для того, чтобы это время увидеть, достаточно задать явный формат, включающий время.
  Например:
  SELECT to_char(stop_time_real, 'dd/mm/yyyy hh24:mi') FROM track

  Кроме того, в запросе может понадобиться явное упоминание какой-то даты.
  Например, требуется вывести все записи из таблицы track с значением поля
  stop_time_real после 10 сентября 2019 15:00:
  SELECT * FROM track WHERE stop_time_real > to_date('10/09/2019 15:00', 'dd/mm/yyyy hh24:mi')

  Определите, сколько автобусов пройдет остановку
  ГОРНЫЙ ИНСТИТУТ [1]< с идентификатором ОСТАНОВКИ 2668 в интервале [13:00, 14:00)
  9 сентября 2019 года */
SELECT COUNT(CARRIER_BOARD_NUM)
FROM TRACK
WHERE ID_VEHICLE IN (SELECT ID_VEHICLE
                     FROM VEHICLE
                     WHERE VEHICLE_NAME = 'АВТОБУС')
  AND ID_STOP IN (SELECT ID_STOP
                  FROM STOPS
                  WHERE STOP_NAME LIKE '%ГОРНЫЙ ИНСТИТУТ [1]<%'
                    AND ID_STOP = 2668) -- Осуждаем поиск остановки по названию + УНИКАЛЬНОМУ КЛЮЧУ! Зачем нужно было в условии задачи указывать поиск остановки и по тексту и по ключу...
  AND STOP_TIME_REAL >= TO_DATE('09/09/2019 13:00', 'dd/mm/yyyy hh24:mi')
  AND STOP_TIME_REAL < TO_DATE('09/09/2019 14:00', 'dd/mm/yyyy hh24:mi');

/*Давайте представим, что Вы стоите рядом с некоторой достопримечательностью Санкт-Петербурга,
  например Елисеевский магазин, с заданными координатами (59.9340782, 30.3378086).
  Вычислите количество остановок, которые находятся от Вас на расстоянии не более 350 метров.

  Координаты остановок находятся в таблице STOPS.
  Для вычисления сферического расстояния в базе данных Общественный Транспорт была создана функция CoordinateDistance.
  Спецификация функции CoordinateDistance (Latitude1, Longitude1, Latitude2, Longitude2):

  Latitude1 — широта объекта 1 (числовой тип)
  Longitude1 – долгота объекта 1 (числовой тип)
  Latitude2 — широта объекта 2 (числовой тип)
  Longitude2 – долгота объекта 2 (числовой тип)

  Результат функции: сферическое расстояние (в метрах). Введите количество остановок:*/
DECLARE
    baseLatitude  number  := 59.9340782;
    baseLongitude number  := 30.3378086;
    counter       integer := 0;
BEGIN
    FOR stop IN (SELECT LATITUDE, LONGITUDE FROM STOPS)
        LOOP
            IF CoordinateDistance(baseLatitude, baseLongitude, stop.LATITUDE, stop.LONGITUDE) <= 350 THEN
                counter := counter + 1;
            END IF;
        END LOOP;
    dbms_output.put_line(counter);
END;
