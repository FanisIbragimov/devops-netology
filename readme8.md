**Задание №1**  
Работа с переменными  
  
  ```bash
  root@vagrant: a=1
  root@vagrant: b=2
  root@vagrant: c=a+b
  root@vagrant: d=$a+$b
  root@vagrant: e=$(($a+$b))
  root@vagrant: echo c
  c
  root@vagrant: echo $c
  a+b
  root@vagrant: echo $d
  1+2
  root@vagrant: echo $e
  3
  ```  
  
Когда присваиваем значения переменным a,b bash воспринимает их как строку. При выводе с он воспринимает как строку и выводит a+b.  
При вводе значения d и $a+$b bash переводит a и b в число. Но выводит результат как строку 1+2  
При вводе e уже идет суммирование значение a и b и выводится сумма.  
  
**Задание №2**  
Первоначальный код вообще не запустился. Ошибка была в незакрытой скобке первой строки.

  ```bash 
  while ((1==1))  
  do  
  curl https://localhost:4757  
  if (($? !=0))  
  then  
  date >> curl.log  
  ```
  
Для того чтобы скрипт завершал запись при появлении пакетов добавим   
  ```bash 
  else break  
  fi  
  done  
  ```
  
**Задание №3**  
Скрипт для проверки доступности хостов.  
  
  ```bash 
  IP=("http://192.168.0.1:80, http://173.194.222.113:80, http://87.250.250.242:80")
  for i in {1..5} do  
  curl $IP >> 1.log  
  done  
  ```
   
**Задание №4**  
Скрипт  

  ```bash 
  IP=("http://192.168.0.1:80, http://173.194.222.113:80, http://87.250.250.242:80")  
  while ((1==1))  
  do   
  for i in ${IP[@]}  
  do   
  curl $IP  
  done  
  if (($? = 0))  
  then  
  $IP >> curl.log  
  fi  
  done    
  ```
