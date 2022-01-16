**Задание №1**    
1. Установили Golang.   
   
**Задание №2**    
1. Ознакомились с Gotour.  

**Задание №3**    
1. Программа перевода метров в футы.   
```
package main
import "fmt"
func main() {
    fmt.Print("Введите значение: ")
    var in float64
    fmt.Scanf("%f", &in)
    conv := in * 0.3048
    fmt.Println(conv)
}
```      
Результат выполнения программы:   

![Снимок экрана от 2022-01-16 14-10-59](https://user-images.githubusercontent.com/87299405/149656267-c0e63da9-f898-48f9-b2f9-bdefc5ab18a6.png)

2. Программа поиска наименьшего элемента массива.   
   
```
package main
import "fmt"
func main() {
        x := []int{48,96,86,68,57,82,63,70,37,34,83,27,19,97,9,17,}
        fmt.Println(x[len(x)-1])
}
```   
   
Скрин выполненения программы:   
![Снимок экрана от 2022-01-16 14-40-23](https://user-images.githubusercontent.com/87299405/149656710-84342260-0e84-4e42-beb5-9406a15fb95e.png)    
   
3.Программа для вывода целых чисел массива, которые деляться на 3
```
  GNU nano 2.9.3                         3.go                                   

package main
import (
        "fmt"
)
func main() {
        for n := 1; n <= 100; n++ {
                if n%3 == 0 {
                        fmt.Println(n)
                }
        }
}
```
   
Скрин выполнения программы:
![Снимок экрана от 2022-01-16 15-05-46](https://user-images.githubusercontent.com/87299405/149657391-68db0bdc-5e23-4720-9d77-3eb604757cfb.png)

