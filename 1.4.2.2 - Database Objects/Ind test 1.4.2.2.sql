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