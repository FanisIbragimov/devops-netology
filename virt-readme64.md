**Задание №1**   
Создали контейнер с postgresql  
```
version: "3.3"
services:
  postgres:
    image: postgres:13
    environment:
      POSTGRES_DB: "db"
      POSTGRES_USER: "user"
      POSTGRES_PASSWORD: "user"
    volumes:
      - .:/docker-entrypoint-initdb.d
    ports:
      - "5432:5432"
```
При помощи команды ```\?``` нашли команды для вывода следующей информации:

    -вывод списка БД                    - \l  
    -подключение к БД                   - \с DBNAME   
    -вывод списка таблиц                - \dt   
    -вывод описания содержимого таблиц  - \d+ table_name   
    -выход из psql                      - \q   

**Задание №2**   
Создали БД командой ``` create database test_database; ```     
Восстановили данные из бэкапа.   
``` psql -U user test_database < /docker-entrypoint-initdb.d/test_dump.sql ```
Для вывода максимального значения используем слудующий запрос:
```select max(avg_width) from pg_stats where tablename = 'orders'; ```
Скрин ответа ниже:
![Снимок экрана от 2021-12-12 11-58-31](https://user-images.githubusercontent.com/87299405/145705029-ff87cb61-e183-43dd-bd79-ae63f12f6094.png)
