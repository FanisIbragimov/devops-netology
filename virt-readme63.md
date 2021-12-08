**Задание №1**   
Создали контейнер с mysql  
```
version: "3.3"
services:
  mysql:
    image: mysql:8
    container_name: mysql-host
    environment:
      MYSQL_ROOT_PASSWORD: "123456"
      MYSQL_DATABASE: "db"
      MYSQL_USER: "user"
      MYSQL_PASSWORD: "user"
    volumes:
      - .:/docker-entrypoint-initdb.d
    ports:
      - "3306:3306"
```
Далее восстановили БД из дампа  
```
 mysql test_db < test_dump.sql
``` 
Версия сервера: 8.0.27 MySQL Community Server - GPL   
![Снимок экрана от 2021-12-04 18-22-42](https://user-images.githubusercontent.com/87299405/144713000-4715ee29-06cc-44cf-9540-968c24bcd556.png)  
    
Список таблиц БД  
![Снимок экрана от 2021-12-04 18-24-02](https://user-images.githubusercontent.com/87299405/144713038-0035658b-b788-40a1-8e34-06d0dbb70734.png)  
   
Количество записей с price > 300.   
![Снимок экрана от 2021-12-04 18-18-53](https://user-images.githubusercontent.com/87299405/144713073-59f2265b-647b-49f9-8320-f5c1e70b3ddb.png)

**Задание №2**   
Создали пользователя test.
Скрин из таблицы с запросом из INFORMATION_SCHEMA.USER_ATTRIBUTES.
![Снимок экрана от 2021-12-07 14-35-07](https://user-images.githubusercontent.com/87299405/145013601-d368c775-5a7e-4448-84f1-d07ca556091c.png)

**Задание №3**  
В нашей базе данных используется движок InnaDB. Вывод движка и информация по запросам по команде show profiles на скриншоте.   
![Снимок экрана от 2021-12-08 18-45-20](https://user-images.githubusercontent.com/87299405/145228394-db06b8c1-bd4d-4517-ab5a-14c1a172bc81.png)
   
Далее изменили движок БД на  MyISAM командой ALTER TABLE orders ENGINE = MyISAM;  
При одинаковых запросах MyISAM оказалась быстрее,так как тратит меньше времени на выполнение запросов 10 и 14.  
![Снимок экрана от 2021-12-08 18-58-43](https://user-images.githubusercontent.com/87299405/145230818-c14bb7ea-c873-4d58-98bc-66087da49f36.png)

**Задание №4**  
Провели следующие настройки файла my.cnf   
```
[mysqld]
pid-file        = /var/run/mysqld/mysqld.pid
socket          = /var/run/mysqld/mysqld.sock
datadir         = /var/lib/mysql
secure-file-priv= NULL

# Custom config should go here
!includedir /etc/mysql/conf.d/
innodb_buffer_pool_size = 2G
innodb_log_file_size = 100M
innodb_file_per_table = ON
innodb_flush_log_at_trx_commit = 2
```
