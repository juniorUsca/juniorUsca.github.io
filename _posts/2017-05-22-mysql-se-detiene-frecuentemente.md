---
title: MySql se detiene frecuentemente
layout: post
banner_image: no_image
tags: mysql mariadb memory error
date: '2017-05-22 05:06:33'
image: https://juniorusca.github.io/2017/05/22/mysql-se-detiene-frecuentemente/mariadb-icon.png
---

---
Recientemente en una instancia en CentOS tube el problema que MariaDB se caia constantemente, y por lo tanto tenia que reiniciar el servicio constantemente.

Al parecer el problema era la memoria de la instancia, que era insuficiente para MariaDB, asi que se tubo que crear un espcio de intercambio (*swap*).

Esto fue lo que hice en la linea de comandos:

```
$ dd if=/dev/zero of=/swap.dat bs=1024 count=512k
$ mkswap /swap.dat
$ swapon /swap.dat
```

Editamos "/etc/fstab"
```
$ vim /etc/fstab
```
En el archivo agregamos lo siguiente:
```
/swap.dat      none    swap    sw      0       0
```

<br>

Editamos "/etc/mysql/my.cnf"
```
$ vim /etc/fstab
```
Bajo [mysqld] agregamos o modificamos si existe:
```
innodb_buffer_pool_size=64M
```

Finalmente reiniciamos el servicio:
```
$ service mysqld reload
```

### Referencias
- [https://www.digitalocean.com/community/questions/mysql-server-stops-very-frequently#comment_42488](https://www.digitalocean.com/community/questions/mysql-server-stops-very-frequently#comment_42488)