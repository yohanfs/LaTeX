Snippets
=================================================================================

.. contents:: **Daftar Isi**

Basic Documents
---------------------------------------------------------------------------------

- `basic document <basicDoc.tex>`_
- `basic document with bibtex <basicDoc-bib.tex>`_
- `basic document with glossaries <basicDoc-gls.tex>`_
- `basic document with bibtex and glossaries <basicDoc-bib-gls.tex>`_


Figures
---------------------------------------------------------------------------------

- `one figure <onefigure.tex>`_
- `two figures <twofigures.tex>`_


Equation
---------------------------------------------------------------------------------

- `equation <equation.tex>`_

Makefile
---------------------------------------------------------------------------------

**Standard Script**

Makefile berikut dapat meng-compile tex file yang berisi bibtex dan glossaries. 

::

        .PHONY: all build1 build2 build3 bib gls

        all: build1 bib gls build2 build3

        build1:
	        pdflatex main

        build2:
	        pdflatex main

        build3:
	        pdflatex main

        bib:
	        bibtex main
	
        gls:
	        makeglossaries main


**Script dengan tambahan fitur untuk menyimpan auxiliary files di folder build**

::

        .PHONY: all build1 build2 build3 bib gls

        all: build1 bib gls build2 build3

        build1:
	        pdflatex -output-directory=build -interaction=batchmode main

        build2:
	        pdflatex -output-directory=build -interaction=batchmode main

        build3:
	        pdflatex -output-directory=build -interaction=batchmode main

        bib:
	        biber --input-directory=build --output-directory=build main

        gls:
	        makeglossaries -d build main


**Generate pdf**

::

	make all

**Clean auxiliary files**

::

	make clean

**Referensi**

- `Hiding latex metafiles <https://texblog.org/2015/08/20/hiding-latex-metafiles-from-project-directory/>`_
