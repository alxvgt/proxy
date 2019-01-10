#!/bin/bash
echo -e "\e[32m> Upping containers ...\e[0m"
sudo docker-compose up --remove-orphans -d

echo -e "\e[32m> Removing intermediates containers ...\e[0m"
sudo docker rmi $(sudo docker images -aq -f 'dangling=true')

echo -e "\e[32m> Waiting for services starting ...\e[0m"
sleep 2

echo -e "\e[32m> Docker containers status ...\e[0m"
sudo docker ps -a
