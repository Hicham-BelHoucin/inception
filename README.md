# inception
**This project aims to broaden your knowledge of system administration by using Docker. You will virtualize several Docker images, creating them in your new personal virtual machine.**

# What i Did in that project 

+ I created A Docker container that contains NGINX with TLSv1.2
+ I created A Docker container that contains WordPress + php-fpm 
+ I created A Docker container that contains MariaDB 

# What is docker 

[What Is docker ? ](https://docs.docker.com/get-started/overview/)

[Understand how docker works .](https://youtu.be/Tyy1BUEmhwg)

# Difference between virtual machines and docker containers 

[Difference between virtual machines and docker container](https://cloudacademy.com/blog/docker-vs-virtual-machines-differences-you-should-know/)

![Difference between virtual machines and docker container](./containers-vs-virtual-machines.jpg)

# Let's set up nginx 

**This command is for generate ssl certificate**
```
openssl req -x509 -sha256 -days 356 -nodes -newkey rsa:2048 -keyout <where to put the key> -out <where to put sertificate> -subj "/C=MA/ST=khouribga/L=khouribga/O=1337/OU=1337/CN=nginx"
```
## Let's understand this command : 

**`openssl` OpenSSL is a versatile command line tool that can be used for a large variety of tasks related to Public Key Infrastructure (PKI) and HTTPS (HTTP over TLS).**
**`req` certificate request and certificate generating utility.**
**`-sha256` You can add this option to sign the CSR with SHA-2**
**`-nodes` You add this option if you don't wan't to protect your key with a passphrase.**
**`-x509` this option outputs a self signed certificate instead of a certificate request. This is typically used to generate a test certificate or a self signed root CA**
**`-newkey arg` creates a new certificate request and a new private key, the argument takes one of serval forms `ex : rsa:nbits` where `nbits` is the size of the key in bits**
**`-days` By adding this option you specify the expration date**
**`-keyout` specify where to put your generated private key**
**`-out` specify where to put your generated certificate**
**`-subj "/C=MA/ST=khouribga/L=khouribga/O=1337/OU=1337/CN=nginx` If you want to non-interactively answer the CSR information prompt, you can do so by adding this option to any OpenSSL commands that request CSR information**

# Let's set up Mariadb

## What is mariadb ? 

**MariaDB is a free and open-source relational database management system. It is a fork of the MySQL database and is considered a drop-in replacement for MySQL. MariaDB was created by the original developers of MySQL, after Oracle Corporation acquired MySQL AB and took over development of the MySQL database.**

**MariaDB is designed to be a powerful, scalable and reliable SQL server. It supports a wide range of storage engines, including the InnoDB storage engine that is also used by MySQL. It also includes a number of additional features and improvements over MySQL, such as improved performance, better security, and more flexibility.**

**MariaDB is popular for use in web and application servers, as well as for data warehousing and business intelligence applications. It is widely used by many popular open-source projects and is supported by a large and active community of developers and users**

## How to set up maria db ? 

[check this link !!!!](https://docs.bitnami.com/ibm/apps/silverstripe/configuration/create-database-mariadb/)

```CREATE DATABASE IF NOT EXISTS 'new_database';``` **This statement will create the db new_database if the db does not already exist. If the db already exists, the statement will do nothing.**

```CREATE USER IF NOT EXISTS 'myuser'@'localhost' IDENTIFIED BY 'mypassword';``` **This statement will create the user myuser with the password mypassword if the user does not already exist. If the user already exists, the statement will do nothing.**

```SHOW DATABASES;``` **This statement will show all dbs**

```ALTER USER 'myuser'@'localhost' IDENTIFIED BY 'newpassword';``` **This statement will change the password of an existing user named myuser to newpassword**

```SHOW GRANTS FOR 'myuser'@'localhost';``` **This statement to see the privileges that a user has been granted.**

```GRANT ALL PRIVILEGES ON mydatabase.* TO 'myuser'@'localhost' IF NOT EXISTS;``` **This statement grants ALL privileges on all tables in the mydatabase database to the user myuser if it exists or not.**

```FLUSH PRIVILEGES``` **is used to apply changes**

# Let's set up Mariadb

## how to set up wordpress

**install wp core tool to install word press properly**
```curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar``` **clone the tool from github**
```chmod +x wp-cli.phar ``` **add execution rule to it**
```mv wp-cli.phar /usr/local/bin/wp``` **Move the WP-CLI Phar file to a directory that is in your system's PATH**
```wp core download --allow-root``` **download the latest version of the WordPress**
```mv wp-config-sample.php wp-config.php ``` **rename config file**
```
sed -i "s/database_name_here/$MYSQL_WP_DBNAME/1" wp-config.php # add your database name
sed -i "s/username_here/$MYSQL_USERNAME/1" wp-config.php # add your user name
sed -i "s/password_here/$MYSQL_PASSWORD/1" wp-config.php # add your password
sed -i "s/localhost/mariadb/1" wp-config.php 
```
```wp core install ``` **install wordpresss**
```wp user create ``` **create new user**

# Some useful resources :

+ [What are SSL/TLS Certificates? Why do we Need them? and How do they Work?](https://youtu.be/r1nJT63BFQ0)
+ [Understand what is docker ](https://youtu.be/pTFZFxd4hOI)
+ [Understand what is docker compose](https://youtu.be/HG6yIjZapSA)
+ [Understand what is nginx and why nginx](https://youtu.be/7VAI73roXaY)
+ [Set up nginx with ssl](https://youtu.be/X3Pr5VATOyA)
+ [How does HTTPS work? What's a CA? What's a self-signed Certificate?](https://youtu.be/T4Df5_cojAs)
