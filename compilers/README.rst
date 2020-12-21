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

*Update Packages* diinstall melalui Miktex Console dan disimpan di:

::

	/home/user/.miktex/texmfs/install

**Cek Versi**

::

	$ pdflatex --version


Packages
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

*Pakcages* disimpan di:

::

	~/.miktex/texmfs/install/tex/latex

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

**Referens**

- `Dockerized Miktex`_
- `Docker docs: use volumes`_














.. Referensi

.. _`Website Miktex`: https://miktex.org/
.. _`Miktex packages`: https://miktex.org/packages/
.. _`Texmf root directories`: https://miktex.org/kb/texmf-roots
.. _`Dockerized Miktex`: https://github.com/MiKTeX/docker-miktex
.. _`Docker docs: use volumes`: https://docs.docker.com/storage/volumes/
