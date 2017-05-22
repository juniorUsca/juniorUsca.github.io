---
title: Generando un CSR Linux
layout: post
date: '2017-05-13 12:00:00'
banner_image: no_image
tags:
- linux
- openssl
- csr
- https
---

---
Generar un CSR (Certificate Signing Request) es necesario para poder firmar con https una web.

<!--<img style="width: 2050px;" src="https://blog.prima-posizione.it/wp-content/uploads/2016/07/https.png"/>-->

![https](https://blog.prima-posizione.it/wp-content/uploads/2016/07/https.png)

Para ello seguimos los siguientes pasos en el servidor que queremos firmar:

#### Instalando OpenSSL

En Ubuntu:
```
apt-get install openssl
```
o en Centos:
```
yum install openssl
```
Creamos la carpeta para almacenar las salidas:
```
mkdir ~/domain.com.ssl/
cd ~/domain.com.ssl/
```
#### Generando la RSA key
```
openssl genrsa -out ~/domain.com.ssl/domain.com.key 2048
```
#### Creando el CSR
```
openssl req -new -sha256 -key ~/domain.com.ssl/domain.com.key -out ~/domain.com.ssl/domain.com.csr
```

Pedira algunos datos que deberan ser los mismos que ocupaste en la entidad certificante de donde estes adquiriendo el SSL.

![csr](https://knowledge.rapidssl.com/library/VERISIGN/ALL_OTHER/jmagat/CSRinfo.PNG)

---
### Generando RSA y CSR para Subdominios y WWW
Esto funciona bien si queremos firmar solo un dominio, pero existen veces en que queremos firmar el dominio y los subdominios de la web, para ello usamos AlternativeNames(Nombres Alternativos), por ejemplo: incluir el dominio www y no-www en el mismo certificado.

Entonces al momento de adquirir el SSL especificamos el ***"Common Name"*** como:
```
*.domain.com
```
#### Generando el RSA y CSR con AlternativeNames

```
openssl req -new -sha256 -nodes -out \*.domain.com.csr -newkey rsa:2048 -keyout \*.domain.com.key -config <(
cat <<-EOF
[req]
default_bits = 2048
prompt = no
default_md = sha256
req_extensions = req_ext
distinguished_name = dn
 
[ dn ]
C=US
ST=New York
L=Rochester
O=Corporation Name
OU=Testing Domain
emailAddress=your-administrative-address@your-awesome-existing-domain.com
CN = www.domain.com
 
[ req_ext ]
subjectAltName = @alt_names
 
[ alt_names ]
DNS.1 = www.domain.com
DNS.2 = domain.com
DNS.3 = *.domain.com
DNS.4 = *.*.domain.com
DNS.5 = *.*.*.domain.com
EOF
)
```

De esta forma certificaras hasta 3 niveles de subdominios.

Se generaran 2 archivos, el .csr y el .key


### Referencias:

- [https://support.rackspace.com/how-to/generate-a-csr-with-openssl/](https://support.rackspace.com/how-to/generate-a-csr-with-openssl/)
- [http://blog.endpoint.com/2014/10/openssl-csr-with-alternative-names-one.html](http://blog.endpoint.com/2014/10/openssl-csr-with-alternative-names-one.html)
- [https://www.devside.net/wamp-server/generating-and-installing-wildcard-and-multi-domain-ssl-certificates](https://www.devside.net/wamp-server/generating-and-installing-wildcard-and-multi-domain-ssl-certificates)