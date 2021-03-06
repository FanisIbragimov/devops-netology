**Задание №1**    
1. Создали учетную запись в terraform cloud.   
2. Создали репозиторий и запушили файлы из прошлого ДЗ.   
3. Зарегистрировали этот репозиторий в https://app.terraform.io/.
4. Применили plan, apply и создались instance.
    ![ec2](https://user-images.githubusercontent.com/87299405/150907168-2f043497-0c01-4d8a-b69d-0678dd63e13e.png)
  
   
**Задание №2**    
1. Изучили документацию по Atlantis  
2. Создали конфиг серверной части [server.yaml](https://github.com/FanisIbragimov/devops-netology/blob/main/server.yaml)   
3. Создали конфиг [atlantis.yaml](https://github.com/FanisIbragimov/devops-netology/blob/main/atlantis.yaml)
Предусмотрен запуск двух workspace-ов и включено автопланирование при изменении любых файлов *.tf.  
   
**Задание №3**    
1. Нашли официальный модуль провайдера AWS для создания инстанса [EC2](https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/latest)  
2. В нашем случае для поднятия инстанса проще подключить модуль, чем воспроизводить весь код который реализован в этом модуле.
3. Папка с конфиг [файлами](https://github.com/FanisIbragimov/terraform)
```
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.72.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
resource "aws_s3_bucket" "my-s3-bucket" {
  bucket_prefix = var.bucket_prefix
  acl = var.acl
  
   versioning {
    enabled = var.versioning
  }
  
  tags = var.tags
}

data "aws_ami" "debian_buster" {
  filter {
    name = "name"
    values = [ "debian-10-amd64-*" ]
  }
  most_recent = true
  owners = [
    "136693071363"
  ] // https://wiki.debian.org/Cloud/AmazonEC2Image
}

locals {
web_instance_type_map = {
 stage = "t2.micro"
 prod = "t2.large"
}
instances = {
 "t2.micro" = data.aws_ami.debian_buster.id
 "t2.large" = data.aws_ami.debian_buster.id
}
}
resource "aws_instance" "web" {
  for_each = local.instances
  ami = each.value
  instance_type = each.key
  lifecycle {
    create_before_destroy = true
  }
}

```
