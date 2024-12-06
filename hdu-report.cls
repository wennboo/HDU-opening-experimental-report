%
%  This latex profect is made by WangBo (School of Automation,HDU)王博-杭州电子科技大学自动化学院
%  wangbo@hdu.edu.cn     2022.5.24
%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%\bfseries是全局命令，加粗
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%\vspace*{} and \vspace{}前者在页面开头没作用%%%%%%%%%


\ProvidesClass{hdu-report}
\newif\ifbachelorp\bachelorpfalse
\newif\ifmasterp\masterpfalse
\newif\ifdoctorp\doctorpfalse
\newif\ifcoursep\coursepfalse





\DeclareOption{bachelor_p}{\bachelorptrue}
\DeclareOption{master_p}{\masterptrue}
\DeclareOption{doctor_p}{\doctorptrue}
\DeclareOption{course_p}{\courseptrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass[12pt, openany, twoside]{article}%小四号 12pt
\RequirePackage[a4paper,
  inner=3cm, outer=3cm, top=3cm, bottom=3cm,
  bindingoffset=0cm]{geometry}

\RequirePackage[bf,pagestyles]{titlesec}
\RequirePackage{hyperref}
\hypersetup{
  colorlinks=true,
  citecolor=black,
  bookmarksnumbered=true,
  linkcolor=black,
  urlcolor=blue
}

\RequirePackage{indentfirst}
\RequirePackage{xeCJK}
\RequirePackage{tikz}%%%%%%%绘图宏包
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage[comma,numbers,square,sort&compress]{natbib}
\RequirePackage{paralist}
\RequirePackage{bm}
\RequirePackage{url}
\RequirePackage{graphicx}
\usepackage{subfigure} 
\RequirePackage{dcolumn} %%%%%%列表对齐
\RequirePackage{bbding}%%%%%%%%%%五角星
\RequirePackage{ifthen}
\RequirePackage{multirow}
\RequirePackage{zhnumber}
\RequirePackage{appendix}
%\RequirePackage{cite}
\RequirePackage[normalem]{ulem}
\RequirePackage{enumitem}
\RequirePackage{anyfontsize}%%%%%%保证不同尺寸的pt

\RequirePackage{algorithm2e}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{bookmark}
\RequirePackage{fancyvrb}%%%定义页眉页脚
\RequirePackage{fancyhdr}
\RequirePackage[marginal,perpage]{footmisc}
\RequirePackage{pifont}
\RequirePackage{etoolbox}
\RequirePackage{setspace}
%\renewcommand{\thefootnote}{}

\InputIfFileExists{hdu-report.cfg}




%%%%%%%%%%%%%%%%字体设置%%%%%%%%%%%%%%%%%


\setCJKmainfont[AutoFakeBold=true]{SimSun}
\setCJKfamilyfont{zhsong}{SimSun}
\newcommand{\songti}{\CJKfamily{zhsong}}
\setCJKfamilyfont{zhhei}{SimHei}
\newcommand{\heiti}{\CJKfamily{zhhei}}
\setCJKfamilyfont{zhkai}{KaiTi}
\newcommand{\kaiti}{\CJKfamily{zhkai}}
\setCJKfamilyfont{zhfs}{FangSong}
\newcommand{\fs}{\CJKfamily{zhfs}}


\newcommand{\chuhao}{\fontsize{42pt}{46pt}\selectfont}
\newcommand{\xiaochuhao}{\fontsize{36pt}{40pt}\selectfont}
\newcommand{\yichu}{\fontsize{32pt}{36pt}\selectfont}
\newcommand{\yihao}{\fontsize{28pt}{32pt}\selectfont}
\newcommand{\erhao}{\fontsize{21pt}{24pt}\selectfont}
\newcommand{\xiaoerhao}{\fontsize{18pt}{18pt}\selectfont}
\newcommand{\sanhao}{\fontsize{15.75pt}{15.75pt}\selectfont}
\newcommand{\xiaosanhao}{\fontsize{15pt}{15pt}\selectfont}
\newcommand{\sihao}{\fontsize{14pt}{14pt}\selectfont}
\newcommand{\xiaosihao}{\fontsize{12pt}{12pt}\selectfont}
\newcommand{\wuhao}{\fontsize{10.5pt}{11pt}\selectfont}
\newcommand{\xiaowuhao}{\fontsize{9pt}{11pt}\selectfont}
\newcommand{\liuhao}{\fontsize{7.5pt}{9pt}\selectfont}
\newcommand{\xiaoliuhao}{\fontsize{6.5pt}{7.5pt}\selectfont}
\newcommand{\qihao}{\fontsize{5.5pt}{6.5pt}\selectfont}




%%%%%%%%%%%%%%%%公式编号设置%%%%%%%%%%%%%%
\numberwithin{equation}{section}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%文本格式设置
\linespread{1.391}%行距设置
\setlength\parindent{2em}%首行缩进
\titlespacing{\section}{0pt}{18pt}{6pt}
\titlespacing{\subsection}{0pt}{12pt}{6pt}
\titlespacing{\subsubsection}{0pt}{12pt}{6pt}
\setlength{\parskip}{0pt}% 段距

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%参考文献格式设置%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\bibsep}{0em}%%%%%%%调整间距
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%节字号设置%%%%%%%%%%%%%%%%
\titleformat{\section}[block]
  {\xiaosanhao\bfseries}%%%%%%%%字体
  {\thesection}{7pt}{}%%%%%%%%%%%标号与文字间距

\titleformat{\subsection}[block]
  {\sihao\bfseries}
  {\thesubsection}{7pt}{}

\titleformat{\subsubsection}[block]
  {\xiaosihao\bfseries}
  {\thesubsubsection}{6pt}{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %%%%%%%%%%%%%定理环境设计%%%%%%%%%
\newtheorem{theorem}{定理}[section]
\newtheorem{axiom}[theorem]{公理}
\newtheorem{corollary}[theorem]{推论}
\newtheorem{lemma}[theorem]{引理}
\newtheorem{definition}[theorem]{定义}
\newtheorem{example}[theorem]{举例}
\newtheorem{proposition}[theorem]{命题}
\newtheorem{problem}[theorem]{问题}
\newtheorem{assumption}[theorem]{假设}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 




%%%%%%%%%%%%%%%%%%%%%%%插入图片%%%%%%%%%%%%%%%%%%%%%%%%
\graphicspath{{./pic/}}
%%%%%%%%%%%%%%%需要用到的命令%%%%%%%%%%%%%




%%%%%%%%%%%%%%%页眉页脚设置%%%%%%%%%%%%%%%%%%%
\setlength{\headheight}{15pt}%页眉设置
\pagestyle{fancy}%%自己设计页眉页脚
\fancyhf{}
\ifcoursep
\fancyhead[C]{\wuhao\cn@course\cn@coursep}
\else
\fancyhead[C]{\wuhao\cn@reportheader}
\fi
\fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\thepage}

%%%%%%%%%%%%%%%%英文的标号变成中文%%%%%%%%%%%
\renewcommand{\refname}{参考文献}%%%%%默认是英文
\renewcommand{\figurename}{图}%%%默认是英文
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%参考文献设置%%%%%%%%%%%%%%%%%%%
\renewcommand{\citep}[1]{\textsuperscript{\cite{#1}}}
\newcommand{\hdubibliography}[1]{
  \bibliographystyle{hdu-report}
\bibliography{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%圆圈数字的脚注设置%%%%%%%%%%%%%%
%\makeatletter是在tex文档中使用latex的命令@
\newcommand*{\circnum}[1]{%
  \expandafter\@circnum\csname c@#1\endcsname
}
\newcommand*{\@circnum}[1]{%
  \ifnum#1<1 %
    \@ctrerr
  \else
    \ifnum#1>20 %
      \@ctrerr
    \else
      \ding{\the\numexpr 171+(#1)\relax}%
    \fi
  \fi
}
%\makeatother

\renewcommand*{\thefootnote}{\circnum{footnote}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





%%%%%%%%%%%空白页设置%%%%%%%%%%%
\newcommand\coverblankpage{%
  \newpage
  \null
  \thispagestyle{empty}%当前页不显示页码
  \setcounter{page}{0}
  \newpage
}
\newcommand\blankpage{%
  \newpage
  \null
  \thispagestyle{empty}%当前页不显示页码
  %\stepcounter{pseudopage}
  \newpage
}




\newcommand{\makecover}{
%%%%%%%%%%
\ifbachelorp
\thetitlepage@bachelor@proposal
\else \ifcoursep
\thetitlepage@labreport
\else 
\thetitlepage@master@proposal
\fi
\fi
}

