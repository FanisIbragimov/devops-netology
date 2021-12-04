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

**Задание №2**   
   
**Задание №3**  
   
**Задание №4**   
