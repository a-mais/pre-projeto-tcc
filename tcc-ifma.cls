%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Classe de documento LaTeX para TCCs do Instituto Federal do Maranhão – IFMA
% Campus São Luís Monte Castelo
% Curso: Bacharelado em Sistemas de Informação (BSI)
%
% Baseada no modelo tese-FT (UNICAMP) adaptado por
% Prof. André Leon Sampaio Gradvohl, Dr. (IFMA)
%
% Adaptação final para IFMA – BSI 2025 por ChatGPT (OpenAI)
% Conforme:
% - Resolução nº 088/2017 – IFMA Monte Castelo
% - NBR 14724:2024 (Trabalhos acadêmicos)
% - NBR 6028:2021 (Resumos)
% - NBR 10520:2023 (Citações)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tcc-ifma}[2025/01/15 Modelo de TCC para o IFMA]

\typeout{Classe tcc-ifma.cls – Modelo oficial adaptado para o IFMA Monte Castelo.}

% ---------------------------------------------------------------
% OPÇÕES DE IDIOMA E VERSÃO
% ---------------------------------------------------------------
\def\thesislanguage#1{\gdef\@thesislanguage{#1}}
\DeclareOption{Portugues}{\thesislanguage{2}\typeout{Idioma: Português.}}
\DeclareOption{Ingles}{\thesislanguage{0}\typeout{Idioma: Inglês.}}
\DeclareOption{Espanhol}{\thesislanguage{1}\typeout{Idioma: Espanhol.}}

\newif\iffinalversion
\DeclareOption{Final}{\finalversiontrue\typeout{Versão final.}}
\DeclareOption{Draft}{\finalversionfalse\typeout{Versão rascunho.}}

\newif\ifturnitin
\DeclareOption{Turnitin}{\turnitintrue\typeout{Versão Turnitin.}}

\ProcessOptions\relax

% ---------------------------------------------------------------
% CLASSE BASE E PACOTES
% ---------------------------------------------------------------
\iffinalversion
  \LoadClass[12pt,a4paper]{report}
\else
  \LoadClass[12pt,a4paper,draft]{report}
\fi

\RequirePackage[brazil,english,spanish]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{setspace}
\RequirePackage{geometry}
\geometry{a4paper,top=30mm,bottom=20mm,left=30mm,right=20mm}
\RequirePackage{times}
\RequirePackage{graphicx}
\graphicspath{{./figuras/}{./imagens/}{./logotipos/}}
\RequirePackage{fancyhdr}
\RequirePackage{hyperref}
\RequirePackage{nomencl} \makenomenclature
\RequirePackage{booktabs}
\RequirePackage{xspace}
\RequirePackage{csquotes}
\RequirePackage{ifthen}
\RequirePackage{titlesec}
\RequirePackage{etoolbox}
\RequirePackage[style=abnt,uniquename=init,giveninits,uniquelist=true,maxbibnames=4,repeatfields=true,justify]{biblatex}

% ---------------------------------------------------------------
% CONFIGURAÇÕES ABNT / IFMA
% ---------------------------------------------------------------
\setstretch{1.5}
\setlength{\parindent}{1.25cm}
\setlength{\parskip}{0pt}
\widowpenalty10000
\clubpenalty10000

% ---------------------------------------------------------------
% DADOS INSTITUCIONAIS
% ---------------------------------------------------------------
\newcommand{\@IFMA}{Instituto Federal do Maranhão – Campus São Luís Monte Castelo}
\newcommand{\@CURSO}{Bacharelado em Sistemas de Informação}
\newcommand{\@CURSOABREV}{BSI}
\newcommand{\@CIDADE}{São Luís – MA}

% ---------------------------------------------------------------
% VARIÁVEIS PRINCIPAIS
% ---------------------------------------------------------------
\let\@autor\relax
\def\autor#1{\gdef\@autor{#1}}
\author{\@autor}

\let\@autora\relax
\def\autora#1{\gdef\@autora{#1}}

\let\@titulo\relax
\def\titulo#1{\gdef\@titulo{#1}}
\title{\@titulo}

\let\@orientador\relax
\def\orientador#1{\gdef\@orientador{#1}}

\let\@orientadora\relax
\def\orientadora#1{\gdef\@orientadora{#1}}

\newcommand{\datadadefesa}[3]{\gdef\@dia{#1}\gdef\@mes{#2}\gdef\@ano{#3}}

% ---------------------------------------------------------------
% COMANDOS DE FORMATAÇÃO DE CAPA E FOLHA DE ROSTO
% ---------------------------------------------------------------
\def\logos{
  \begin{center}
    \includegraphics[width=3cm]{logotipos/ifma-logo.png}\\[0.5em]
    {\large \@IFMA \\[0.25em]
     \@CURSO}
  \end{center}
}

\def\openningpage{
  \logos
  \vskip 5cm
  \begin{center}
    \textbf{\Large \if\@autora\relax\@autor\else\@autora\fi}\\[4cm]
    \textbf{\MakeUppercase{\@titulo}}\\[6cm]
    \@CIDADE\\
    2025
  \end{center}
}

\def\titlepage{
  \vspace*{4cm}
  \begin{center}
    \textbf{\if\@autora\relax\@autor\else\@autora\fi}\\[3cm]
    \textbf{\MakeUppercase{\@titulo}}\\[3cm]
  \end{center}

  \noindent
  \begin{minipage}{0.6\textwidth}
  \justifying
  Projeto de Trabalho de Conclusão de Curso apresentado ao Curso de \@CURSO\ do \@IFMA, como requisito parcial para obtenção do grau de Bacharel em Sistemas de Informação.\\[1em]
  \if\@orientadora\relax
    Orientador: \@orientador
  \else
    Orientadora: \@orientadora
  \fi
  \end{minipage}

  \vfill
  \begin{center}
    \@CIDADE\\
    2025
  \end{center}
}

% ---------------------------------------------------------------
% ELEMENTOS PRÉ-TEXTUAIS PADRÃO
% ---------------------------------------------------------------
\newenvironment{resumo}
  {\newpage\section*{Resumo}\setstretch{1.0}\selectlanguage{brazil}\noindent}
  {\newpage\setstretch{1.5}}

\newenvironment{abstract}
  {\newpage\section*{Abstract}\setstretch{1.0}\selectlanguage{english}\noindent}
  {\newpage\setstretch{1.5}}

% ---------------------------------------------------------------
% PÁGINAS INICIAIS
% ---------------------------------------------------------------
\def\paginasiniciais{
  \thispagestyle{empty}
  \pagestyle{empty}
  \openningpage
  \clearpage
  \titlepage
  \clearpage
}

% ---------------------------------------------------------------
% FINAL DAS PÁGINAS INICIAIS
% ---------------------------------------------------------------
\newcommand{\fimdaspaginasiniciais}{
  \newpage
  \pagestyle{fancy}
  \fancyhf{}
  \fancyhead[L]{\nouppercase{\leftmark}}
  \fancyhead[R]{\thepage}
  \renewcommand{\headrulewidth}{0.5pt}
  \setstretch{1.5}
}

% ---------------------------------------------------------------
% DEDICATÓRIA E EPÍGRAFE
% ---------------------------------------------------------------
\newcommand{\dedicatoria}[1]{
  \newpage
  \vspace*{\fill}
  \begin{flushright}
    \begin{minipage}{15em}
      #1
    \end{minipage}
  \end{flushright}
  \vfill
}

\newcommand{\epigrafe}[2]{
  \newpage
  \vspace*{\fill}
  \begin{flushright}
    \textit{#2}\\[1em]
    — #1
  \end{flushright}
  \vfill
}

% ---------------------------------------------------------------
% OUTRAS CONFIGURAÇÕES
% ---------------------------------------------------------------
\newcommand{\fonte}[1]{\textbf{Fonte:} #1}
\newcommand{\Sigla}[2]{#1 (#2)\nomenclature{#2}{#1}}
\newcommand{\SiglaHifen}[2]{#1 -- #2\nomenclature{#2}{#1}}

\newcommand{\Capitulo}[1]{\Cref{#1}}
\newcommand{\Secao}[1]{\Cref{#1}}
\newcommand{\Figura}[1]{\Cref{#1}}
\newcommand{\Tabela}[1]{\Cref{#1}}
\newcommand{\Equacao}[1]{\Cref{#1}}

\endinput
