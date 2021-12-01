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
