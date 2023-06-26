# inception

This project aims to broaden your knowledge of system administration by using Docker. You will virtualize several Docker images, creating them in your new personal virtual machine.

# Tech Stack Used

- ![NGINX](https://img.shields.io/badge/NGINX-269539?style=for-the-badge&logo=nginx&logoColor=white) with ![TLSv1.2](https://img.shields.io/badge/TLSv1.2-FF4088?style=for-the-badge&logo=ssl&logoColor=white)
- ![WordPress](https://img.shields.io/badge/WordPress-21759B?style=for-the-badge&logo=wordpress&logoColor=white) + ![php-fpm](https://img.shields.io/badge/php--fpm-777BB4?style=for-the-badge&logo=php&logoColor=white)
- ![MariaDB](https://img.shields.io/badge/MariaDB-003545?style=for-the-badge&logo=mariadb&logoColor=white)
- ![Redis](https://img.shields.io/badge/Redis-DC382D?style=for-the-badge&logo=redis&logoColor=white)
- ![FTP](https://img.shields.io/badge/FTP-0254B5?style=for-the-badge&logo=ftp&logoColor=white)
- ![Adminer](https://img.shields.io/badge/Adminer-00758F?style=for-the-badge&logo=php&logoColor=white)
- ![cAdvisor](https://img.shields.io/badge/cAdvisor-4285F4?style=for-the-badge&logo=docker&logoColor=white)
- Simple static website

# What i Did in that project

- I created A Docker container that contains NGINX with TLSv1.2
- I created A Docker container that contains WordPress + php-fpm
- I created A Docker container that contains MariaDB
- I created A Docker container that contains redis
- I created A Docker container that contains ftp
- I created A Docker container that contains adminer
- I created A Docker container that contains cadvisor
- I created A Docker container that contains simple static website

# What is docker

[What Is docker ? ](https://docs.docker.com/get-started/overview/)

[Understand how docker works .](https://youtu.be/Tyy1BUEmhwg)

# Difference between virtual machines and docker containers

[Difference between virtual machines and docker container](https://cloudacademy.com/blog/docker-vs-virtual-machines-differences-you-should-know/)

![Difference between virtual machines and docker container](./containers-vs-virtual-machines.jpg)

# Let's set up nginx

#### This command is for generate ssl certificate

```
openssl req -x509 -sha256 -days 356 -nodes -newkey rsa:2048 -keyout <where to put the key> -out <where to put sertificate> -subj "/C=MA/ST=khouribga/L=khouribga/O=1337/OU=1337/CN=nginx"
```

## Let's understand this command :

`openssl` OpenSSL is a versatile command line tool that can be used for a large variety of tasks related to Public Key Infrastructure (PKI) and HTTPS (HTTP over TLS).
`req` certificate request and certificate generating utility.
`-sha256` You can add this option to sign the CSR with SHA-2
`-nodes` You add this option if you don't wan't to protect your key with a passphrase.
`-x509` this option outputs a self signed certificate instead of a certificate request. This is typically used to generate a test certificate or a self signed root CA
`-newkey arg` creates a new certificate request and a new private key, the argument takes one of serval forms `ex : rsa:nbits` where `nbits` is the size of the key in bits
`-days` By adding this option you specify the expration date
`-keyout` specify where to put your generated private key
`-out` specify where to put your generated certificate
`-subj "/C=MA/ST=khouribga/L=khouribga/O=1337/OU=1337/CN=nginx` If you want to non-interactively answer the CSR information prompt, you can do so by adding this option to any OpenSSL commands that request CSR information

# Let's set up Mariadb

## What is mariadb ?

MariaDB is a free and open-source relational database management system. It is a fork of the MySQL database and is considered a drop-in replacement for MySQL. MariaDB was created by the original developers of MySQL, after Oracle Corporation acquired MySQL AB and took over development of the MySQL database.

MariaDB is designed to be a powerful, scalable and reliable SQL server. It supports a wide range of storage engines, including the InnoDB storage engine that is also used by MySQL. It also includes a number of additional features and improvements over MySQL, such as improved performance, better security, and more flexibility.

MariaDB is popular for use in web and application servers, as well as for data warehousing and business intelligence applications. It is widely used by many popular open-source projects and is supported by a large and active community of developers and users

## How to set up maria db ?

[check this link !!!!](https://docs.bitnami.com/ibm/apps/silverstripe/configuration/create-database-mariadb/)

`CREATE DATABASE IF NOT EXISTS 'new_database';` This statement will create the db new_database if the db does not already exist. If the db already exists, the statement will do nothing.

`CREATE USER IF NOT EXISTS 'myuser'@'localhost' IDENTIFIED BY 'mypassword';` This statement will create the user myuser with the password mypassword if the user does not already exist. If the user already exists, the statement will do nothing.

`SHOW DATABASES;` This statement will show all dbs

`ALTER USER 'myuser'@'localhost' IDENTIFIED BY 'newpassword';` This statement will change the password of an existing user named myuser to newpassword

`SHOW GRANTS FOR 'myuser'@'localhost';` This statement to see the privileges that a user has been granted.

`GRANT ALL PRIVILEGES ON mydatabase.* TO 'myuser'@'localhost' IF NOT EXISTS;` This statement grants ALL privileges on all tables in the mydatabase database to the user myuser if it exists or not.

`FLUSH PRIVILEGES` is used to apply changes

# Let's set up Mariadb

## how to set up wordpress

install wp core tool to install word press properly
`curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar` clone the tool from github
`chmod +x wp-cli.phar ` add execution rule to it
`mv wp-cli.phar /usr/local/bin/wp` Move the WP-CLI Phar file to a directory that is in your system's PATH
`wp core download --allow-root` download the latest version of the WordPress
`mv wp-config-sample.php wp-config.php ` rename config file

```
sed -i "s/database_name_here/$MYSQL_WP_DBNAME/1" wp-config.php # add your database name
sed -i "s/username_here/$MYSQL_USERNAME/1" wp-config.php # add your user name
sed -i "s/password_here/$MYSQL_PASSWORD/1" wp-config.php # add your password
sed -i "s/localhost/mariadb/1" wp-config.php
```

`wp core install ` install wordpresss
`wp user create ` create new user

# make Your self ready for defence

### how does docker and docker compose work

Docker is a platform for developing, shipping, and running applications in containers. Containers are lightweight, portable, and self-sufficient environments that can run on any platform that supports Docker.

Docker Compose is a tool for defining and running multi-container applications with Docker. It allows developers to define the application's services, networks, and volumes in a single `docker-compose.yml` file, and then start and stop all the services with a single command.

When you run `docker-compose up`, Compose reads the `docker-compose.yml` file and creates and starts the defined services. Each service runs in its own container, and the containers can communicate with each other through a shared network.

Additionally, Docker Compose also provides commands for scaling, updating, and stopping services, as well as viewing logs and other information about the running services.

Overall, Docker and Docker Compose work together to make it easier to build, ship, and run applications in containers, providing a consistent and reproducible environment for development and production.

### the difference between docker image used with docker compose and without docker compose

A Docker image is a pre-built, ready-to-run container that includes all the necessary software and dependencies for a specific application or service. When used with Docker Compose, a single image can be defined as a service in the `docker-compose.yml` file, and multiple instances of that image can be run as part of a larger application.

When used without Docker Compose, a Docker image can still be run as a standalone container on a host machine. However, it may require manual configuration of network connections, volumes, and other settings that are typically defined in a `docker-compose.yml` file.

In summary, the main difference is that when using Docker Compose, a single image can be defined as a service and multiple instances can be run as part of a larger application, whereas when using Docker without Compose, an image can be run as a standalone container on a host machine, but with more manual configuration.

### simple explanation to docker network

In Docker, a network is a virtual network interface that allows containers to communicate with each other and with the host machine. Each network has a unique name and can be configured with various options, such as the IP range and DNS settings.

#### Docker provides several types of networks, including:

    - Bridge: the default network type, which allows containers to communicate with each other and with the host machine on the same network.
    - Host: uses the host machine's network interface, allowing the container to use the host's IP address and network settings.
    - None: no network interface is attached to the container.
    - Overlay: allows multiple Docker daemons to communicate, creating a single virtual network across hosts.

You can create, inspect, and remove networks using Docker commands such as `docker network create`, `docker network inspec`t, and `docker network rm`.
When you run a container, it can be connected to one or multiple networks, allowing it to communicate with other containers on the same network and access services on the host machine or other networks.

### how does cadvisor work

cAdvisor (short for Container Advisor) is an open-source tool for monitoring the performance of containers. It runs as a daemon on a host machine and collects metrics about the containers running on that host, such as CPU and memory usage, network I/O, and disk I/O. cAdvisor also provides information about the host machine itself, such as the overall CPU and memory usage.

cAdvisor uses the Docker API to discover and monitor containers on the host machine. It then gathers metrics by reading the container's cgroup information and by collecting statistics from the kernel. The gathered data is exposed through a RESTful API, which can be accessed by other tools or visualized through a web interface.

cAdvisor also provides a web-based user interface that allows you to view the metrics for all the containers running on the host machine, as well as the host machine itself. The data can be used to monitor the performance of the containers and help identify potential issues, such as resource contention or memory leaks.

Overall, cAdvisor is a valuable tool for monitoring and managing containerized applications, providing insight into the performance and resource usage of the containers and the host machine.

### what is mariadb and how it works

MariaDB is a fork of the MySQL database management system. It was created by the original developers of MySQL, after Oracle Corporation acquired MySQL in 2010. MariaDB is designed to be a drop-in replacement for MySQL, which means it is fully compatible with MySQL and can be used as a replacement without the need for any modification to the applications that use it.

MariaDB is a relational database management system (RDBMS) that uses SQL (Structured Query Language) for managing data. It stores data in tables, which are organized into databases. Each table is made up of rows and columns, and each column has a specific data type, such as text, integer, or date.

MariaDB supports various storage engines, including the InnoDB and MyISAM engines, which are used for different types of data and workloads. It also has support for data encryption, high availability, and scalability features.

MariaDB can be installed on a wide range of platforms, including Linux, Windows, and macOS. It can be run on a dedicated server, in the cloud, or as a container, and it can be accessed through various programming languages, such as C, C++, Python, and Java.

Overall, MariaDB is a powerful and reliable database management system that is widely used in web applications, e-commerce platforms, and other types of applications that require a robust and high-performance database.

### what is adminer and how it works

Adminer is a web-based database management tool that allows you to manage your databases using a web interface. It is similar to other tools like phpMyAdmin and MySQL Workbench, but it is lightweight and has a simpler user interface. Adminer supports a wide variety of database management systems, including MySQL, MariaDB, PostgreSQL, and SQLite. You can use Adminer to create and modify tables, insert and update data, and run SQL queries.

### what is ftp and how it works

FTP (File Transfer Protocol) is a standard network protocol used to transfer files between computers on a network. FTP is a client-server protocol, which means that a client application, such as a web browser or an FTP client software, is used to connect to an FTP server and transfer files. The client can connect to the server using a username and password, and can then upload, download, or delete files. FTP is commonly used to transfer files between a local computer and a web server, or to transfer large files between computers.

### what is redis and how it work

Redis is an in-memory data structure store that can be used as a database, cache, or message broker. It is an open-source, networked, in-memory, key-value data store that is often used for caching, real-time data streaming, and other performance-sensitive tasks. Redis supports a wide variety of data structures, such as strings, hashes, lists, sets, and sorted sets. It also supports advanced features like pub/sub messaging, Lua scripting, and replication. It is often used in web applications to speed up the performance by caching the data in the memory rather than fetching it from the database.

# Some useful resources :

- [What are SSL/TLS Certificates? Why do we Need them? and How do they Work?](https://youtu.be/r1nJT63BFQ0)
- [Understand what is docker ](https://youtu.be/pTFZFxd4hOI)
- [Understand what is docker compose](https://youtu.be/HG6yIjZapSA)
- [Understand what is nginx and why nginx](https://youtu.be/7VAI73roXaY)
- [Set up nginx with ssl](https://youtu.be/X3Pr5VATOyA)
- [How does HTTPS work? What's a CA? What's a self-signed Certificate?](https://youtu.be/T4Df5_cojAs)
