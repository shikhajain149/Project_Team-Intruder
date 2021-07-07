## Steps to Create a Network/Switch ##



```
docker network create network_name --subnet ip_series
docker network ceate myhadoop_br --subnet 172.31.49.70
```



## Create Containers ##



```
docker  run  -itd --name  namenode  --hostname namenode --network myhadoop_br --ip 172.31.49.12 oraclelinux:8.3  bash  
docker  run  -itd --name  datanode1  --hostname datanode1 --network myhadoop_br  oraclelinux:8.3  bash 
docker  run  -itd --name  datanode2  --hostname datanode2 --network myhadoop_br  oraclelinux:8.3  bash 
``` 



## Connecting Datanodes with Namenode through Ip and Name ##


'''
docker exec -it namenode bash 
ping 172.31.49.12
ping namenode
ping datanode1

'''

## Install Java on Container ##



```
dnf  install  java-1.8.0-openjdk.x86_64  java-1.8.0-openjdk-devel.x86_64 -y
``` 



## Set Path of Java in Linux .bashrc File ##



Go to .bashrc File
```
cd ~
vi .bashrc
```
Check Java Version
```
java -version
```
Add This to your .bashrc file 
```
JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.292.b10-1.el8_4.x86_64
PATH=$PATH:$JAVA_HOME/bin
export PATH
```



## Install Hadoop ##



```
wget https://downloads.apache.org/hadoop/common/stable/hadoop-3.3.1.tar.gz
```



## Transfer Hadoop to Containers ##



```
docker cp hadoop-3.3.1.tar.gz namenode:/
docker cp hadoop-3.3.1.tar.gz datanode1:/
docker cp hadoop-3.3.1.tar.gz datanode2:/
```


## Unzip and Install Hadoop File ##



```
dnf install tar -y
tar -xvf hadoop-3.3.1.tar.gz
```



## Configuration File Changes ##
# 1. core-site.xml 

'''
docker exec -it namenode bash
vi core-site.xml
<configuration>
  <property>
    <name> fs.default.name</name>
    <value>hdfs://namenode:9000</value>
  </property>
  <configuration>
