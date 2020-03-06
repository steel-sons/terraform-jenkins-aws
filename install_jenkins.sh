#!/bin/bash
# Here we updating YUM on instance AWS node
# Installing Java, Git, Docker and Jenkins
# 03022020 is
sudo yum -y update

echo "Install Java JDK 8"
yum remove -y java
yum install -y java-1.8.0-openjdk

echo "Install git"
yum install -y git

echo "Install Docker engine"
yum update -y
yum install docker -y
sudo chkconfig docker on

############################
## Terraform installation ##
############################
## Get terraform package preferably => ver 0.12
wget -O https://releases.hashicorp.com/terraform/0.12.21/terraform_0.12.21_linux_amd64.zip
sleep 30

## Unzip the package
sudo unzip terraform_0.12.21_linux_amd64.zip -d /usr/local/bin/ && rm terraform_0.12.21_linux_amd64.zip

## Move the package to /usr/local/bin
#sudo mv terraform /usr/local/bin/ && rm terraform_0.12.21_linux_amd64.zip

## Check if terraform working properly
terraform --version

echo "Install Jenkins"
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
yum install -y jenkins
sudo usermod -a -G docker jenkins
sudo chkconfig jenkins on

echo "Start Docker & Jenkins services"
sudo service docker start
sudo service jenkins start
