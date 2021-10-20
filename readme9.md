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
    print(result)
    b = (bash_command[0]).split(' ')
    print(b[1])
  ```
  
![2222](https://user-images.githubusercontent.com/87299405/137577232-88db6e95-5f2a-4e78-acc6-7666edd5b552.png)


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
    b = (bash_command[0]).split(' ')
    print(b[1])
```
  
![111](https://user-images.githubusercontent.com/87299405/137577244-8767feb9-82fb-493a-86bf-fb699dfcc36f.png)

**ЗАДАНИЕ №4**  
С этим заданием так вот получилось  
  ```bash
  import socket
  IP_Range = ["google.com", "drive.google.com", "mail.google.com"]
  for i in range(len(IP_Range)): print(IP_Range[i]), socket.gethostbyname(IP_Range[i])
  ```

![333](https://user-images.githubusercontent.com/87299405/138063538-dc752532-97a4-4d4c-85fe-5a3e53feeedf.png)
