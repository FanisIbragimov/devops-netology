**Задание №1**   
1. Применение IaaC паттернов позволяют ускорить процесс развертывания среды для разработки путем автоматизации процессов. Кроме ускорения развертывания среды для разработки ускоряется также вывод продукта на рынок. Также за счет применения скриптов мы исключаем возможные проблемы с чловеческим фактором (ошибки и т.д. в процессе ручного развертывания сервисов). Преимущестовм также является стабильность развертывания, исключается дрейф конфигурации.
2. Основопологающий принцип для IaaC  я думаю повторяемость, тоесть создавая паттерны для развертывания мы обеспечиваем повторяемость операции, решение будет идентичное, так как исключается человеческий фактор при котором может возникнуть ошибка или другие изменения, влияющие на работу.

**Задание №2**  
1. Ansible отличается тем, что имеет декларативный и императивный подход, а также push метод передачи, наиболее предпочтительный метод передачи изменений. По сравнению с saltstack проще использовать ansible, так как а saltstack нужно детально описывать инфраструктуру.  
2. Pull модель более надежна. Так как обновление конфигурации идет каждым сервером по расписанию в менее нагруженное время. В модели Pull изменения выталкиваются и устанавливаются централизованно без учета таких особенностей. Плюс новые хосты могут получать изменения, пройдя аутентификацию и авторизацию. 

**Задание №3**   
Установили на компьютер:  
1. VirtualBox  
2. Vagrant  
3. Ansible   
Скриншоты версий соотвтетственно:  

![Снимок экрана от 2021-11-12 20-51-48](https://user-images.githubusercontent.com/87299405/141506609-360eaa05-596c-440f-9876-c9ab7ba60c94.png)  
![Снимок экрана от 2021-11-12 20-55-22](https://user-images.githubusercontent.com/87299405/141506645-cfb7a4c3-32f2-4ebb-946c-5744369d2feb.png)  
![Снимок экрана от 2021-11-12 21-07-34](https://user-images.githubusercontent.com/87299405/141506664-9d71d535-b258-4c1d-a8c7-fdcfd1d90860.png)


**Задание №4**   

Добавил все файлы для автоматического создания ВМ и установки docker, но почему то выходит такая ошибка при создании ВМ.

```root@ubuntu1:~/vagrant# vagrant up
Bringing machine 'server1.netology' up with 'virtualbox' provider...
==> server1.netology: Box 'bento/ubuntu-20.04' could not be found. Attempting to find and install...
    server1.netology: Box Provider: virtualbox
    server1.netology: Box Version: >= 0
==> server1.netology: Loading metadata for box 'bento/ubuntu-20.04'
    server1.netology: URL: https://vagrantcloud.com/bento/ubuntu-20.04
==> server1.netology: Adding box 'bento/ubuntu-20.04' (v202107.28.0) for provider: virtualbox
    server1.netology: Downloading: https://vagrantcloud.com/bento/boxes/ubuntu-20.04/versions/202107.28.0/providers/virtualbox.box
Download redirected to host: vagrantcloud-files-production.s3-accelerate.amazonaws.com
==> server1.netology: Successfully added box 'bento/ubuntu-20.04' (v202107.28.0) for 'virtualbox'!
==> server1.netology: Importing base box 'bento/ubuntu-20.04'...
==> server1.netology: Matching MAC address for NAT networking...
==> server1.netology: Checking if box 'bento/ubuntu-20.04' version '202107.28.0' is up to date...
A VirtualBox machine with the name 'server1.netology' already exists.
Please use another name or delete the machine with the existing
name, and try again.
root@ubuntu1:~/vagrant# vagrant global-status
id       name             provider   state    directory                           
----------------------------------------------------------------------------------
faa899e  server1.netology virtualbox poweroff /root/vagrant                       
 
The above shows information about all known Vagrant environments
on this machine. This data is cached and may not be completely
up-to-date (use "vagrant global-status --prune" to prune invalid
entries). To interact with any of the machines, you can go to that
directory and run Vagrant, or you can use the ID directly with
Vagrant commands from any directory. For example:
"vagrant destroy 1a2b3c4d"
root@ubuntu1:~/vagrant# 
```   

Содержимое ansible.cfg  

```[defaults]
inventory=./inventory
deprecation_warnings=False
command_warnings=False
ansible_port=22
interpreter_python=/usr/bin/python3
```   

Содержимое Vagrantfile  
```
ISO = "bento/ubuntu-20.04"
NET = "192.168.192."
DOMAIN = ".netology"
HOST_PREFIX = "server"
INVENTORY_PATH = "../ansible/inventory"
servers = [
{
:hostname => HOST_PREFIX + "1" + DOMAIN,
:ip => NET + "11",
:ssh_host => "20011",
:ssh_vm => "22",
:ram => 1024,
:core => 1
}
]

Vagrant.configure(2) do |config|
config.vm.synced_folder ".", "/vagrant", disabled: false
servers.each do |machine|
config.vm.define machine[:hostname] do |node|
node.vm.box = ISO
node.vm.hostname = machine[:hostname]
node.vm.network "private_network", ip: machine[:ip]
node.vm.network :forwarded_port, guest: machine[:ssh_vm],
host: machine[:ssh_host]
node.vm.provider "virtualbox" do |vb|
vb.customize ["modifyvm", :id, "--memory", machine[:ram]]
vb.customize ["modifyvm", :id, "--cpus", machine[:core]]
vb.name = machine[:hostname]
end
node.vm.provision "ansible" do |setup|
setup.inventory_path = INVENTORY_PATH
setup.playbook = "../ansible/provision.yml"
setup.become = true
setup.extra_vars = { ansible_user: 'vagrant' }
end
end
end
end
```  


