**Подготовка к выполнению**    
1. Выполнена установка ansible.   
2. Создан отдельный репозиторий https://github.com/FanisIbragimov/ansible  
3. Переместили файлы из папки playbook.  

**Основная часть**    
1. Запустили плейбук. Значение **somefact = 12**.   
2. Заменили значение переменной из 1 задания на "all default fact"   
3. Создали два докер контейнера с именами centos7 и ubuntu.   
4. Провели запуск из prod.yml. Значения:   
```
ok: [centos7] => {
    "msg": "el"
}
ok: [ubuntu] => {
    "msg": "deb"
}
```    
5. Изменили значения переменной в deb и el на 'deb default fact' и 'el default fact' соответственно.  
6. Запустили плейбук заново. Вышли такие значения:
```
ok: [centos7] => {
    "msg": "el default fact"
}
ok: [ubuntu] => {
    "msg": "deb default fact"
}
```    
7. Зашифровали файлы group_vars/deb и group_vars/el с паролем netology.    
8. Запустили плейбук с зашифрованными файлами с запросом пароля "ansible-playbook site.yml -i inventory/prod.yml --ask-vault-pass". Все прошло успешно.   
9. Для работы на control node целесообразно использовать плагин docker или local.   
10. Добавили в prod.yml хост local:
```
---
  el:
    hosts:
      centos7:
        ansible_connection: docker
  deb:
    hosts:
      ubuntu:
        ansible_connection: docker
  local:
    hosts:
      localhost:
        ansible_connection: local
```    
11. Запустили ansible. Вывод:
```
ok: [localhost] => {
    "msg": "all default fact"
}
ok: [centos7] => {
    "msg": "el default fact"
}
ok: [ubuntu] => {
    "msg": "deb default fact"
}
```   
    
**Необязательная часть**    
1. Расшифровали ранее зашифрованные файлы.   
![Снимок экрана от 2022-02-06 16-26-56](https://user-images.githubusercontent.com/87299405/152680686-edefbc50-8ecc-41f0-b149-1b2b19de2804.png)   
2.Зашифровали пароль в строке some_fact: 
![Снимок экрана от 2022-02-06 16-37-39](https://user-images.githubusercontent.com/87299405/152681096-271b3c4a-4f76-47f6-82b1-e10915e1e928.png)   

