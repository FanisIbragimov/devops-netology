**ЗАДАНИЕ №1.**  
Какое значение будет присвоено переменной c?  
При вводе данного кода никакого значени не будет выведено. Так как а и b разные типы данных (str и int)  
  
Как получить для переменной c значение 12?  
Чтобы получить значение 12 нужно присвоить переменной а значение 1 как строка  
a='1'.  
   
Как получить для переменной c значение 3? Чтобы получить значение 3 нужно перевести переменную b в численный тип.  
b=2.  
  
**ЗАДАНИЕ №2**  
Для решения применил следующий скрипт. Выводит измененные файлы и выдает текущую директорию.    
  
  ```bash
  import os
  bash_command = ["cd /home/netology", "git status"]
  result_os = os.popen(' && '.join(bash_command)).read()
  for result in result_os.split('\n'):
	  if result.find('modified') != -1:
		  git_repo = (bash_command[0]).split(' ')
		  print(git_repo[1]+'/'+result.replace('modified:   ',''))

  ```
  ![1](https://user-images.githubusercontent.com/87299405/138692651-ce93beb8-b5fd-4a85-b64a-a3c832fe585e.JPG)


**ЗАДАНИЕ №3**  
Для реализации этого функционала мы используем модуль sys.argv  
Запускаем скрипт с доп аргументом и получаем результат вывода в зависимости от него.  
  
```bash
import os
import sys
d = sys.argv[1]
bash_command = [f"cd {d}", "git status"]
result_os = os.popen(' && '.join(bash_command)).read()
for result in result_os.split('\n'):
  if result.find('modified') != -1:
    print(result)
    git_repo = (bash_command[0]).split(' ')
    print(git_repo[1]+'/'+result.replace('modified:   ',''))
```

![2](https://user-images.githubusercontent.com/87299405/138694488-82ced2dd-dce7-4838-a5fa-a120049271c3.JPG)


**ЗАДАНИЕ №4**  
С этим заданием так вот получилось  
  ```bash
import socket

IP_Range = {"google.com": "74.125.131.10", "drive.google.com": "142.250.10.194", "mail.google.com": "173.14.222.18"}
IP_Range_NEW = IP_Range.copy()
while IP_Range_NEW.values() != IP_Range.values():
    for k in IP_Range_NEW:
        ip_new = socket.gethostbyname(k)
        IP_Range_NEW[k] = ip_new
        IP_Range_NEW.update({k: ip_new})
        if IP_Range_NEW['google.com'] != IP_Range['google.com']:
            print('[Error] ' + '<' + 'google.com' + '>' + ' IP mismatch: ' + '<' + IP_Range_NEW['google.com'] + '>' + ' ' + '<' + IP_Range['google.com'] + '>')
        elif IP_Range_NEW['drive.google.com'] != IP_Range['drive.google.com']:
            print('[Error] ' + '<' + 'drive.google.com' + '>' + ' IP mismatch: ' + '<' + IP_Range_NEW['drive.google.com'] + '>' + ' ' + '<' + IP_Range['drive.google.com'] + '>')
        elif IP_Range_NEW['mail.google.com'] != IP_Range['mail.google.com']:
            print('[Error] ' + '<' + 'mail.google.com' + '>' + ' IP mismatch: ' + '<' + IP_Range_NEW['mail.google.com'] + '>' + ' ' + '<' + IP_Range['mail.google.com'] + '>')
        else:
            print('OK')
        IP_Range = IP_Range_NEW.copy()
  ```

![Снимок](https://user-images.githubusercontent.com/87299405/147404188-a5dfee42-cb51-4a73-870f-451a4c1dffc5.JPG)



