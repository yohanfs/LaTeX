LaTeX
=================================================================================

.. contents:: **Daftar Isi**


Softwares/Packages/Tools
---------------------------------------------------------------------------------

- Tex distribution
   + `Miktex <https://miktex.org/>`_
   + `Tex live <https://tug.org/texlive/>`_
   + `Tex live vs Miktex`_
- Editor
   + `Texstudio <https://www.texstudio.org/>`_
- `Bibtex <http://www.bibtex.org/>`_
- `Glossaries <https://ctan.mc1.root.project-creative.net/macros/latex/contrib/glossaries/glossaries-user.html>`_

Command Line
---------------------------------------------------------------------------------

- basic document

::

      $ pdflatex filename

- include bibtex

::

      $ pdflatex filename
      $ bibtex filename
      $ pdflatex filename
      $ pdflatex filename

- include glossaries

::

      $ pdflatex filename
      $ makeglossaries filename
      $ pdflatex filename
      $ pdflatex filename

**Catatan**
      
Pdflatex memiliki 4 *interaction modes*. Mode tersebut adalah untuk menampilkan
proses compiling di terminal. 

- batchmode: tidak ada yang ditampilkan
- nonstopmode: diagnostic message akan ditampilkan, tapi tidak ada interaksi
  dengan user seperti batchmode
- scrollmode: akan berhenti pada *missing files* atau jika keyboard input
  dibutuhkan
- errorstopmode: akan berhenti pada setiap error dan menunggu intervensi dari
  user

Contoh penggunaan:

::

        $ pdflatex -interaction=batchmode filename

**Referensi**

- `interaction modes <https://tex.stackexchange.com/questions/91592/where-to-find-official-and-extended-documentation-for-tex-latexs-commandlin>`_


My Templates
---------------------------------------------------------------------------------

- `yohan_template_article.tex <templates_ysi/yohan_template_article.tex>`_
- `yohan_article.cls <templates_ysi/yohan_article.cls>`_

.. image:: images/templateLatexSederhana.PNG  

Snippets
---------------------------------------------------------------------------------

- `Snippets <snippets/README.rst>`_


.. _`Tex live vs Miktex`: https://www.texdev.net/2016/12/18/tex-on-windows-tex-live-versus-miktex-revisited/
