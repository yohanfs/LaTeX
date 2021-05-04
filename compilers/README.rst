Latex Compiler
=================================================================================

.. contents:: **Daftar Isi**

Miktex
---------------------------------------------------------------------------------

Ubuntu
*********************************************************************************

User Guide

https://docs.miktex.org/manual/

Manual Install
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Cara *install* Miktex ada di `Website Miktex`_. 

::

	$ pdflatex --version

Update Package
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Update package dapat dilakukan melalui Miktex Console atau command line.

**Via Command Line**

::

	$ mpm --update 

Install Package
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

**Via Command Line**

::

	$ mpm --install=<package name>


Package (user mode) disimpan di

::

	/home/user/.miktex/texmfs/tex/install


**Referensi**

- `Miktex packages`_


TEXMF root directories
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

`Texmf root directories`_

Docker
*********************************************************************************

Perlu diperhatikan di sini adalah folder yang bernama miktex. Folder tersebut
digunakan untuk menyimpan *user data*. Termasuk apabila ada update dan upgrade
packages. 

Folder miktex ini bukanlah folder yang biasa. Tetapi berupa docker volume.
Dengan mendefinisikan folder volume, *user data* tersebut dapat digunakan lagi
apabila menjalankan miktex kembali. Prinsip dasarnya adalah, *user data* akan
hilang apabila re-run sebuah aplikasi. Tetapi dengan volume tersebut, maka bisa
digunakan kembali. Bahkan bisa digunakan oleh container lainnya.

Cara membuat volume miktex adalah:

::

	$ docker volume create --name miktex

Untuk mengecek volume yang telah dibuat:

::

	$ docker volume ls

Untuk inspeksi volume miktex:

::

	$ docker volume inspect miktex

Untuk menjalankan miktex di dalam container:


::

	$ docker run -it -v miktex:/miktex/.miktex -v $(pwd):/miktex/work -e MIKTEX_GID=$(id -g) -e MIKTEX_UID=$(id -u) miktex/miktex /bin/bash

Di luar container:

::

	$ docker run -it -v miktex:/miktex/.miktex -v $(pwd):/miktex/work -e MIKTEX_GID=$(id -g) -e MIKTEX_UID=$(id -u) miktex/miktex pdflatex -aux-directory=build main.tex

**Tips**

Ketika pertama kali *compile* tex file, akan muncul *error*. Hal ini dikarenakan
miktex image merupakan minimal instalasi dan *packages*-nya masih *missing*.
Jalankanlah *command* berikut ini terlebih dahulu:

::

	$ mpm --update --upgrade

Kemudian jalankan lagi *command* untuk *compile*.

**Referensi**

- `Dockerized Miktex`_
- `Docker docs: use volumes`_

Issue
-------

- Key Expired

  Error saat melakukan **sudo apt-get update** perihal *key expired*.

  Key-nya expire dan harus diperbaharui. Biasanya ini akan menjadi issue di
  repo miktex di github.com/miktex. Pantaulah repo miktex untuk mendapatkan
  update key terbaru dari maintainer.

  Contoh *command* untuk memperbaharui adalah:

  ::
  
     sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D6BC243565B2087BC3F897C9277A7293F59E4889

.. Referensi

.. _`Website Miktex`: https://miktex.org/
.. _`Miktex packages`: https://miktex.org/packages/
.. _`Texmf root directories`: https://miktex.org/kb/texmf-roots
.. _`Dockerized Miktex`: https://github.com/MiKTeX/docker-miktex
.. _`Docker docs: use volumes`: https://docs.docker.com/storage/volumes/
