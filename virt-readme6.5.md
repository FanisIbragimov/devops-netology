**Задание №1**    
Файл докер манифеста:
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
