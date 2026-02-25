# Basic

## Manual

- [Dokumentasi dari
  Overleaf](https://www.overleaf.com/learn/latex/Main_Page)
- [Dokumentasi dari namsu.de](https://www.namsu.de/)

## Softwares/Packages/Tools

- Tex distribution
  - [Miktex](https://miktex.org/)
  - [Tex live](https://tug.org/texlive/)
  - [Tex live vs
    Miktex](https://www.texdev.net/2016/12/18/tex-on-windows-tex-live-versus-miktex-revisited/)
- Editor
  - [Texstudio](https://www.texstudio.org/)
  - Vim
  - Emacs + evil
- [Bibtex](http://www.bibtex.org/)
- [Glossaries](https://ctan.mc1.root.project-creative.net/macros/latex/contrib/glossaries/glossaries-user.html)

## Command Line

### basic document

``` example
$ pdflatex filename
```

### include bibtex

``` example
$ pdflatex filename
$ bibtex filename 
$ pdflatex filename
$ pdflatex filename
```

Jika menggunakan biblatex, compile dengan:

``` example
$ biber filename
```

### include glossaries

``` example
$ pdflatex filename
$ makeglossaries filename
$ pdflatex filename
$ pdflatex filename
```

### interaction modes

Pdflatex memiliki 4 *interaction modes*. Mode tersebut adalah untuk
menampilkan proses compiling di terminal.

- batchmode: tidak ada yang ditampilkan

- nonstopmode: diagnostic message akan ditampilkan, tapi tidak ada
  interaksi dengan user seperti batchmode

- scrollmode: akan berhenti pada *missing files* atau jika keyboard
  input dibutuhkan

- errorstopmode: akan berhenti pada setiap error dan menunggu intervensi
  dari user

  Contoh penggunaan:

``` example
$ pdflatex -interaction=batchmode filename
```

**Referensi**

- [interaction
  modes](https://tex.stackexchange.com/questions/91592/where-to-find-official-and-extended-documentation-for-tex-latexs-commandlin)

# Snippets

## Basic Document Templates

### Basic document

``` example
   \documentclass{article}
   \begin{document}
     Hello World!
   \end{document}
```

### Basic document with bibtex

**Paket**

cite

**Contoh**

``` example
\documentclass[11pt]{article}
\usepackage{cite}

\begin{document}

\title{My Article}
\author{Nobody Jr.}
\date{Today}
\maketitle

Blablabla said Nobody ~\cite{Nobody06}.

\bibliography{mybib}{}
\bibliographystyle{plain}
\end{document}
```

### Basic document with glossaries

**Paket**

glossaries

**Contoh** :

``` example
\documentclass{article}  
\usepackage{glossaries}  
\makeglossaries  
\newglossaryentry{sample}{name={sample},description={an example}}  
\begin{document}  
\gls{sample}, \gls[format=textbf]{sample}.  
\printglossaries  
\end{document}
```

### SVG

Gunakan package svg agar bisa menggunakan svg file di latex.

``` example
   \usepackage{svg}
```

Package tersebut memerlukan Inkscape agar dapat berjalan. Selain itu
perlu menambahkan *command* `--shell-escape`. Contoh *command*-nya
adalah:

``` example
   $ pdflatex -aux-directory=build --shell-escape main.tex
```

Berikut ini contoh *syntax* untuk memasukkan gambar svg:

``` example
   \begin{figure}[!ht]
    \centering
    \includesvg{detail.svg}
   \end{figure}
```

## Equation

**Contoh**

``` example
\documentclass{article}

\begin{document}

\begin{equation}
   \label{eq:contoh}
   y=x^2
\end{equation}

Merujuk ke persamaan \ref{eq:contoh}. 

\end{document}
```

**Hasil compile**

![](equations/main.png)

## Table

**Paket**

- booktabs
- siunitx

**Contoh**

``` example
\documentclass{article}
\usepackage[utf8]{inputenc}
\usepackage{booktabs}
\usepackage{siunitx}

\begin{document}

\begin{table}[!h]
    \caption{Generator parameters}
    \label{tab:genparameters}
    \centering
    \begin{tabular}{ll}
        \toprule
        Parameters & Values \\
        \midrule
        Mechanical power $P_{\mathrm{M}}$ & \SI{3}{\mega\watt} \\
        Mechanical torque $T_{\mathrm{m}}$ & \SI{71.62}{\kilo\newton\meter} \\
        \bottomrule
    \end{tabular}
\end{table}

\end{document}
```

**Hasil compile**

![](tables/main.png)

Yohan Sidik

# Compiler

## Miktex

### Ubuntu

1.  User Guide

    <https://docs.miktex.org/manual/>

2.  Manual Install

    Cara *install* Miktex ada di [Website Miktex](https://miktex.org/).

    ``` example
       $ pdflatex --version
    ```

3.  Update Package

    Update package dapat dilakukan melalui Miktex Console atau command
    line.

    **Via Command Line**

    ``` example
       $ mpm --update 
    ```

4.  Install Package

    **Via Command Line**

    ``` example
       $ mpm --install=<package name>
    ```

    Package (user mode) disimpan di

    ``` example
       /home/user/.miktex/texmfs/tex/install
    ```

    **Referensi**

    - [Miktex packages](https://miktex.org/packages/)

5.  TEXMF root directories

    [Texmf root directories](https://miktex.org/kb/texmf-roots)

### Docker

Perlu diperhatikan di sini adalah folder yang bernama miktex. Folder
tersebut digunakan untuk menyimpan *user data*. Termasuk apabila ada
update dan upgrade packages.

Folder miktex ini bukanlah folder yang biasa. Tetapi berupa docker
volume. Dengan mendefinisikan folder volume, *user data* tersebut dapat
digunakan lagi apabila menjalankan miktex kembali. Prinsip dasarnya
adalah, *user data* akan hilang apabila re-run sebuah aplikasi. Tetapi
dengan volume tersebut, maka bisa digunakan kembali. Bahkan bisa
digunakan oleh container lainnya.

Cara membuat volume miktex adalah:

``` example
   $ docker volume create --name miktex
```

Untuk mengecek volume yang telah dibuat:

``` example
   $ docker volume ls
```

Untuk inspeksi volume miktex:

``` example
   $ docker volume inspect miktex
```

Untuk menjalankan miktex di dalam container:

``` example
   $ docker run -it -v miktex:/miktex/.miktex -v $(pwd):/miktex/work -e MIKTEX_GID=$(id -g) -e MIKTEX_UID=$(id -u) miktex/miktex /bin/bash
```

Di luar container:

``` example
   $ docker run -it -v miktex:/miktex/.miktex -v $(pwd):/miktex/work -e MIKTEX_GID=$(id -g) -e MIKTEX_UID=$(id -u) miktex/miktex pdflatex -aux-directory=build main.tex
```

**Tips**

Ketika pertama kali *compile* tex file, akan muncul *error*. Hal ini
dikarenakan miktex image merupakan minimal instalasi dan *packages*-nya
masih *missing*. Jalankanlah *command* berikut ini terlebih dahulu:

``` example
   $ mpm --update --upgrade
```

Kemudian jalankan lagi *command* untuk *compile*.

**Referensi**

- [Dockerized Miktex](https://github.com/MiKTeX/docker-miktex)
- [Docker docs: use volumes](https://docs.docker.com/storage/volumes/)

## Issue

### Key Expired

Error saat melakukan **sudo apt-get update** perihal *key expired*.

Key-nya expire dan harus diperbaharui. Biasanya ini akan menjadi issue
di repo miktex di github.com/miktex. Pantaulah repo miktex untuk
mendapatkan update key terbaru dari maintainer.

Contoh *command* untuk memperbaharui adalah:

``` example
     sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D6BC243565B2087BC3F897C9277A7293F59E4889
```
