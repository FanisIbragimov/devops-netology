7. Выполнение команд через ; осуществляется последовательно независимо от результата их выполнения. Выполнение команд через && осуществляется также последовательно, но зависит от результата выполнения предыдущей. В нашем случае после выполнения первой команды возвращается 0 и вторая уже не выполняется. set -e завершает работу сеанса при возврате 0. Ее применение зависит от цели.  
8. set -euxo pipefail состоит из опций -e,-u,-x,-o и pipefail. Эти ключ помогаю прекратить выполнение скрипта при определенных ошибках кода.  
9. 
