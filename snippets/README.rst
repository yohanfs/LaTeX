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

Table
---------------------------------------------------------------------------------

- `table <table.tex>`_

Makefile
---------------------------------------------------------------------------------

Standard Script
*********************************************************************************

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


Script dengan tambahan fitur untuk menyimpan auxiliary files di folder build
*********************************************************************************

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


Alternatif Penulisan Makefile Versi 1
*********************************************************************************

Pada contoh di atas, setiap line command ditulis dalam rule yang terpisah. Semua
line tersebut sebenarnya dapat ditulis dalam rule yang sama. Contohnya adalah:

::

        .PHONY: all

        all:
	        pdflatex -output-directory=build -interaction=batchmode main
	        biber --input-directory=build --output-directory=build main
	        makeglossaries -d build main
	        pdflatex -output-directory=build -interaction=batchmode main
	        pdflatex -output-directory=build -interaction=batchmode main

Alternatif Penulisan Makefile Versi 2
*********************************************************************************

Agar dapat digunakan secara general, maka nama file yang berulang diganti dengan
variabel untuk memudahkan dalam mengganti nama file tersebut. 

::

        .PHONY: update all

        auxFolder := build
        mode      := batchmode
        filename  := main

        update:
                @echo "simple update"
                @echo "-------------"
                pdflatex -output-directory=$(auxFolder) -interaction=$(mode) $(filename)

        all:
                @echo "run pdflatex (1)"
                @echo "----------------"
                pdflatex -output-directory=$(auxFolder) -interaction=$(mode) $(filename)
                @echo "run biber"
                @echo "---------"
                biber --input-directory=$(auxFolder) --output-directory=$(auxFolder) $(filename)
                @echo "run glossaries"
                @echo "--------------"
                makeglossaries -d $(auxFolder) $(filename)
                @echo "run pdflatex (2)"
                @echo "----------------"
                pdflatex -output-directory=$(auxFolder) -interaction=$(mode) $(filename)
                @echo "run pdflatex (3)"
                @echo "----------------"
                pdflatex -output-directory=$(auxFolder) -interaction=$(mode) $(filename)



**Referensi**

- `Hiding latex metafiles <https://texblog.org/2015/08/20/hiding-latex-metafiles-from-project-directory/>`_
