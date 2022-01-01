**Задание №1**    
1. Файл докер манифеста:
```
FROM centos:7
ENV container docker
RUN yum install -y java-1.8.0-openjdk-devel
RUN rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
RUN echo -e '[elasticsearch-6.x] \n\
name=Elasticsearch repository for 6.x packages \n\
baseurl=https://artifacts.elastic.co/packages/6.x/yum \n\
gpgcheck=1 \n\
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch \n\
enabled=1 \n\
autorefresh=1 \n\
type=rpm-md' >> /etc/yum.repos.d/elasticsearch.repo
RUN yum -y install initscripts && yum clean all
RUN yum install -y elasticsearch
RUN systemctl enable elasticsearch.service
RUN /etc/init.d/elasticsearch start
```
   
2.Ссылка на докер образ:
https://hub.docker.com/layers/184794145/infanis/infanis/elastick/images/sha256-b3a0fe8ebd593a367dd198698062c5a86c7d381c95b049b0088552196e44cf31?context=repo  
   
3.Ответ на запрос корневого  
```
[root@f3f9858929fe //]# curl -X GET "localhost:9200/"
{
  "name" : "Y_Hpoip",
  "cluster_name" : "elasticsearch",
  "cluster_uuid" : "921EstZKREungfOjrfOSKQ",
  "version" : {
    "number" : "6.8.22",
    "build_flavor" : "default",
    "build_type" : "rpm",
    "build_hash" : "71fcb50",
    "build_date" : "2021-12-19T01:10:56.497443Z",
    "build_snapshot" : false,
    "lucene_version" : "7.7.3",
    "minimum_wire_compatibility_version" : "5.6.0",
    "minimum_index_compatibility_version" : "5.0.0"
  },
  "tagline" : "You Know, for Search"
}  
```   

**Задание №2**    
1. Добавили 3 индекса согласно таблицы и получили их статусы:  
![Снимок экрана от 2022-01-01 13-36-32](https://user-images.githubusercontent.com/87299405/147847948-8ab6f7b0-b1ac-446e-84d3-a3d50d1b4ef3.png)   
   
2. Получили статус сервера:  
![Снимок экрана от 2022-01-01 13-38-08](https://user-images.githubusercontent.com/87299405/147847958-a24464cc-8a32-4d2d-a893-8bf9c36c24d4.png)   
   
3. Сервер в состоянии yellow возможно из-заутраченных шардов, но сервер работоспособен.  
   
**Задание №3**    
1.Создали папку для бэкапов, выдали права на запись, далее создали запрос на регистрацию репо и вывели зарегистрированные репо.   
Скрин с запросами и выводом:   
![Снимок экрана от 2022-01-01 20-35-59](https://user-images.githubusercontent.com/87299405/147855379-1f58bc23-0bea-4314-a8d4-d05dd02e9018.png)   
   
2.Создали snapshot и вывели список файлов по созданному snapshot.  
![Снимок экрана от 2022-01-01 22-19-16](https://user-images.githubusercontent.com/87299405/147857462-0eb9ac05-adc7-4370-9b1a-843d343b8107.png)   
   
   
3. Удалили индекс и создали новый индекс test-2   
![Снимок экрана от 2022-01-01 22-23-12](https://user-images.githubusercontent.com/87299405/147857547-6989a93c-b00d-4254-b35d-f97d1be18e75.png)   
  
4. Восстановили данные из snapshot.  Команды и вывод индексов на скрине   
![Снимок экрана от 2022-01-01 22-30-06](https://user-images.githubusercontent.com/87299405/147857661-15cd185a-14c6-45ce-9712-5e51472236ad.png)
