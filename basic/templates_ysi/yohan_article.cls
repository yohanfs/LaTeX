\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{yohan_article}[2017/12/29 My custom article class]

\RequirePackage[utf8]{inputenc}
\RequirePackage[english]{babel}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{graphicx}
\RequirePackage[left=3cm,right=3cm,top=3cm,bottom=3cm]{geometry}
\RequirePackage{titlesec}
\RequirePackage{indentfirst}
\RequirePackage{setspace}
\onehalfspacing
\titleformat*{\section}{\small\bfseries}
\titleformat*{\subsection}{\small\bfseries}
\titleformat*{\subsubsection}{\small\bfseries}
\titleformat*{\paragraph}{\small\bfseries}
\titleformat*{\subparagraph}{\small\bfseries}
\makeatletter
\renewcommand{\@seccntformat}[1]{\csname the#1\endcsname.\quad}
