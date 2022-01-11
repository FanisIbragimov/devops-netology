**ЗАДАНИЕ №4**  
Здравствуйте, Филипп! Спасибо за проверку моего ДЗ. Я переименовал переменные  маленькой буквы.   
Сделал проверку циклом for. Далее идет проверка ip и запись новых значений в словарь. Сначала появились 3 значения об ошибке.   
По истечении 2-5 минут появились новые сообщения о смене адресов.    

  ```bash
import socket
import json
import yaml

ip_range = {"google.com": "74.125.131.10", "drive.google.com": "142.250.10.194", "mail.google.com": "173.14.222.18"}
ip_range_new = ip_range.copy()
while ip_range_new.values() != ip_range.values():
    for k in ip_range_new:
        ip_new = socket.gethostbyname(k)
        ip_range_new[k] = ip_new
        ip_range_new.update({k: ip_new})
        if ip_range_new[k] != ip_range[k]:
            print("Error  {}  IP mismatch:  {} {}".format(k, ip_range_new[k], ip_range[k]))
        ip_range = ip_range_new.copy()
  ```
  
![111](https://user-images.githubusercontent.com/87299405/148990338-8c54d07e-08a6-40ff-baae-ab1fc817cd50.png)


