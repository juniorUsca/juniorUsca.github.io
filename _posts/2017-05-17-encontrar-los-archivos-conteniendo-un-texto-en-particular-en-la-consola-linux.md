---
title: Encontrar los Archivos Conteniendo un Texto en Particular en la Consola Linux
layout: post
date: '2017-05-17 12:00:00'
banner_image: no_image
---

---
Encontrar los archivos que contienen una cadena en especifico a través de la consola es necesario cuando nos conectamos por SSH a un servidor o instancia en la nube.

Tambien es una forma geek de hacerlo.

Usaremos el comando [grep](https://www.gnu.org/software/grep/manual/grep.html), que se encarga de hacer busquedas *match* en una entrada dada.

![grep](https://juniorusca.github.io/images/2017/05/17/encontrar-los-archivos-conteniendo-un-texto-en-particular-en-la-consola-linux/Screenshot%20from%202017-05-20%2002-38-46.png)

### Busqueda en Carpeta
```
$ grep --color "mi texto que busco" /home/debugcc/*
```

### Buscar 2 o Mas Palabras
```
$ grep --color -E "jekyll|serve" /home/debugcc/*
```

### Busqueda Exacta
```
$ grep --color -w "mi texto que busco" /home/debugcc/
```

### Busqueda Recursiva
```
$ grep --color -R "mi texto que busco" /home/debugcc/
```

### Busqueda por Tipo
```
$ grep --color "mi texto que busco" /home/debugcc/*.txt
```

### Mostrar solo el Nombre del Archivo
```
$ grep --color -l "mi texto que busco" /home/debugcc/*.txt
```

### Referencias

- [https://www.cyberciti.biz/faq/howto-search-find-file-for-text-string/](https://www.cyberciti.biz/faq/howto-search-find-file-for-text-string/)


Cualquier duda, en los comentarios. Saludos.