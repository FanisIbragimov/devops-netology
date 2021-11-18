**Задание №1**   
1. Создали образ ВМ в cloud.yandex.ru  
![Снимок экрана от 2021-11-16 15-09-07](https://user-images.githubusercontent.com/87299405/141975108-8cb14a7e-28eb-4e0b-a661-cb202e946dc0.png)  

**Задание №2** 
Создали ВМ. Скриншот ВМ ниже.  
![Снимок экрана от 2021-11-17 16-12-44](https://user-images.githubusercontent.com/87299405/142198682-bdf503d5-df60-49c7-935b-5e8bd6671a03.png)  
  
**Задание №3** 
Создали компонент мониторинга. Скриншот ниже.  

![Снимок экрана от 2021-11-18 10-02-41](https://user-images.githubusercontent.com/87299405/142361148-aa04dc3f-7551-41c9-aefc-a49085d96d6f.png)


**Задание №4** 
Здесь я создал вторую ВМ.Изменил конфиг prometheus.yml. Перезапустил сервис на первом сервере.
Подскажите где в интерфейсе Grafana мы должны увидеть данные по второму серверу? и как мы можем проверить что корректно все установилось?  
``` global:
  scrape_interval:     15s
  evaluation_interval: 15s

  # Attach these labels to any time series or alerts when communicating with
  # external systems (federation, remote storage, Alertmanager).
  external_labels:
      monitor: 'prometheus'

# Load and evaluate rules in this file every 'evaluation_interval' seconds.
rule_files:
  - "alert.rules"

# A scrape configuration containing exactly one endpoint to scrape.
scrape_configs:
  - job_name: 'nodeexporter'
    scrape_interval: 5s
    static_configs:
      - targets: ['nodeexporter:9100']

  - job_name: 'cadvisor'
    scrape_interval: 5s
    static_configs:
      - targets: ['cadvisor:8080']

  - job_name: 'prometheus2'
    scrape_interval: 10s
    static_configs:
      - targets: ['51.250.0.102:9090']

  - job_name: 'pushgateway2'
    scrape_interval: 10s
    honor_labels: true
    static_configs:
      - targets: ['51.250.0.102:9091']

  - job_name: 'alertmanager'
    scrape_interval: 10s
    honor_labels: true
    static_configs:
      - targets: ['alertmanager:9093']

  - job_name: 'grafana'
    scrape_interval: 10s
    honor_labels: true
    static_configs:
      - targets: ['grafana:3000']


alerting:
  alertmanagers:
  - scheme: http
    static_configs:
    - targets:
      - 'alertmanager:9093'
```
![Снимок экрана от 2021-11-18 13-24-39](https://user-images.githubusercontent.com/87299405/142388180-184927a7-3536-4260-b7da-655174ec6fd3.png)
![Снимок экрана от 2021-11-18 13-27-21](https://user-images.githubusercontent.com/87299405/142388397-339d1c65-8ae2-49a4-a3ee-ac44fef0b206.png)  

