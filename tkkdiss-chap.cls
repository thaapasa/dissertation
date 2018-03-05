%%
%% This is file `tkkdiss-chap.cls',
%% modified from TKK library LaTeX file 'tkkdiss.cls' 
%% to support chapters (modifications based on 'book.cls')
%%
%%
%% Copyright (C) 2005 Helsinki University of Technology Library
%%
%%
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}

\NeedsTeXFormat{LaTeX2e}[2001/06/01]
\ProvidesClass{tkkdiss-chap}
  [2009/07/21 v1.1 chapter-based document class for TKK Dissertations]
\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagefalse
\newif\if@openright
\@openrightfalse
\newif\if@times
\newif\if@english
\newif\if@finnish
\newif\if@hyperref
\newif\if@appendixsettings
\@appendixsettingsfalse
\newif\if@abstractonly
\@abstractonlyfalse
\if@compatibility\else
\DeclareOption{a4paper}
    {\setlength\paperheight {297mm}%
     \setlength\paperwidth  {210mm}}
\DeclareOption{a5paper}
    {\setlength\paperheight {210mm}%
      \setlength\paperwidth  {148mm}}
\DeclareOption{b5paper}
    {\setlength\paperheight {250mm}%
     \setlength\paperwidth  {176mm}}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{legalpaper}
   {\setlength\paperheight {14in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{executivepaper}
   {\setlength\paperheight {10.5in}%
    \setlength\paperwidth  {7.25in}}
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
\fi
\if@compatibility
  \renewcommand\@ptsize{0}
\else
  \DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\fi
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\if@compatibility\else
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\fi
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\if@compatibility\else
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\fi
\DeclareOption{titlepage}{\@titlepagetrue}
\if@compatibility\else
\DeclareOption{notitlepage}{\@titlepagefalse}
\fi
\if@compatibility\else
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\fi
\if@compatibility\else
\DeclareOption{onecolumn}{\@twocolumnfalse}
\fi
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{times}{\@timestrue}
\DeclareOption{english}{\@englishtrue}
\DeclareOption{finnish}{\@finnishtrue}
\DeclareOption{abstract}{\@abstractonlytrue}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}
\ExecuteOptions{a4paper,12pt,twoside,final,notitlepage,openany,onecolumn}
\ProcessOptions\relax
\input{bk1\@ptsize.clo}
\RequirePackage{ae,aecompl}
\if@times
  \RequirePackage{times}
\fi


\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
%\renewcommand\baselinestretch{}
\renewcommand\baselinestretch{1.5} \normalfont
%\setlength\parskip{0\p@ \@plus \p@}
\setlength\parskip{1\baselineskip \@plus \p@ \@minus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}
\if@twoside
  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\thepage\hfil\slshape\leftmark}%
      \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markboth {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
            \@chapapp\ \thechapter. \ %
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
            \@chapapp\ \thechapter. \ %
        \fi
        ##1}}}}
\fi
\newcommand\ps@plaintop{%
  \renewcommand\@oddfoot{\@empty}
  \renewcommand\@evenfoot{\@oddfoot}
  \renewcommand\@oddhead{\hfil\normalfont\textrm{\thepage}\hfil}
  \renewcommand\@evenhead{\@oddhead}}
\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\slshape\leftmark}%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble
    \let\subsectionmark\@gobble
  }
  \if@titlepage
  \newcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  \vskip 60\p@
  \begin{center}%
    {\LARGE \@title \par}%
    \vskip 3em%
    {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
      \vskip 1.5em%
    {\large \@date \par}%       % Set date in \large size.
  \end{center}\par
  \@thanks
  \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\else
\newcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\LARGE \@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em%
    {\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em}
\fi
\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{3}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@arabic\c@chapter}
\renewcommand \thesection {\thechapter.\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\@chapapp{\chaptername}
\newcommand\part{%
%  \if@openright
    \cleardoublepage
%  \else
%    \clearpage
%  \fi
  \thispagestyle{plaintop}%
  \if@twocolumn
    \onecolumn
    \@tempswatrue
  \else
    \@tempswafalse
  \fi
  \null\vfil
  \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >\m@ne\relax
      \refstepcounter{part}%
      \typeout{\partname\space\thepart.}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >\m@ne\relax
       \huge\bfseries\sffamily \partname\nobreakspace\thepart
       \par
       \vskip 20\p@
     \fi
     \Huge \bfseries \sffamily #2\par}%
    \@endpart}
\def\@spart#1{%
     \hyperrefsection{part}
    {\centering
     \interlinepenalty \@M
     \normalfont
     \Huge \bfseries \sffamily #1\par}%
    \@endpart}
\def\@endpart{\vfil\newpage
              \if@twoside
               \if@openright
                \null
                \thispagestyle{empty}%
                \newpage
               \fi
              \fi
              \if@tempswa
                \twocolumn
              \fi}
\newcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plaintop}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}#1}%
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
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
  \vspace*{50\p@}%
  {\parindent \z@ \centering \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \sffamily \MakeUppercase{\@chapapp\space \thechapter}
      \par\nobreak
      \vskip 20\p@
    \fi
    \interlinepenalty\@M
    \LARGE\sffamily\bfseries #1\par\nobreak
    \vskip 40\p@
  }}
\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \@afterheading
                 \fi}
\def\@makeschapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \centering 
    \normalfont
    \interlinepenalty\@M
    \LARGE\sffamily\bfseries #1\par\nobreak
    \vskip 40\p@
  }}
\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\Large\sffamily}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\large\bfseries}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}
\if@twocolumn
  \setlength\leftmargini  {2em}
\else
%  \setlength\leftmargini  {2.5em}
  \setlength\leftmargini  {3em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\if@titlepage
  \newenvironment{abstract}{%
      \titlepage
      \null\vfil
      \@beginparpenalty\@lowpenalty
      \begin{center}%
        \bfseries \abstractname
        \@endparpenalty\@M
      \end{center}}%
      {\par\vfil\null\endtitlepage}
\else
  \newenvironment{abstract}{%
      \if@twocolumn
        \chapter*{\abstractname}%
      \else
        \small
        \begin{center}%
          {\bfseries \abstractname\vspace{-.5em}\vspace{\z@}}%
        \end{center}%
        \quotation
      \fi}
    {\if@twocolumn\else\endquotation\fi\clearpage}
\fi
\newcommand{\manuscriptdate}[1]{\renewcommand\@manuscriptdate{#1}}
\newcommand{\manuscriptreviseddate}[1]{\renewcommand\@manuscriptreviseddate{#1}}
\newcommand{\defencedate}[1]{\renewcommand\@defencedate{#1}}
\newcommand{\monograph}[1]{\renewcommand\@monograph{#1}}
\newcommand{\articledissertation}[1]{\renewcommand\@articledissertation{#1}}
\newcommand{\faculty}[1]{\renewcommand\@faculty{#1}}
\newcommand{\department}[1]{\renewcommand\@department{#1}}
\newcommand{\fieldofresearch}[1]{\renewcommand\@fieldofresearch{#1}}
\newcommand{\opponents}[1]{\renewcommand\@opponents{#1}}
\newcommand{\supervisor}[1]{\renewcommand\@supervisor{#1}}
\newcommand{\instructor}[1]{\renewcommand\@instructor{#1}}
\newcommand{\keywords}[1]{\renewcommand\@keywords{#1}}
\newcommand{\numberofpages}[1]{\renewcommand\@numberofpages{#1}}
\newcommand{\isbnprint}[1]{\renewcommand\@isbnprint{#1}}
\newcommand{\isbnpdf}[1]{\renewcommand\@isbnpdf{#1}}
\newcommand{\isbnothers}[1]{\renewcommand\@isbnothers{#1}}
\newcommand{\issnprint}[1]{\renewcommand\@issnprint{#1}}
\newcommand{\issnpdf}[1]{\renewcommand\@issnpdf{#1}}
\newcommand{\xlanguage}[1]{\renewcommand\@xlanguage{#1}}
\newcommand{\publisher}[1]{\renewcommand\@publisher{#1}}
\newcommand{\distribution}[1]{\renewcommand\@distribution{#1}}
\newcommand{\onlineversion}[1]{\renewcommand\@onlineversion{#1}}
\newcommand{\onlineaddress}[1]{\renewcommand\@onlineaddress{#1}}
\renewcommand\@author{}
\renewcommand\@title{}
\newcommand\@manuscriptdate{}
\newcommand\@manuscriptreviseddate{}
\newcommand\@defencedate{}
\newcommand\@monograph{}
\newcommand\@articledissertation{}
\newcommand\@faculty{}
\newcommand\@department{}
\newcommand\@fieldofresearch{}
\newcommand\@opponents{}
\newcommand\@supervisor{}
\newcommand\@instructor{}
\newcommand\@keywords{}
\newcommand\@numberofpages{}
\newcommand\@isbnprint{}
\newcommand\@isbnpdf{}
\newcommand\@isbnothers{}
\newcommand\@issnprint{}
\newcommand\@issnpdf{}
\newcommand\@xlanguage{}
\newcommand\@publisher{}
\newcommand\@distribution{}
\newcommand\@onlineversion{}
\newcommand\@onlineaddress{http://lib.tkk.fi/Diss/}
\newsavebox{\@abstract}
\newcommand{\abstractsettings}{%
  \setlength\paperwidth{210mm}
  \setlength\paperheight{297mm}
  \setlength\textwidth{\paperwidth}
  \if@compatibility\else
    \@settopoint\textwidth
  \fi
  \setlength\textheight{\paperheight}
  \setlength\oddsidemargin{0\p@}
  \setlength\evensidemargin{0\p@}
  \setlength\marginparwidth{0\p@}
  \setlength\topmargin{0\p@}
  \if@compatibility\else
    \@settopoint\oddsidemargin
    \@settopoint\evensidemargin
    \@settopoint\marginparwidth
    \@settopoint\topmargin
  \fi
  \setlength\headheight{0\p@}
  \setlength\headsep{0\p@}
  \setlength\footskip{0\p@}
}
\def\abstractlanguage#1#2\\#3#4\\{%
  \if #1#3\if #1\ 1 \else \abstractlanguage #2\\#4\\ \fi
  \else 0 \fi}
\renewenvironment{abstract}[1]{%       
\newcommand\authorname{Author}
\newcommand\titlename{Name of the dissertation}
\newcommand\manuscriptdatename{Manuscript submitted}
\newcommand\manuscriptreviseddatename{Manuscript revised}
\newcommand\defencedatename{Date of the defence}
\newcommand\monographname{Monograph}
\newcommand\articledissertationname{Article dissertation (summary + original articles)}
\newcommand\facultyname{Faculty}
\newcommand\departmentname{Department}
\newcommand\fieldofresearchname{Field of research}
\newcommand\opponentsname{Opponent(s)}
\newcommand\supervisorname{Supervisor}
\newcommand\instructorname{Instructor}
\renewcommand\abstractname{Abstract}
\newcommand\keywordsname{Keywords}
\newcommand\numberofpagesname{Number of pages}
\newcommand\isbnprintname{ISBN (printed)}
\newcommand\isbnpdfname{ISBN (pdf)}
\newcommand\isbnothersname{ISBN (others)}
\newcommand\issnprintname{ISSN (printed)}
\newcommand\issnpdfname{ISSN (pdf)}
\newcommand\xlanguagename{Language}
\newcommand\publishername{Publisher}
\newcommand\distributionname{Print distribution}
\newcommand\onlineversionname{The dissertation can be read at}
\newcommand\onlineaddressname{}
\ifnum\abstractlanguage #1\ \\finnish\ \\ >0
  \renewcommand\authorname{Tekij\"a}
  \renewcommand\titlename{V\"ait\"oskirjan nimi}
  \renewcommand\manuscriptdatename{K\"asikirjoituksen p\"aiv\"am\"a\"ar\"a}
  \renewcommand\manuscriptreviseddatename{Korjatun k\"asikirjoituksen p\"aiv\"am\"a\"ar\"a}
  \renewcommand\defencedatename{V\"ait\"ostilaisuuden ajankohta}
  \renewcommand\monographname{Monografia}
  \renewcommand\articledissertationname{Yhdistelm\"av\"ait\"oskirja (yhteenveto + erillisartikkelit)}
  \renewcommand\facultyname{Tiedekunta}
  \renewcommand\departmentname{Laitos}
  \renewcommand\fieldofresearchname{Tutkimusala}
  \renewcommand\opponentsname{Vastav\"aitt\"aj\"a(t)}
  \renewcommand\supervisorname{Ty\"on valvoja}
  \renewcommand\instructorname{Ty\"on ohjaaja}
  \renewcommand\abstractname{Tiivistelm\"a}
  \renewcommand\keywordsname{Asiasanat}
  \renewcommand\numberofpagesname{Sivum\"a\"ar\"a}
  \renewcommand\isbnprintname{ISBN (painettu)}
  \renewcommand\isbnpdfname{ISBN (pdf)}
  \renewcommand\isbnothersname{ISBN (muut)}
  \renewcommand\issnprintname{ISSN (painettu)}
  \renewcommand\issnpdfname{ISSN (pdf)}
  \renewcommand\xlanguagename{Kieli}
  \renewcommand\publishername{Julkaisija}
  \renewcommand\distributionname{Painetun v\"ait\"oskirjan jakelu}
  \renewcommand\onlineversionname{Luettavissa verkossa osoitteessa}
  \renewcommand\onlineaddressname{}
\else
\ifnum\abstractlanguage #1\ \\swedish\ \\ >0
  \renewcommand\authorname{F\"orfattare}
  \renewcommand\titlename{Titel}
  \renewcommand\manuscriptdatename{Inl\"amningsdatum f\"or manuskript}
  \renewcommand\manuscriptreviseddatename{Datum f\"or det korrigerade manuskriptet}
  \renewcommand\defencedatename{Datum f\"or disputation}
  \renewcommand\monographname{Monografi}
  \renewcommand\articledissertationname{Sammanl\"aggningsavhandling (sammandrag + separata publikationer)}
  \renewcommand\facultyname{Fakultet}
  \renewcommand\departmentname{Institution}
  \renewcommand\fieldofresearchname{Forskningsomr\aa de}
  \renewcommand\opponentsname{Opponent(er)}
  \renewcommand\supervisorname{\"Overvakare}
  \renewcommand\instructorname{Handledare}
  \renewcommand\abstractname{Sammanfattning (Abstrakt)}
  \renewcommand\keywordsname{\"Amnesord (Nyckelord)}
  \renewcommand\numberofpagesname{Sidantal}
  \renewcommand\isbnprintname{ISBN (tryckt)}
  \renewcommand\isbnpdfname{ISBN (pdf)}
  \renewcommand\isbnothersname{ISBN (\"ovriga)}
  \renewcommand\issnprintname{ISSN (tryckt)}
  \renewcommand\issnpdfname{ISSN (pdf)}
  \renewcommand\xlanguagename{Spr\aa k}
  \renewcommand\publishername{Utgivare}
  \renewcommand\distributionname{Distribution av tryckt avhandling}
  \renewcommand\onlineversionname{Avhandlingen \"ar tillg\"anglig p\aa\ n\"atet}
  \renewcommand\onlineaddressname{}
\fi\fi
\if@twocolumn\@restonecoltrue \else\@restonecolfalse \fi
\twocolumn
\cleardoublepage
\setlength\parindent{0\p@}
\renewcommand{\rmdefault}{ptm}
\renewcommand{\sfdefault}{phv}
\renewcommand{\ttdefault}{pcr}
\renewcommand{\familydefault}{\sfdefault}
\fontsize{10pt}{11pt}\selectfont
\renewcommand\baselinestretch{1} \normalfont
\thispagestyle{empty}
\pagestyle{empty}
\setlength\unitlength{1\p@}
\begingroup
\abstractsettings
\onecolumn
\clearpage
\begin{picture}(597,845)(21,-95)
\linethickness{1pt}
\ifnum\abstractlanguage #1\ \\finnish\ \\ >0
  \put(387,667){\includegraphics{Aalto_FI_21_BLACK_1}}
  \put(6,670){\fontsize{10pt}{10pt}\selectfont V\"AIT\"OSKIRJAN TIIVISTELM\"A}
  \put(254,670){\parbox[t]{\textwidth}{%
    \makebox[236pt][s]{{\fontsize{10pt}{10pt}\selectfont AALTO-YLIOPISTO \hfill}} \\[1pt]
TEKNILLINEN KORKEAKOULU \\[1pt]
PL 11000, 00076 AALTO \\[1pt]
http://www.aalto.fi
  }}
\else \ifnum\abstractlanguage #1\ \\swedish\ \\ >0
  \put(367,667){\includegraphics{Aalto_SE_21_BLACK_1}}
  \put(6,670){\parbox[t]{234pt}{%
    \fontsize{10pt}{10pt}\selectfont SAMMANFATTNING (ABSTRAKT) \\[1pt]
    AV DOKTORSAVHANDLING}}
  \put(254,670){\parbox[t]{\textwidth}{%
    \makebox[236pt][s]{{\fontsize{10pt}{10pt}\selectfont AALTO-UNIVERSITETET \hfill}} \\[1pt]
TEKNISKA H\"OGSKOLAN \\[1pt]
PB 11000, FI-00076 AALTO \\[1pt]
http://www.aalto.fi
  }}
\else
  \put(382,667){\includegraphics{Aalto_EN_21_BLACK_1}}
  \put(6,670){\fontsize{10pt}{10pt}\selectfont ABSTRACT OF DOCTORAL DISSERTATION}
  \put(254,670){\parbox[t]{\textwidth}{%
    \makebox[236pt][s]{{\fontsize{10pt}{10pt}\selectfont AALTO UNIVERSITY \hfill}} \\[1pt]
    SCHOOL OF SCIENCE AND TECHNOLOGY \\[1pt]
    P.O. BOX 11000, FI-00076 AALTO \\[1pt]
    http://www.aalto.fi
  }}
\fi\fi
\put(0,0){\framebox(496,683){}}
\put(248,629){\line(0,1){54}}
\put(248,541){\line(0,1){17}}
\ifnum\abstractlanguage #1\ \\swedish\ \\ >0
  \put(124,507){\line(0,1){17}}
\else
  \put(248,507){\line(0,1){17}}
\fi
\put(248,51){\line(0,1){51}}
\newcommand{\horizontalline}[2]{\put(##1,##2){\line(1,0){496}}}
\horizontalline{0}{629}
\horizontalline{0}{612}
\horizontalline{0}{558}
\horizontalline{0}{541}
\horizontalline{0}{524}
\horizontalline{0}{507}
\horizontalline{0}{415}
\horizontalline{0}{119}
\horizontalline{0}{102}
\horizontalline{0}{85}
\horizontalline{0}{68}
\horizontalline{0}{51}
\horizontalline{0}{34}
\horizontalline{0}{17}
\ifnum\abstractlanguage #1\ \\finnish\ \\ >0
\newcommand{\abstractinfol}[1]{\parbox{15em}{##1}}
\newcommand{\abstractinfor}[1]{\parbox{17.5em}{##1}}
\else
\newcommand{\abstractinfol}[1]{\parbox{12em}{##1}}
\newcommand{\abstractinfor}[1]{\parbox{11em}{##1}}
\fi
\newcommand{\abstractfield}[5]{\put(##1,##2){\makebox(0,0)[tl]{\rule{0pt}{8pt}##3 ##4 ##5}}}
\abstractfield{6}{624}{\authorname}{\hspace{2em}}{\@author}
\abstractfield{6}{607}{\titlename}{}{}
\abstractfield{6}{553}{\abstractinfol{\manuscriptdatename}}{}{\@manuscriptdate}
\ifnum\abstractlanguage #1\ \\swedish\ \\ >0
  \abstractfield{6}{536}{\abstractinfor{\manuscriptreviseddatename}}{}{\@manuscriptreviseddate}
  \abstractfield{254}{553}{\abstractinfol{\defencedatename}}{}{\@defencedate}
  \abstractfield{130}{520}{\framebox(10,10){} \ \articledissertationname}{}{}
\else
  \abstractfield{254}{553}{\abstractinfor{\manuscriptreviseddatename}}{}{\@manuscriptreviseddate}
  \abstractfield{6}{536}{\abstractinfol{\defencedatename}}{}{\@defencedate}
  \abstractfield{254}{520}{\framebox(10,10){} \ \articledissertationname}{}{}
\fi
\abstractfield{6}{520}{\framebox(10,10){} \ \monographname}{}{}
\renewcommand{\abstractinfol}[1]{\parbox{10em}{##1}}
\renewcommand{\abstractinfor}[1]{\parbox{10em}{##1}}
\abstractfield{6}{502}{\abstractinfol{\facultyname}}{}{\@faculty}
\abstractfield{6}{487}{\abstractinfol{\departmentname}}{}{\@department}
\abstractfield{6}{472}{\abstractinfol{\fieldofresearchname}}{}{\@fieldofresearch}
\abstractfield{6}{457}{\abstractinfol{\opponentsname}}{}{\@opponents}
\abstractfield{6}{442}{\abstractinfol{\supervisorname}}{}{\@supervisor}
\abstractfield{6}{427}{\abstractinfol{\instructorname}}{}{\@instructor}
\abstractfield{6}{410}{\abstractname}{}{}
\ifnum\abstractlanguage #1\ \\finnish\ \\ >0
\renewcommand{\abstractinfol}[1]{\parbox{13.5em}{##1}}
\renewcommand{\abstractinfor}[1]{\parbox{13.5em}{##1}}
\else
\renewcommand{\abstractinfol}[1]{\parbox{10em}{##1}}
\renewcommand{\abstractinfor}[1]{\parbox{10em}{##1}}
\fi
\abstractfield{6}{114}{\keywordsname}{\hspace{1.5em}}{\@keywords}
\abstractfield{6}{97}{\abstractinfol{\isbnprintname}}{}{\@isbnprint}
\abstractfield{6}{80}{\abstractinfol{\isbnpdfname}}{}{\@isbnpdf}
\abstractfield{6}{63}{\abstractinfol{\xlanguagename}}{}{\@xlanguage}
\abstractfield{254}{97}{\abstractinfor{\issnprintname}}{}{\@issnprint}
\abstractfield{254}{80}{\abstractinfor{\issnpdfname}}{}{\@issnpdf}
\abstractfield{254}{63}{\abstractinfor{\numberofpagesname}}{}{\@numberofpages}
\abstractfield{6}{46}{\abstractinfol{\publishername}}{}{\@publisher}
\abstractfield{6}{29}{\abstractinfol{\distributionname}}{}{\@distribution}
\abstractfield{6}{13}{\framebox(10,10){} \ \onlineversionname\ \@onlineaddress}{}{}
\abstractfield{6}{593}{\begin{minipage}[t]{476pt}
\raggedright \@title
\end{minipage}}{}{}
\abstractfield{7}{519}{\@monograph}{}{}
\ifnum\abstractlanguage #1\ \\swedish\ \\ >0
  \abstractfield{131}{519}{\@articledissertation}{}{}
\else
  \abstractfield{255}{519}{\@articledissertation}{}{}
\fi
%\abstractfield{97}{502}{\@faculty}{}{}
%\abstractfield{97}{487}{\@department}{}{}
%\abstractfield{97}{472}{\@fieldofresearch}{}{}
%\abstractfield{97}{457}{\@opponents}{}{}
%\abstractfield{97}{442}{\@supervisor}{}{}
%\abstractfield{97}{427}{\@instructor}{}{}
\abstractfield{7}{12}{\@onlineversion}{}{}
\begin{lrbox}{\@abstract}
  \begin{minipage}[t]{484pt}
    \setlength\parskip{0.5\baselineskip}
    \setlength\parindent{0pt}
%    \raggedright
}{
  \end{minipage}
\end{lrbox}
\put(6, 388){\mbox{\usebox{\@abstract}}}
\end{picture}
\clearpage
\endgroup
\if@restonecol\twocolumn \else\onecolumn \fi
\if@abstractonly \else
  \cleardoublepage
\fi}

\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}
\if@compatibility
\newenvironment{titlepage}
    {%
      \cleardoublepage
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\z@
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
    }
\else
\newenvironment{titlepage}
    {%
      \cleardoublepage
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\@ne
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
     \if@twoside\else
        \setcounter{page}\@ne
     \fi
    }
\fi
\newcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\@addtoreset {equation}{chapter}
\renewcommand\theequation
  {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}
\newcounter{figure}[chapter]
\renewcommand \thefigure
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\def\fps@figure{htbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}[chapter]
\renewcommand \thetable
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
\def\fps@table{htbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
%\setlength\abovecaptionskip{10\p@}
\setlength\abovecaptionskip{\baselineskip}
%\setlength\belowcaptionskip{0\p@}
\setlength\belowcaptionskip{\baselineskip}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \renewcommand\baselinestretch{1} \normalfont
  \sbox\@tempboxa{\textbf{#1}: #2}%
  \ifdim \wd\@tempboxa >\hsize
    \textbf{#1}: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
%\newcommand\@pnumwidth{1.55em}
\newcommand\@pnumwidth{2em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{3}
\newcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \cleardoublepage
    \chapter*{\contentsname
      \@mkboth{\MakeUppercase\contentsname}%
              {\MakeUppercase\contentsname}}%
    \renewcommand\@currentlabel{\contentsname}
    \label{chapter:contents}
    \addcontentsline{toc}{chapter}{\contentsname}
   {\setlength\parskip{0\p@ \@plus \p@}
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    \cleardoublepage}
}
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >\m@ne\relax
    \addpenalty\@secpenalty%
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
\newcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\newlength{\tocsecnumwidth}
\setlength\tocsecnumwidth{1.5em}
\newcommand*\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand*\l@subsection{\@dottedtocline{2}{1.5em}{2.3em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{3.8em}{3.2em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{7.0em}{4.1em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{10em}{5em}}
\newcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \cleardoublepage
    \chapter*{\listfigurename}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    \renewcommand\@currentlabel{\listfigurename}
    \label{chapter:listoffigures}
%    \addcontentsline{toc}{chapter}{\listfigurename}
   {\setlength\parskip{0\p@ \@plus \p@}
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    \cleardoublepage}
}
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \cleardoublepage
    \chapter*{\listtablename}%
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
    \renewcommand\@currentlabel{\listtablename}
    \label{chapter:listoftables}
    \addcontentsline{toc}{chapter}{\listtablename}
   {\setlength\parskip{0\p@ \@plus \p@}
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    \cleardoublepage}
}
\newcommand*\l@table{\l@figure}
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {\chapter*{\bibname}%
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \label{chapter:bibliography}
      \renewcommand\@currentlabel{\bibname}
      \addcontentsline{toc}{chapter}{\bibname}
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \cleardoublepage
                \columnseprule \z@
                \columnsep 35\p@
                \twocolumn[\@makeschapterhead{\indexname}]%
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{plaintop}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\newenvironment{preface}{
  \cleardoublepage
  \chapter*{\prefacename}%
    \@mkboth{\MakeUppercase\prefacename}%
            {\MakeUppercase\prefacename}%
  \renewcommand\@currentlabel{\prefacename}
  \label{chapter:preface}
%  \addcontentsline{toc}{chapter}{\prefacename}
}{\cleardoublepage}
\newcounter{numberofpublications}
\newcounter{articlenumber}
\renewcommand\thearticlenumber{\articlelabel{articlenumber}}
\newcommand\articlelabel[1]{\Roman{#1}}
\newenvironment{listofpublications}{
  \newenvironment{publications}{%
    \begin{enumerate}
      \renewcommand\theenumi{\@Roman\c@enumi}
      \renewcommand\labelenumi{\textbf{\articlelabel{enumi}}}
      \leftskip 1em
      \setlength\labelsep{1.5em}}%
    {\setcounter{numberofpublications}{\arabic{enumi}} \end{enumerate}}
  \if@twocolumn
    \@restonecoltrue\onecolumn
  \else
    \@restonecolfalse
  \fi
  \cleardoublepage
  \chapter*{\listofpublicationsname}%
    \@mkboth{\MakeUppercase\listofpublicationsname}%
            {\MakeUppercase\listofpublicationsname}%
  \renewcommand\@currentlabel{\listofpublicationsname}
  \label{chapter:listofpublications}
  \addcontentsline{toc}{chapter}{\listofpublicationsname}}%
  {\if@restonecol\twocolumn\fi \cleardoublepage}
\newenvironment{authorscontribution}{
  \cleardoublepage
  \chapter*{\authorscontributionname}%
    \@mkboth{\MakeUppercase\authorscontributionname}%
            {\MakeUppercase\authorscontributionname}%
  \renewcommand\@currentlabel{\authorscontributionname}
  \label{chapter:authorscontribution}
  \addcontentsline{toc}{chapter}{\authorscontributionname}}{\cleardoublepage}
\newenvironment{listofabbreviations}{
  \cleardoublepage
  \chapter*{\listofabbreviationsname}%
    \@mkboth{\MakeUppercase\listofabbreviationsname}%
            {\MakeUppercase\listofabbreviationsname}%
  \renewcommand\@currentlabel{\listofabbreviationsname}
  \label{chapter:listofabbreviations}
%  \addcontentsline{toc}{chapter}{\listofabbreviationsname}
}{\cleardoublepage}
\newenvironment{listofsymbols}{
  \cleardoublepage
  \chapter*{\listofsymbolsname}%
    \@mkboth{\MakeUppercase\listofsymbolsname}%
            {\MakeUppercase\listofsymbolsname}%
  \renewcommand\@currentlabel{\listofsymbolsname}
  \label{chapter:listofsymbols}
%  \addcontentsline{toc}{chapter}{\listofsymbolsname}
}{\cleardoublepage}
\newenvironment{errata}{
  \if@twocolumn
    \@restonecoltrue\onecolumn
  \else
    \@restonecolfalse
  \fi
  \cleardoublepage
  \chapter*{\errataname}%
    \@mkboth{\MakeUppercase\errataname}%
            {\MakeUppercase\errataname}%
  \renewcommand\@currentlabel{\errataname}
  \label{chapter:errata}
  \addcontentsline{toc}{chapter}{\errataname}
  \if@appendixsettings
    \renewcommand\thepage{\errataname--\arabic{page}}
  \fi}%
  {\if@restonecol\twocolumn\fi \cleardoublepage}
\newcommand\articlecovers{
  \if@twocolumn
    \@restonecoltrue\onecolumn
  \else
    \@restonecolfalse
  \fi
  \cleardoublepage
  \chapter*{}
  \if@appendixsettings
    \renewcommand\thepage{--\arabic{page}--}
  \fi
  \setlength\fboxsep{10mm}
  \setlength\fboxrule{5mm}
  \setlength\parindent{0pt}
  \setlength\parskip{0pt}
  \renewcommand\baselinestretch{1} \normalfont\normalsize
  \makearticlecovers
  \if@restonecol\twocolumn\fi
  \cleardoublepage}
\newlength{\articlenumwidth}
\setlength\articlenumwidth{30mm}
\newcommand\articlenumberformat[2][]{\framebox[#1][c]{\fontsize{60pt}{60pt}\selectfont \bfseries #2}}
\newcommand\articlereferenceformat[1]{
  {\centering \publicationname\ \thearticlenumber \par}
  \vspace{\baselineskip}
  #1 \par
  \vspace{\baselineskip}
  \@articlecopyright \par}
\newcommand\@articlecopyright{}
\newcommand\articlecopyright[1]{\global\renewcommand\@articlecopyright{#1}}
\newcommand\makearticlecovers{}
\newcommand\articlereference[1]{
  #1
  \expandafter\gdef\expandafter\makearticlecovers\expandafter{%
    \makearticlecovers
    \addtocounter{articlenumber}{1}
    \setlength\@tempdima{\articlenumwidth}
    \sbox\@tempboxa{\articlenumberformat[\width]{\thearticlenumber}}
    \ifdim \wd\@tempboxa>\articlenumwidth
      \setlength\@tempdima{\wd\@tempboxa}
    \fi
    \addtolength\@tempdima{2\fboxsep}
    \setlength\@tempdimb{\paperwidth}
    \addtolength\@tempdimb{-\oddsidemargin}
    \makebox[0pt][l]{\makebox[\@tempdimb][r]{\articlenumberformat[\@tempdima]{\thearticlenumber}}} \par
    \vspace*{\stretch{1}}
    \articlereferenceformat{#1}
    \vspace*{\stretch{2}}
    \cleardoublepage
}}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\@addtoreset{footnote}{chapter}
\newcommand\@makefntext[1]{%
    \renewcommand\baselinestretch{1} \normalfont
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\bibname{Bibliography}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\chaptername{Chapter}
\newcommand\appendixname{Appendix}
\newcommand\abstractname{Abstract}
\newcommand\prefacename{Preface}
\newcommand\refname{References}
\newcommand\listofpublicationsname{List of Publications}
\newcommand\authorscontributionname{Author's contribution}
\newcommand\listofabbreviationsname{List of Abbreviations}
\newcommand\listofsymbolsname{List of Symbols}
\newcommand\errataname{Errata}
\newcommand\publicationname{Publication}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\AtBeginDocument{\@ifpackageloaded{hyperref}{%
  \@hyperreftrue
  \renewcommand\theHfigure{\thefigure}
  \renewcommand\theHtable {\thetable}
  \newcommand\hyperrefsection[1]{
    \Hy@GlobalStepCount\Hy@linkcounter
    \xdef\@currentHref{#1*.\the\Hy@linkcounter}%
    \Hy@raisedlink{\hyper@anchorstart{\@currentHref}\hyper@anchorend}}
  \newcommand\hyperrefcontents{
    \renewcommand\addcontentsline[3]{
      \begingroup
        \let\label\@gobble
        \let\textlatin\@firstofone
        \ifx\@currentHref\@empty
          \Hy@Warning{%
            No destination for bookmark of \string\addcontentsline,%
            \MessageBreak destination is added%
          }%
          \phantomsection
        \fi
        \expandafter\ifx\csname toclevel@##2\endcsname\relax
          \Hy@WarningNoLine{bookmark level for unknown ##2 defaults to 0}%
          \def\Hy@toclevel{0}%
        \else
          \edef\Hy@toclevel{\csname toclevel@##2\endcsname}%
        \fi
        \Hy@writebookmark{\csname the##2\endcsname}%
          {##3}%
          {\@currentHref}%
          {\Hy@toclevel}%
          {##1}%
        \ifHy@verbose
          \typeout{pdftex: bookmark at \the\inputlineno:
            {\csname the##2\endcsname}
            {##3}
            {\@currentHref}%
            {\Hy@toclevel}%
            {##1}%
          }%
        \fi
        \addtocontents{##1}{%
          \protect\contentsline{##2}{##3}{}{\@currentHref}%
        }%
      \endgroup}}
    \hypersetup{
      bookmarksnumbered, plainpages=false,% pdfpagelabels,%
      pdfhighlight=/I, pdfpagemode=UseNone,%
      pdftitle=\@title, pdfsubject=PhD Dissertation,%
      pdfauthor=\@author, pdfkeywords=\@keywords,%
      pdfcreator={LaTeX, modified TKK Dissertations class, with hyperref package},%
      pdfstartview= , pdfpagelayout= }
}{\newcommand\hyperrefsection[1]{}}}
%\setlength\columnsep{10\p@}
\setlength\columnsep{10mm}
\setlength\columnseprule{0\p@}
\pagestyle{plaintop}
\pagenumbering{arabic}
\setcounter{page}{3}
\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi
\endinput
%%
%% End of file `tkkdiss-chap.cls'.
