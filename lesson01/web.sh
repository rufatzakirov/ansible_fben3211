#!/bin/bash

#1) установка пакетов (nginx)
ansible all -m yum -a "name=nginx state=present"

#2) systemctl --now enable nginx
ansible all -m service -a "name=nginx state=started enabled=true"

#3) Дать разрешение на 80 порт
 
ansible all -m firewalld -a "service=http permanent=true immediate=true state=enabled"

#4) Изменить контент сайта на Веб и ДБ серверах

ansible web_servers -m copy -a "content='Hello Web Server!' dest=/usr/share/nginx/html/index.html"

ansible db_servers -m copy -a "content='Hello DB Server!' dest=/usr/share/nginx/html/index.html"
