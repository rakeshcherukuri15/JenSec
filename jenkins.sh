 #!/bin/bash
case $1 in
install)
                echo "Jenkins is installed"
sudo apt update
sudo apt install fontconfig openjdk-21-jre
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install Jenkins
                echo "Installed jenkins"
                ;;
                stop)
                systemctl stop jenkins
                echo "jenkins stopped"
                ;;
                restart)
systemctl restart jenkins
echo "jenkins is restarted"
;;
start)
        systemctl start jenkins
        echo "jenkins started"
        ;;
*)
        echo "please pass correct argument.."
        echo "usage : sh $0 is start|stop|install|restart :"
        ;;
esac
