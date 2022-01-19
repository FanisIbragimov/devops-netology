**Задание №1**    
1. Создали учетную запись в terraform cloud.   
2. Создали репозиторий и запушили файлы из прошлого ДЗ.   
3. Зарегистрировали этот репозиторий в https://app.terraform.io/.
4. Применили plan, но выдал ошибку, подскажите пожалуйста в чем может быть ошибка?
   ![Снимок экрана от 2022-01-19 14-00-11](https://user-images.githubusercontent.com/87299405/150108194-f1a7562f-5ede-43e7-99ba-3f8b628e4303.png)   
   
**Задание №2**    
1. Изучили документацию по Atlantis  
2. Создали конфиг серверной части [server.yaml](https://github.com/FanisIbragimov/devops-netology/blob/main/server.yaml)   
3. Создали конфиг [atlantis.yaml](https://github.com/FanisIbragimov/devops-netology/blob/main/atlantis.yaml)
Предусмотрен запуск двух workspace-ов и включено автопланирование при изменении любых файлов *.tf.  
   
**Задание №3**    
1. Нашли официальный модуль провайдера AWS для создания инстанса [EC2](https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/latest)  
2. В нашем случае для поднятия инстанса проще подключить модуль, чем воспроизводить весь код который реализован в этом модуле.
3. Папка с конфиг [файлами](https://github.com/FanisIbragimov/terraform)
