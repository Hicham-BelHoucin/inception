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

# Some useful resources :

+ [What are SSL/TLS Certificates? Why do we Need them? and How do they Work?](https://youtu.be/r1nJT63BFQ0)
+ [Understand what is docker ](https://youtu.be/pTFZFxd4hOI)
+ [Understand what is docker compose](https://youtu.be/HG6yIjZapSA)
+ [Understand what is nginx and why nginx](https://youtu.be/7VAI73roXaY)
+ [Set up nginx with ssl](https://youtu.be/X3Pr5VATOyA)
+ [How does HTTPS work? What's a CA? What's a self-signed Certificate?](https://youtu.be/T4Df5_cojAs)
