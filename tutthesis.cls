%%
%% This is file `tutthesis.cls',
%% This contains add-ons for report.cls file of the LaTeX base system.
%% Author: Sami Paavilainen (16 October 2006)
%% --------------------------------------------------------------
%% 
%% It may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%    http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2003/12/01 or later.
%% 

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{tutthesis}
              [2006/10/16 v0.1f
 Extension to LaTeX report document class]

\LoadClassWithOptions{report}

\if@twoside
  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\thepage\hfil\slshape\leftmark}%
      \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markboth {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
            \@chapapp\ \tutchapter. \ %
        \fi
        ##1}}{}}%
    \def\sectionmark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\z@
          \thesection. \ %
        \fi
        ##1}}}}
\else
  \def\ps@headings{%
    \let\@oddfoot\@empty
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
            \@chapapp\ \tutchapter \ %
        \fi
        ##1}}}}
\fi

\newcommand\chaptertocstyle{chapter}
\newcommand\chaptertocstr{\thechapter.}
\newcommand\tutchapter{\thechapter.}
\renewcommand\thechapter {\@arabic\c@chapter}
\renewcommand\thesection {\thechapter.\@arabic\c@section.}
\renewcommand\thesubsection   {\thesection\@arabic\c@subsection.}
\renewcommand\thesubsubsection{\thesubsection \@arabic\c@subsubsection.}
\renewcommand\theparagraph    {\thesubsubsection\@arabic\c@paragraph.}
\renewcommand\thesubparagraph {\theparagraph\@arabic\c@subparagraph.}

\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{\chaptertocstyle}%
                                   {\protect\numberline{\chaptertocstr}#1}%
                    \else
                      \addcontentsline{toc}{\chaptertocstyle}{\chaptertocstr}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                     \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}
\def\@makechapterhead#1{%
  \vspace*{\chapterheadbefore}%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
        \bf\textsf{\Large{\tutchapter}} % Chapter number
    \fi
    \hspace*{\chapterspace}
    \bf\Large \textsf{\MakeUppercase{%
      #1
    }}\par                         % chapter title
    \vspace{\chapterheadafter}%                % add vertical space
  }}
\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \@afterheading
                 \fi}
\def\@makeschapterhead#1{%
  \vspace*{-22pt}%
  {\parindent \z@ \raggedright 
    \bf\Large \textsf{\MakeUppercase{#1}}\par              % chapter title
    \vspace{12pt}%                                 % add vertical space
}}\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-1.8ex  \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex \@minus \parskip}%
                                   {\noindent \bf\large\textsf}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-1.8ex\@plus -1ex \@minus -.2ex}%
                                     {2.3ex \@plus .2ex \@minus \parskip}%
                                     {\noindent \bf\large\textsf}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\noindent \normalfont\normalsize\bfseries}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}

% \renewcommand\appendix{\par
%   \renewcommand\chaptertocstyle{appendix}
%   \renewcommand\chaptertocstr{\appendixname {\@arabic \c@chapter}:}
%   \renewcommand\tutchapter{\textsf{\MakeUppercase{\appendixname}}
%     {\@arabic \c@chapter}:}
%   \renewcommand\chapfigname{L{\@arabic\c@chapter}}
%   \renewcommand\chapterheadbefore{-22pt}
%   \renewcommand\chapterheadafter{10pt}
%   \setlength\chapterspace{0.0cm}
%   \setcounter{chapter}{0}%
%   \setcounter{section}{0}%
%   \gdef\@chapapp{\appendixname}%
% %  \gdef\thechapter{\textsf{\MakeUppercase{\appendixname}}
% %    {\@arabic \c@chapter}:}%
% }
% TUT specific:
\setlength\textwidth{15cm}  % tekstin leveys
\setlength\textheight{24cm} % tekstin korkeus
\setlength\headheight{15pt} % yl‰otsakkeen korkeus
\setlength\headsep{0.8cm}   % tila yl‰otsakkeen alla
\setlength\parindent{0.5cm} % vaihda 0:ksi tarvittaessa
\setlength\parskip{0pt}     % vaihta 12pt:hen tarvittaessa
\setlength\footskip{30pt}   % tila alaviitteen yll‰
\setlength\voffset{-1.3cm}  % ulommat marginaalit
\setlength\hoffset{0cm}     % ulommat marginaalit
\setlength\oddsidemargin{1.5cm} % sisemm‰t marginaalit parittomille sivuille
\setlength\evensidemargin{1.5cm} % sisemm‰t marginaalit parillisille sivuille
\setlength\topmargin{0.0cm} % sisemm‰t marginaalit
\setlength\brokenpenalty{1000} 
\renewcommand{\baselinestretch}{1.5}

\newlength\chapterspace
\setlength\chapterspace{0.4cm}
\newcommand\chapterheadbefore{26pt}
\newcommand\chapterheadafter{45pt}
\newcommand\chapfigname{\thechapter}

\renewcommand\theequation
  {\ifnum \c@chapter>\z@ \chapfigname.\fi \@arabic\c@equation}

\renewcommand \thefigure
     {\ifnum \c@chapter>\z@ \chapfigname.\fi \@arabic\c@figure}

\renewcommand \thetable
     {\ifnum \c@chapter>\z@ \chapfigname.\fi \@arabic\c@table}


\RequirePackage[T1]{fontenc} 
\RequirePackage[utf8]{inputenc}% skandinaaviset kirjasimet
\RequirePackage{graphicx}% grafiikkapaketti
\RequirePackage{psfrag}% mahdollistaa ps-tiedostojen muokkauksen j‰lkik‰teen
\RequirePackage{subfigure}% mahdollistaa pikkukuvat..
\RequirePackage{wrapfig}% pistaa tekstin kiertaan kuvan..
\RequirePackage{fancyhdr}% tyylikk‰‰mm‰t sivutukset...
\RequirePackage{supertabular}% ylisivun mittaiset taulukot..
\RequirePackage{rotating}% taulukoiden ja kuvien k‰‰ntely
\RequirePackage{amsmath}% matematiikkakirjasto
\RequirePackage{setspace}% riviv‰lin vaihtoon

\renewcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\MakeUppercase{\contentsname}
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }

%\newcommand*\l@appendix{\@dottedtocline{1}{0.0em}{3.8em}}
\renewcommand*\l@chapter{\@dottedtocline{1}{0.0	em}{1em}} % kommentoituna hyv‰
\renewcommand*\l@section{\@dottedtocline{1}{1.0em}{2.3em}}
\renewcommand*\l@subsection{\@dottedtocline{2}{2.0em}{3.2em}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{6.0em}{4.1em}}
\renewcommand*\l@paragraph{\@dottedtocline{4}{9em}{5em}}
\renewcommand*\l@subparagraph{\@dottedtocline{5}{11em}{6em}}

% asetetaan headerit ja footerit kuntoon
\pagestyle{fancyplain}
\rhead{\thepage}
\chead{}
\lhead{}
\lfoot{}
\cfoot{}
\rfoot{}
\renewcommand{\headrulewidth}{0pt} % Poistaa vaakaviivan

%%
%% End of file `tutthesis.cls'.
