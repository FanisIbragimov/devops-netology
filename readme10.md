**ЗАДАНИЕ №1**  
Скорректировал json скрипт по требованиям. Вывод прилагается.
  ```BASH
  { "info": "Sample JSON output from our service\t",
    "elements": [
        { "name": "first",
        "type": "server",
        "ip": "7175" 
        },
        { "name": "second",
        "type": "proxy",
        "ip": "71.78.22.43"
        }
    ]
  }
  ```
  
![137679067-0d56fb79-c702-4285-a3da-5bce34e18f33](https://user-images.githubusercontent.com/87299405/137909425-3b786d25-3b10-496e-bb68-379fedf855cb.png)


**ЗАДАНИЕ №2**   
Дополнил скрипт из предудыщего задания следующим фрагментом:
Для json
```
    with open('1.json', 'w') as file:
        json.dump(IP_Range, file)
```
![json](https://user-images.githubusercontent.com/87299405/147470425-01759d1e-ccc8-4967-80a9-78348f804b9a.JPG)


```
    with open('1.yaml', 'w') as file:
        yamlStr = yaml.dump(IP_Range, file)
```
![Yaml](https://user-images.githubusercontent.com/87299405/147470429-1d08f730-fec0-4f29-9c48-08fac34f2bc2.JPG)
