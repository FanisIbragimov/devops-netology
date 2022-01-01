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

