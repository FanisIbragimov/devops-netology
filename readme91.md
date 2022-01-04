**ЗАДАНИЕ №4**  
Здравствуйте, Филипп! Спасибо за проверку моего ДЗ. Подскажите пожалуйста, не совсем понимаю то, что нужно исправить.   

  ```bash
import socket
#Я завожу словарь адресов с IP.
IP_Range = {"google.com": "74.125.131.10", "drive.google.com": "142.250.10.194", "mail.google.com": "173.14.222.18"} 
#Далее делаю копию этого словаря, для получения новых ip
IP_Range_NEW = IP_Range.copy()
#Далее делаю цикл while для бесконечной проверки изменения ip в двух словарях.
while IP_Range_NEW.values() != IP_Range.values():
    #Для k ключа циклом for делаю перебор значений для словаря IP_Range_NEW.
    for k in IP_Range_NEW:
        #получаю новые значения словаря.
        ip_new = socket.gethostbyname(k)
        
        #записываю новые значения для каждого k. Вот это я  поменял по Вашему замечанию.
        IP_Range_NEW[k] = ip_new   
        
        #обновил значения в словаре.
        IP_Range_NEW.update({k: ip_new})
        
        #здесь циклом проверяю неравенство значений словарей и вывод сообщения. (Какой вид цикла тут лучше использовать? if не подойдет?
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
