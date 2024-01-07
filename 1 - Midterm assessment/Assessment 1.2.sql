/*Петр и Мария находятся на разных остановках троллейбуса (номер маршрута — 11),
  причем на противоположных направлениях.
  Петр находится на остановке Суворовский проспект (5, 7, 11, 15, 16) с идентификатором 15546,
  а Мария на остановке Детская улица (10, 11, объезд) с идентификатором 27171.
  Время — середина дня и троллейбусы двигаются в обычном режиме с одинаковой скоростью в прямом и обратном направлениях.
  В этих условиях Петр и Мария пытаются хотя бы приблизительно понять,
  на каких остановках троллейбуса нужно выйти, чтобы встретиться как можно быстрее.
  Следующая серия запросов позволит в конечном счете дать ответ на этот вопрос.*/

/*1. Какие идентификаторы направления движения соответствует остановкам Петра и Марии?*/
/*Введите идентификатор направления движения остановки Петра:*/
SELECT ID_DIRECTION
FROM ROUTE_BY_STOPS
WHERE ID_VEHICLE IN (SELECT ID_VEHICLE
                     FROM VEHICLE
                     WHERE VEHICLE_NAME = 'ТРОЛЛЕЙБУС')
  AND ROUTE_NUMBER = 11
  AND ID_STOP = 15546;

/*Введите идентификатор направления движения остановки Марии:*/
SELECT ID_DIRECTION
FROM ROUTE_BY_STOPS
WHERE ID_VEHICLE IN (SELECT ID_VEHICLE
                     FROM VEHICLE
                     WHERE VEHICLE_NAME = 'ТРОЛЛЕЙБУС')
  AND ROUTE_NUMBER = 11
  AND ID_STOP = 27171;

/*2. Какие географические координаты соответствуют остановке, на которой находится Петр?*/
/*Введите широту (latitude) и долготу:*/
SELECT *
FROM STOPS
WHERE ID_STOP = 15546;

/*3. Определите идентификатор ближайшей остановки противоположного направления
  на маршруте 11 троллейбуса для Петра.*/
/*4. Определите расстояние до ближайшей остановки противоположного направления на маршруте 11 троллейбуса для Петра.*/

/*Первый способ. При помощи PL/SQL*/
DECLARE

    baseLatitude  STOPS.LATITUDE%TYPE;
    baseLongitude STOPS.LONGITUDE%TYPE;
    minDist       number := 10000;
    closestStop   INTEGER;

BEGIN

    SELECT LATITUDE, LONGITUDE
    INTO baseLatitude, baseLongitude
    FROM STOPS
    WHERE ID_STOP = 15546;

    FOR stop IN (SELECT *
                 FROM STOPS
                 WHERE ID_STOP IN (SELECT ID_STOP
                                   FROM ROUTE_BY_STOPS
                                   WHERE ID_VEHICLE IN (SELECT ID_VEHICLE
                                                        FROM VEHICLE
                                                        WHERE VEHICLE_NAME = 'ТРОЛЛЕЙБУС')
                                     AND ROUTE_NUMBER = 11
                                     AND ID_DIRECTION NOT IN (SELECT ID_DIRECTION
                                                              FROM ROUTE_BY_STOPS
                                                              WHERE ID_VEHICLE IN (SELECT ID_VEHICLE
                                                                                   FROM VEHICLE
                                                                                   WHERE VEHICLE_NAME = 'ТРОЛЛЕЙБУС')
                                                                AND ROUTE_NUMBER = 11
                                                                AND ID_STOP = 15546)))
        LOOP

            IF CoordinateDistance(baseLatitude, baseLongitude, stop.LATITUDE, stop.LONGITUDE) < minDist THEN

                minDist := CoordinateDistance(baseLatitude, baseLongitude, stop.LATITUDE, stop.LONGITUDE);
                closestStop := stop.ID_STOP;

            END IF;

        END LOOP;

    dbms_output.put_line(closestStop || ' | ' || minDist);

END;

/*Или вторым способом. Без PL/SQL*/
SELECT ID_STOP, CoordinateDistance(b.LATITUDE, b.LONGITUDE, i.LATITUDE, i.LONGITUDE) AS DIST_TO_BASE
FROM STOPS i,
     (SELECT LATITUDE, LONGITUDE
      FROM STOPS
      WHERE ID_STOP = 15546) b
WHERE ID_STOP IN (SELECT ID_STOP
                  FROM ROUTE_BY_STOPS
                  WHERE ID_VEHICLE IN (SELECT ID_VEHICLE
                                       FROM VEHICLE
                                       WHERE VEHICLE_NAME = 'ТРОЛЛЕЙБУС')
                    AND ROUTE_NUMBER = 11
                    AND ID_DIRECTION NOT IN (SELECT ID_DIRECTION
                                             FROM ROUTE_BY_STOPS
                                             WHERE ID_VEHICLE IN (SELECT ID_VEHICLE
                                                                  FROM VEHICLE
                                                                  WHERE VEHICLE_NAME = 'ТРОЛЛЕЙБУС')
                                               AND ROUTE_NUMBER = 11
                                               AND ID_STOP = 15546))
ORDER BY DIST_TO_BASE;

/*5. Определите порядковый номер на 11 маршруте троллейбуса
  ближайшей остановки противоположного направления для Петра.*/
SELECT STOP_NUMBER
FROM ROUTE_BY_STOPS
WHERE ID_STOP = (SELECT ID_STOP
                 FROM (SELECT ID_STOP,
                              CoordinateDistance(b.LATITUDE, b.LONGITUDE, i.LATITUDE, i.LONGITUDE) AS DIST_TO_BASE
                       FROM STOPS i,
                            (SELECT LATITUDE, LONGITUDE
                             FROM STOPS
                             WHERE ID_STOP = 15546) b
                       WHERE ID_STOP IN (SELECT ID_STOP
                                         FROM ROUTE_BY_STOPS
                                         WHERE ID_VEHICLE IN (SELECT ID_VEHICLE
                                                              FROM VEHICLE
                                                              WHERE VEHICLE_NAME = 'ТРОЛЛЕЙБУС')
                                           AND ROUTE_NUMBER = 11
                                           AND ID_DIRECTION NOT IN (SELECT ID_DIRECTION
                                                                    FROM ROUTE_BY_STOPS
                                                                    WHERE ID_VEHICLE IN (SELECT ID_VEHICLE
                                                                                         FROM VEHICLE
                                                                                         WHERE VEHICLE_NAME = 'ТРОЛЛЕЙБУС')
                                                                      AND ROUTE_NUMBER = 11
                                                                      AND ID_STOP = 15546))
                       ORDER BY DIST_TO_BASE)

                 WHERE DIST_TO_BASE = (SELECT MIN(DIST_TO_BASE)
                                       FROM (SELECT ID_STOP,
                                                    CoordinateDistance(b.LATITUDE, b.LONGITUDE, i.LATITUDE,
                                                                       i.LONGITUDE) AS DIST_TO_BASE
                                             FROM STOPS i,
                                                  (SELECT LATITUDE, LONGITUDE
                                                   FROM STOPS
                                                   WHERE ID_STOP = 15546) b
                                             WHERE ID_STOP IN (SELECT ID_STOP
                                                               FROM ROUTE_BY_STOPS
                                                               WHERE ID_VEHICLE IN (SELECT ID_VEHICLE
                                                                                    FROM VEHICLE
                                                                                    WHERE VEHICLE_NAME = 'ТРОЛЛЕЙБУС')
                                                                 AND ROUTE_NUMBER = 11
                                                                 AND ID_DIRECTION NOT IN (SELECT ID_DIRECTION
                                                                                          FROM ROUTE_BY_STOPS
                                                                                          WHERE ID_VEHICLE IN
                                                                                                (SELECT ID_VEHICLE
                                                                                                 FROM VEHICLE
                                                                                                 WHERE VEHICLE_NAME = 'ТРОЛЛЕЙБУС')
                                                                                            AND ROUTE_NUMBER = 11
                                                                                            AND ID_STOP = 15546)))));

/*6. Определите порядковый номер (STOP_NUMBER) на 11 маршруте троллейбуса остановки Марии.*/
SELECT STOP_NUMBER
FROM ROUTE_BY_STOPS
WHERE ID_VEHICLE IN (SELECT ID_VEHICLE
                     FROM VEHICLE
                     WHERE VEHICLE_NAME = 'ТРОЛЛЕЙБУС')
  AND ID_DIRECTION IN (SELECT ID_DIRECTION
                       FROM ROUTE_BY_STOPS
                       WHERE ID_VEHICLE IN (SELECT ID_VEHICLE
                                            FROM VEHICLE
                                            WHERE VEHICLE_NAME = 'ТРОЛЛЕЙБУС')
                         AND ROUTE_NUMBER = 11
                         AND ID_STOP = 27171)
  AND ROUTE_NUMBER = 11
  AND ID_STOP = 27171;

/*7. Определите точное расстояние (в метрах), которое связывает остановку Марии и
  ближайшую остановку Петра в противоположном направлении на 11 маршруте троллейбуса.*/
SELECT SUM(DISTANCE_BACK)
FROM ROUTE_BY_STOPS
WHERE ROUTE_NUMBER = 11
  AND ID_VEHICLE = (SELECT ID_VEHICLE
                    FROM VEHICLE
                    WHERE VEHICLE_NAME = 'ТРОЛЛЕЙБУС')
  AND ID_DIRECTION = (SELECT ID_DIRECTION
                      FROM ROUTE_BY_STOPS
                      WHERE ID_VEHICLE IN (SELECT ID_VEHICLE
                                           FROM VEHICLE
                                           WHERE VEHICLE_NAME = 'ТРОЛЛЕЙБУС')
                        AND ROUTE_NUMBER = 11
                        AND ID_STOP = 27171)
  AND STOP_NUMBER > 15
  AND STOP_NUMBER <= 35
ORDER BY STOP_NUMBER

/*8. На какой остановке следует выйти Марии,
чтобы расстояние, которое она проедет, оказалось как можно ближе к половине пути, определенному в пункте 7?*/
/*Введите идентификатор остановки:*/