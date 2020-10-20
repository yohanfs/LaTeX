Snippets
=================================================================================

.. contents:: **Daftar Isi**

Basic Documents
---------------------------------------------------------------------------------

- `basic document <basicDoc.tex>`_
- `basic document with bibtex <basicDoc-bib.tex>`_
- `basic document with glossaries <basicDoc-gls.tex>`_


Figures
---------------------------------------------------------------------------------

- `one figure <onefigure.tex>`_
- `two figures <twofigures.tex>`_


Equation
---------------------------------------------------------------------------------

- `equation <equation.tex>`_

Makefile
---------------------------------------------------------------------------------

Makefile berikut dapat meng-compile tex file yang berisi bibtex dan glossaries. 

::

        .PHONY: all tex1 tex2 tex3 bib gls

        all: tex1 bib gls tex2 tex3

        tex1:
	        pdflatex main

        tex2:
	        pdflatex main

        tex3:
	        pdflatex main

        bib:
	        bibtex main
	
        gls:
	        makeglossaries main

