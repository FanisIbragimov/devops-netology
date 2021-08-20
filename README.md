1. Команда сd делает системный вызов "chdir"  
2. База данных file предполагаю находится по адресу /etc/magic.  
3.   
4. Зомби процессы не занимают системные ресурсы, но занимаемые записи в таблице процессов становятся не доступны.  
5. Изначально шли вызовы по таким адресам:
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libpthread.so.0", O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libdl.so.2", O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libutil.so.1", O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libm.so.6", O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libexpat.so.1", O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libz.so.1", O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD, "/usr/lib/locale/locale-archive", O_RDONLY|O_CLOEXEC) = 3
openat(AT_FDCWD, "/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache", O_RDONLY) = 3
openat(AT_FDCWD, "/usr/bin/pyvenv.cfg", O_RDONLY) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/usr/pyvenv.cfg", O_RDONLY) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/etc/localtime", O_RDONLY|O_CLOEXEC) = 3
6. Для вывода этой информации используется системный вызов uname. Цитата из man по Uname (2) - Part of the utsname information is also accessible via /proc/sys/kernel/{ostype, hostname, osrelease, version, domainname}.
7. Выполнение команд через ; осуществляется последовательно независимо от результата их выполнения. Выполнение команд через && осуществляется также последовательно, но зависит от результата выполнения предыдущей. В нашем случае после выполнения первой команды возвращается 0 и вторая уже не выполняется. set -e завершает работу сеанса при возврате 0. Ее применение зависит от цели.  
8. set -euxo pipefail состоит из опций -e,-u,-x,-o и pipefail. Эти ключ помогаю прекратить выполнение скрипта при определенных ошибках кода.  
9. Наибелее часто встречающийся статус S - спящие процессы. Дополнительные буквы означают дополнительную информацию, например s-лидер сессии, l -многопоточный.
