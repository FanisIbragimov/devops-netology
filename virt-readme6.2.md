**Задание №1**   
Создали контейнер с postgresql
Файл для docker-compose
```version: "3.3"
services:
  postgres:
    image: postgres:12
    environment:
      POSTGRES_DB: "db"
      POSTGRES_USER: "user"
      POSTGRES_PASSWORD: "user"
    volumes:
      - .:/docker-entrypoint-initdb.d
      - /root/post2:docker-entrypoint-initdb.d
    ports:
      - "5432:5432"
```
**Задание №2**   
Снимок списка  бд   
   
![Снимок экрана от 2021-12-01 08-24-50](https://user-images.githubusercontent.com/87299405/144277556-73d23294-30ec-4e6c-b29f-0d6b09c2ca9d.png)   
   
Снимок списка таблиц   
![Снимок экрана от 2021-12-01 08-26-35](https://user-images.githubusercontent.com/87299405/144277574-46b50fd2-e422-41ff-aa38-219e6b1ba4c4.png)   

**Задание №3**   
Создали записи в таблицах. Сделали запросы вычисления количества строк скрины ниже   
![Снимок экрана от 2021-12-01 21-38-56](https://user-images.githubusercontent.com/87299405/144285601-61741ae6-ff50-40f6-bfe4-042f4f622ba5.png)   
![Снимок экрана от 2021-12-01 21-39-36](https://user-images.githubusercontent.com/87299405/144285614-4f466f57-9aa9-4e1c-b802-5c3676a0b6f7.png)   
    
**Задание №4**   
``` 
test_db=# update clients set заказ = '4' where id = '1';
UPDATE 1
test_db=# update clients set заказ = '5' where id = '2';
UPDATE 1
test_db=# update clients set заказ = '6' where id = '3';
UPDATE 1
test_db=# 
```
Результат  
```
test_db=# select * from clients;
 id |         ФИО          |       страна проживания        | заказ 
----+----------------------+--------------------------------+-------
  4 | Ронни Джеймс Дио     | Russia                         |      
  5 | Richie Blackmore     | Russia                         |      
  1 | Иванов Иван Иванович | USA                            |     4
  2 | Петров Петр Петрович | Canada                         |     5
  3 | Иоган Себастьян Бах  | Japan                          |     6
(5 строк)
```
**Задание №5**   
Выполнили команду test_db=# EXPLAIN (FORMAT JSON) SELECT * FROM orders;
для вывода обработки процесса выполнения запроса.  
![Снимок экрана от 2021-12-03 18-55-58](https://user-images.githubusercontent.com/87299405/144624149-67324bd1-bde8-4014-b65d-9143d8742775.png) ![Снимок экрана от 2021-12-03 18-56-23](https://user-images.githubusercontent.com/87299405/144624202-fd1cb079-c869-4855-a765-0f1895378e33.png)
Вывелась информация позапросу.
Тип запроса Seq Scan - применяется последовательное сканирование таблицы.
Startup Total cost - стоимость запуска и полную стоимость запроса.
   
**Задание №6**   
