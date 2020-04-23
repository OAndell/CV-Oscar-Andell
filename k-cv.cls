\ProvidesClass{k-cv}[2015/11/29 CV class]
\NeedsTeXFormat{LaTeX2e}
\RequirePackage{longtable}
\RequirePackage{tabu}
\usepackage{comment}


\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

% to avoid warnings, copy only one symbol from stmaryrd
\DeclareSymbolFont{stmry}{U}{stmry}{m}{n}
\DeclareMathSymbol\rightarrowtriangle\mathrel{stmry}{"5F}
\renewcommand{\to}{$\rightarrowtriangle$}

%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{gray}{.2}
\definecolor{gray}{gray}{.35}
\definecolor{lightgray}{gray}{.35}

\definecolor{green}{HTML}{38590c}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{b81414}
\definecolor{blue}{HTML}{6CE0F1}

\ifdefined\@cv@print
  \colorlet{green}{green}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{red}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{green}
  \colorlet{header}{blue}
\else
  \colorlet{fillheader}{green}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{green}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage{microtype}
\RequirePackage[default]{lato}

\newcommand{\normalfont}{\fontseries{uc}\selectfont}
\newcommand{\bodyfont}{\fontseries{l}\selectfont}
\newcommand{\thinfont}{\fontseries{el}\selectfont}
\newcommand{\headingfont}{\fontseries{b}\selectfont}

\RequirePackage[none]{hyphenat} % No hyphenation

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{11pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}



\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth,
minimum height=3cm, yshift=0.5mm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{48pt}{72pt}\color{header}%
      {\thinfont #1}{\bodyfont  #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{18pt}{24pt}\color{header}%
      \thinfont #3%
    };
  \end{tikzpicture}
  \vspace{2.5cm}
  \vspace{-8\parskip}
}

\newcommand{\smallheader}[2]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth,
minimum height=2cm, yshift=0.5mm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{24pt}{36pt}\color{header}%
      {\thinfont #1}{\bodyfont  #2}
    };
  \end{tikzpicture}
  \vspace{0.5cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}



\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}%
  \Large\headingfont\color{headercolor} #2%
  \par\vspace{.25\parskip}%
}

\pagestyle{empty} % removes page number

%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%
\setlength{\tabcolsep}{3pt}
\newenvironment{entrylist}{%
   \begin{longtabu} to \textwidth {@{\extracolsep{\fill}}ll}
}{%
   \end{longtabu}
}
\renewcommand{\bfseries}{\headingfont\color{black}}
\newcommand{\entry}[4]{%
   \parbox[t]{2cm}{#1}&\parbox[t]{12.3cm}{%
     \textbf{\bodyfont #2}%
     \hfill%
     {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
     #4{\parsep}\newline%
   }\\}

%\setlength{\tabcolsep}{3pt}

%\newenvironment{entrylist}{%
%  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}l1 }
%}{
%  \end{tabular*}
%}

%\renewcommand{\bfseries}{\headingfont\color{black}}
%\newcommand{\entry}[4]{%
%  \parbox[t]{2cm}{#1}&\parbox[t]{12.3cm}{%
%    \textbf{\bodyfont #2}%
%    \hfill%
%    {\footnotesize\color{gray} \bodyfont #3}\\%
%    #4{\parsep}\newline%
%  }\\}


  

%%%%%%%%%%%%%%%%%%%%%%%
% Manual Bibliography %
%%%%%%%%%%%%%%%%%%%%%%%

% each item is a manual entry, since a bibfile is more pain than pleasure
% for most people's CVs.
\newcommand{\bibentry}[3]{%
  {\bfseries #1}\\%
  \hangindent=5mm \hangafter1%
  {\color{black} \bodyfont #2\\%
  {\footnotesize \bodyfont #3}}%
  }%

%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
  \begin{textblock}{4.6}(1, 1.33)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=6.1cm,top=2cm,right=1.5cm,bottom=2.5cm,nohead,nofoot]{geometry}
\RequirePackage[hidelinks]{hyperref}
\hypersetup{
    colorlinks=false}