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
	IP_Range = {"google.com":"192.168.0.1", "drive.google.com":"192.168.0.2", "mail.google.com":"192.168.0.3"}
	IP_Range_NEW = IP_Range.copy()
	while IP_Range.values() != IP_Range_NEW.values():
    		for k, v in IP_Range.items():
        		ip_new = socket.gethostbyname(k)
        		IP_Range_NEW.update({k: ip_new})
        		print('[Error] ' + '<' + k + '>' + ' IP mismatch: ' + '<' + ip_new + '>' + ' ' + '<' + v + '>')
        		IP_Range.update({k: ip_new})
    		break
    		if IP_Range.values() == IP_Range_NEW.values():
        		print('OK')
	print(IP_Range)
	print(IP_Range_NEW)
  ```

![3332](https://user-images.githubusercontent.com/87299405/139091844-b53e0d20-9cdc-4a72-83cc-d89969988759.JPG)


