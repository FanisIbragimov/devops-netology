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
8. 



