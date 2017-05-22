---
title: Arreglar "(13) Permission Denied" en Apache con PHP Linux
layout: post
date: '2017-05-10 12:00:00'
banner_image: no_image
tags:
- apache
- php
- permissions
---

---
En varias ocasiones al usar PHP, nuestro codigo lo copiamos de un proyecto anterior para ahorrar tiempo o no tomamos el debido cuidado respecto a los permisos de los archivos.

El problema ocurre cuando al intentar ingresar sale **error 500**, y no se muestra lo que deberia de salir.

Este es un problema de permisos, lo solucionamos dando los permisos adecuados a los archivos y directorios.

```
find /var/www -type d -exec chmod 755 {} \;
find /var/www -type f -exec chmod 644 {} \;
```



### Referencias
- [https://superuser.com/questions/882594/permission-denied-because-search-permissions-are-missing-on-a-component-of-the-p](https://superuser.com/questions/882594/permission-denied-because-search-permissions-are-missing-on-a-component-of-the-p)
- [https://wiki.apache.org/httpd/13PermissionDenied](https://wiki.apache.org/httpd/13PermissionDenied)