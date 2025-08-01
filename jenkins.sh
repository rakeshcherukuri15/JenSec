#!/bin/bash
case $1 in
install()
echo "Jenkins is installing"		
sudo apt update
sudo apt install fontconfig openjdk-21-jre
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install Jenkins
;;
stop()
echo "jenkins stopped"
sudo systemctl stop jenkins
;;
status()
echo "the status of jenkins is"
sudo systemctl status jenkins
;;
restart()
echo "jenkins is restarted"
sudo systemctl restart jenkins
;;
start()
echo "jenkins started"
sudo systemctl start jenkins
;;
*()
echo "please pass correct argument.."
echo "usage : sh $0 is start|stop|install|restart :"
;;
esac
