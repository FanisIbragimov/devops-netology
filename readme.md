1.+  
2.+  
3.+  
4.vagrant suspend, vagrant up, vagrant halt выполняются корректно.
5.ОЗУ 1024 Мб, 2 CPU, GPU Ram 4Mb, HDD Virtual 64Гб динамический. NAT
6.Добавление оперативной памяти осуществляться путем изменения конфигурационного файла vagrantfile. Добавляем следующие строки
	config.vm.provider :virtualbox do |vb|
  		vb.customize ["modifyvm", :id, "--memory", "2048"]
		vb.customize ["modifyvm", :id, "--cpus", "3"]
	end
7.+
8.HISTSIZE, строка 844.
  ignoreboth не записывет команды которые начинаются с пробела или команду которая дублируется.
9. Строка 257.
10. Получилось создать 100000 файлов вызовом touch a{1..100000}. Создать 300000 файлов не удалось, ошибка argument list too long.
11. Конструкция [[ -d /tmp ]] используется в условных выражениях.      Принимает значение Истина если файл существет и директория  -d file  True if file exists and is a directory.
12. export PATH=/tmp/new_path_directory/:$PATH
13. Планирование задание командой batch отличается от at тем, что при batch задание выполняется в зависимости от степени загрузки системы.
14. vagrant halt.
