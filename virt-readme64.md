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
   
**Задание №3**   
Для партиции общей таблицы можно использовать следующие команды:
```
create table orders_2 (check (price <= 499)) inherits(orders); 
create table orders_1 (check (price > 499)) inherits(orders); 
create rule insert_down_499 as on insert to orders where (price <= 499) do instead insert into orders_2 values (new.);
create rule insert_up_499 as on insert to orders where (price > 499) do instead insert into orders_1 values (new.*);
```  
Ручное разделение таблицы можно и нужно было делать заранее, добваляя критерии разделения вносимых дааных в таблицу, либо разделение данных по идентификатору, чтобы не было нагрузки на одну таблицу. Кроме того это нужно делать заранее, чтобы избежать переписывания кода запросов.    
   
**Задание №4**   
pg_dump -U user test_database > backup.dump
