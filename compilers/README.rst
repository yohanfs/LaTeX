Latex Compiler
=================================================================================

.. contents:: **Daftar Isi**

Miktex
---------------------------------------------------------------------------------

Ubuntu
*********************************************************************************

Manual Install
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Cara *install* Miktex ada di `Website Miktex`_. 

*Update Packages* diinstall melalui Miktex Console dan disimpan di:

::

	/home/user/.miktex/texmfs/install

Cek Versi
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

::

	$ pdflatex --version

Install via Dokcer
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Perlu diperhatikan di sini adalah isi file dari ``.miktex``. 

Di dalam container:


::

	$ docker run -it -v $(pwd)/miktex:/miktex/.miktex -v $(pwd):/miktex/work -e MIKTEX_GID=$(id -g) -e MIKTEX_UID=$(id -u) miktex/miktex /bin/bash

Di luar container:

::

	$ docker run -it -v $(pwd)/miktex:/miktex/.miktex -v $(pwd):/miktex/work -e MIKTEX_GID=$(id -g) -e MIKTEX_UID=$(id -u) miktex/miktex pdflatex -aux-directory=build main.tex

Packages
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

*Pakcages* disimpan di:

::

	~/.miktex/texmfs/install/tex/latex

`Miktex packages`_


TEXMF root directories
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

`Texmf root directories`_

.. Referensi

.. _`Website Miktex`: https://miktex.org/
.. _`Miktex packages`: https://miktex.org/packages/
.. _`Texmf root directories`: https://miktex.org/kb/texmf-roots
