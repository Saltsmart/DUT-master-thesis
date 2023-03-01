\ProvidesClass{Style/dutthesis}
\NeedsTeXFormat{LaTeX2e}
\newif{\ifPrint}
\DeclareOption{print}{\Printtrue}
\DeclareOption{ecopy}{\Printfalse}
\newif{\ifAcademic}
\DeclareOption{academic}{\Academictrue}
\DeclareOption{professional}{\Academicfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
\LoadClass[a4paper,UTF8,zihao=false,scheme=plain,fontset=none,twoside]{ctexbook}  % 支持中文
% 关于创建cls和sty：https://www.overleaf.com/learn/latex/Writing_your_own_class
\RequirePackage{anyfontsize}  % 解决报错：https://blog.csdn.net/weixin_46007691/article/details/122174991
\RequirePackage{xfp}  % 提供数学运算：http://mirrors.ctan.org/macros/latex/contrib/l3packages/xfp.pdf

% 总标题
\newcommand{\dbtitle}[2]{
    \def\title{#1}
    \newcommand{\titlename}{#1}
    \newcommand{\engtitle}{#2}
}

% 相关信息
\newcommand{\INFO}[8]{
    \newcommand{\Author}{#1}
    \newcommand{\Major}{#2}
    \newcommand{\StudentID}{#3}
    \newcommand{\AdvisorName}{#4}
    \newcommand{\AdvisorTitle}{#5}
    \newcommand{\Year}{#6}
    \newcommand{\Month}{#7}
    \newcommand{\Day}{#8}
}

% 字体
% 英文字体使用 Times New Roman
\setmainfont[
    Path=./Font/,
    BoldFont=timesbd.ttf,
    ItalicFont=timesi.ttf,
    BoldItalicFont=timesbi.ttf]{times.ttf}
% 新建英文字体族
\newfontfamily{\cambria}[Path=./Font/]{cambria.ttf}
% \newfontfamily\calibri[Path=./Font/]{calibri-regular.ttf}
% 修改中文字体族，增加黑体
\setCJKmainfont[
    Path=./Font/,
    AutoFakeBold,
    BoldFont=simhei.ttf,
    ItalicFont=simkai.ttf,
    BoldItalicFont=simfang.ttf]{simsun.ttc}
\setCJKsansfont[Path=./Font/,AutoFakeBold]{simhei.ttf}
\setCJKmonofont[Path=./Font/,AutoFakeBold]{simfang.ttf}
\setCJKfamilyfont{zhsong}[Path=./Font/,AutoFakeBold]{simsun.ttc}
\newcommand{\song}{\CJKfamily{zhsong}}
\setCJKfamilyfont{zhhei}[Path=./Font/,AutoFakeBold]{simhei.ttf}
\newcommand{\hei}{\CJKfamily{zhhei}}
% \setCJKfamilyfont{zhkai}[Path=./Font/,AutoFakeBold]{simkai.ttf}
% \newcommand{\kai}{\CJKfamily{zhkai}}
\setCJKfamilyfont{zhfs}[Path=./Font/,AutoFakeBold]{simfang.ttf}
\newcommand{\fs}{\CJKfamily{zhfs}}
\setCJKfamilyfont{xihei}[Path=./Font/,AutoFakeBold]{stxihei.ttf}
\newcommand{\xhei}{\CJKfamily{xihei}}
\setCJKfamilyfont{xingkai}[Path=./Font/,AutoFakeBold]{stxingka.ttf}
\newcommand{\xkai}{\CJKfamily{xingkai}}

% 间距：https://www.cnblogs.com/tsingke/p/10428850.html
\AtBeginDocument{
    \linespread{1.35}  % 大致对应word的1.25倍行距
    \song\zihao{-4}  % 正文字体也在这里设置
    \setlength{\parskip}{0bp}  % 段距
    \setlength{\parindent}{2em}  % 首行缩进
    \setlength{\abovedisplayskip}{6bp}  % 公式上下文设置半行间距（6bp）或者6pt
    \setlength{\belowdisplayskip}{6bp}
    % 图片和浮动对象间距
    \setlength{\@fptop}{0bp}
    \setlength{\@fpsep}{10bp plus 0bp minus 2bp}  % 以一正文行为标准
    \setlength{\@fpbot}{0bp}
    \setlength{\floatsep}{10bp plus 0bp minus 2bp}
    \setlength{\textfloatsep}{10bp plus 0bp minus 2bp}
    \setlength{\intextsep}{10bp plus 0bp minus 2bp}
}
\newcommand{\TitleVerticalSpace}{-1\baselineskip}

% 章节标题样式
\RequirePackage{titlesec}
\newcommand{\linespacing}[1]{\linespread{#1}\selectfont}  % 行距命令
\ctexset{
    chapter={
      name={{},{}},  % 让章节的编号为数字
      number=\arabic{chapter},
    }
}
\titlespacing{\chapter}{0em}{0em}{1em}  % 章标题：段后1行，段前0行
\titlespacing{\section}{0em}{0.5em}{0em}  % 节标题：段后0行，段前0.5行
\titlespacing{\subsection}{0em}{0.5em}{0em}  % 节中的一级标题：段后0行，段前0.5行
\titleformat{\chapter}[hang]{\hei \zihao{-3} \linespacing{1.5}}{\thechapter}{2ex}{}  % 章标题：黑体，小三，1.5倍行距
\titleformat{\section}[hang]{\hei \zihao{4} \linespacing{1.5}}{\thesection}{2ex}{}  % 节标题：黑体，四号，1.5倍行距
\titleformat{\subsection}[hang]{\hei \zihao{-4} \linespacing{1.5}}{\thesubsection}{2ex}{}  % 节中的一级标题：黑体，小四，1.5倍行距
\setcounter{secnumdepth}{2}  % 最高编号到节中的一级标题

% 纸张和页边距：https://mirror-hk.koddos.net/CTAN/macros/latex/contrib/fancyhdr/fancyhdr.pdf
\RequirePackage[a4paper,left=2.5cm,right=2.5cm,top=2.5cm,bottom=2.5cm,bindingoffset=0mm,headheight=8.5mm,headsep=1.5mm,footskip=7.5mm]{geometry}

% 数学公式和化学方程式
\RequirePackage{amsmath, amsthm, amssymb, amsfonts, mathrsfs, physics, nicefrac}
\RequirePackage[version=4]{mhchem}
\numberwithin{equation}{chapter}  % 公式按章编号

% 图
\RequirePackage{float}  % 提供位置[H]选项
\RequirePackage{graphicx}  % 提供\includegraphics和旋转图片的设置
\RequirePackage{adjustbox}
\numberwithin{figure}{chapter}  % 图按章编号
\graphicspath{{Figure/}}
% 表格
\RequirePackage{array}
\RequirePackage{bigstrut}
\RequirePackage{booktabs}  % 三线表
\RequirePackage{longtable}  % 长表格
\RequirePackage{threeparttable}  % 表和图的注释：一律用阿拉伯数字和右半圆括号按顺序编排，如注1），写在图表下方
\RequirePackage{multicol}
\RequirePackage{multirow}
\numberwithin{table}{chapter}  % 表按章编号
% 表文字
\def\@floatboxreset{
    \reset@font
    \zihao{-4}  % 图表中用小四号字
    \@setminipage
}
\AtBeginEnvironment{longtable}{\zihao{-4}}  % 长表格中也如此
% 图名、表名
\RequirePackage[labelformat=simple]{subcaption}
\RequirePackage{bicaption}  % 双语
\DeclareCaptionFont{CapFont}{\song \zihao{5}}  % 表名及图名用五号宋体
\DeclareCaptionLabelSeparator{TwoSpaces}{~~}
\DeclareBiCaptionSeparator{MinusSep}{\vspace{-0.3em}}
\captionsetup{bi-separator=MinusSep}
% 关于captionsetup的设置：https://www.latexstudio.net/archives/8652.html
\captionsetup[figure][bi-first]{  % 中文：图
    subrefformat=parens,  % 图名及表名中引用子图、子表时也带括号
    labelsep=TwoSpaces,
    font=CapFont,
    skip=1bp,
    name=图
}
\captionsetup[table][bi-first]{  % 中文：表
    subrefformat=parens,
    labelsep=TwoSpaces,
    font=CapFont,
    skip=1bp,
    name=表
}
\captionsetup[figure][bi-second]{  % 英文：图
    subrefformat=parens,
    labelsep=TwoSpaces,
    font=CapFont,
    skip=1bp,
    name=Fig.
}
\captionsetup[table][bi-second]{  % 英文：表
    subrefformat=parens,
    labelsep=TwoSpaces,
    font=CapFont,
    skip=1bp,
    name=Tab.
}
\newcommand{\dbcaption}[3]{\bicaption{#1}{#2}\label{#3}}
\newcommand{\dbsubcaption}[3]{\bisubcaption{#1}{#2}\label{#3}}
\setlength{\abovecaptionskip}{0bp}
\setlength{\belowcaptionskip}{0bp}
\renewcommand{\thesubfigure}{(\alph{subfigure})}  % 附带子图时显示括号：http://mirrors.ibiblio.org/CTAN/macros/latex/contrib/caption/subcaption.pdf

% 图片等浮动对象位置和占比
\renewcommand{\floatpagefraction}{0.85}  % 浮动页中浮动对象最大占比
\renewcommand{\textfraction}{0.07}  % 文本页中文本最小占比
\renewcommand{\topfraction}{0.9}  % 页面顶部可以用来放置浮动对象的高度与整个页面高度的最大比例
\renewcommand{\bottomfraction}{0.8}

% 插入PDF文件和层叠图、全页图
\RequirePackage[final]{pdfpages}
% \RequirePackage{overpic}
% \newcommand{\includefullgraphics}[2][]{
%   \newpage
%   \thispagestyle{empty}
%   \begin{tikzpicture}[remember picture, overlay, inner sep=0pt]
%     \node at (current page.center)
%       {\includegraphics[width=\paperwidth, height=\paperheight, keepaspectratio=false,#1]{#2}};
%   \end{tikzpicture}
%   \newpage
% }
\newcommand{\BlankPage}{
    \includepdf{Misc/blank.pdf}
    \addtocounter{page}{-1}
}  % 空白页命令

% 参考文献与引用：https://mirror-hk.koddos.net/CTAN/macros/latex/contrib/biblatex-contrib/biblatex-gb7714-2015/biblatex-gb7714-2015.pdf
\RequirePackage[backend=biber,
    style=gb7714-2015,
    doi=false,
    eprint=false,
    gbmedium=false,
    % gbpub=true,  % 控制出版商、出版地缺失是否显示
    gbpunctin=false,
    url=false]{biblatex}
\RequirePackage[pdftitle={硕士学位论文},
    pdfpagemode=FullScreen,
    bookmarksnumbered,
    hidelinks]{hyperref}
\renewcommand{\bibname}{\centering{\hei \zihao{-3} 参~考~文~献}\\[\TitleVerticalSpace]}  % 标题“参考文献”，黑体，居中，字号：小三，1.5倍行距，段后1行，段前为0行。
\renewcommand{\bibfont}{\song \zihao{5}}  % 宋体 五号
\addbibresource[location=local]{Bib/References.bib}
\newcommand{\BIB}{
    \clearpage
    \phantomsection
    \addcontentsline{toc}{chapter}{参~考~文~献}
    \printbibliography
}
% 修改交叉引用名
% autoref版本：https://www.latexstudio.net/archives/7446.html
% 自定义版本，需要fncylab宏包支持：http://mirrors.ctan.org/macros/latex/contrib/fncylab/fncylab.pdf
\labelformat{chapter}{第 \zhnumber{#1} 章}
\labelformat{section}{#1 节}
\labelformat{subsection}{#1 小节}
\labelformat{appendix}{#1}
\labelformat{figure}{图 #1}
\labelformat{table}{表 #1}
\labelformat{equation}{公式 (#1)}  % 加括号
\labelformat{footnote}{附注 #1}

% 附注
\numberwithin{footnote}{chapter}  % 附注按章编号

% 列表格式：https://mirror-hk.koddos.net/CTAN/macros/latex/contrib/enumitem/enumitem.pdf
\RequirePackage{enumitem}
\setlist{nosep}  % 取消列表前、项目间和列表后的垂直距离
\setenumerate{wide,label=（\arabic*）,labelsep=0.5em}

% 页码、页眉和页脚设置
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}  % 清除原有页眉页脚
\fancypagestyle{plain}{
    \pagestyle{fancy}  % chapter首页也用这里定义的页眉页脚
}
\renewcommand{\headrulewidth}{1bp}  % 页眉线
% \renewcommand{\footrulewidth}{1bp}  % 页脚线
\ifAcademic
    \fancyhead[CO]{{\song \zihao{5} 大连理工大学硕士学位论文}}  % 奇数页页眉，居中，宋体，五号
\else
    \fancyhead[CO]{{\song \zihao{5} 大连理工大学专业学位硕士学位论文}}  % 奇数页页眉，居中，宋体，五号
\fi
\fancyhead[CE]{{\song \zihao{5} \titlename}}  % 偶数页页眉，居中，宋体，五号
\cfoot{{\song \zihao{-5} --~\thepage~--}}  % 页码，居中，底部，宋体，小五，正文起始页页码为1
\renewcommand{\cleardoublepage}{\clearpage}  % 清除空白页
% \let\Origincleardoublepage\cleardoublepage
% \renewcommand{\cleardoublepage}{\clearpage\begingroup\pagestyle{empty}\Origincleardoublepage\endgroup}  % 空白页清除页眉和编码

% 独创性声明
\newcommand{\STMT}{
    % 插入打印后的文件
    % \includepdf{Misc/statement.pdf}
    % 手动添加相关内容
    \clearpage
    \thispagestyle{empty}
    \begin{tikzpicture}[remember picture, overlay, inner sep=0pt]
        \node at (current page.center)
        {\includegraphics[width=\paperwidth, height=\paperheight, keepaspectratio=false]{Misc/statement.pdf}};
        \node[xshift=-4.5cm,yshift=1.1cm,anchor=west] at (current page.center)
        {{\fs \zihao{4} \titlename}};
        \node[xshift=-2cm,yshift=0.15cm] at (current page.center)
        {\includegraphics[height=1cm]{Misc/sign.png}};  % 签名
        \node[xshift=3.7cm,yshift=0.1cm] at (current page.center){  % 年
            \includegraphics[height=0.8cm]{Misc/year.png}
            % {\fs \zihao{4} \Year}
        };
        \node[xshift=5.55cm,yshift=0.1cm] at (current page.center){  % 月
            \includegraphics[height=0.6cm]{Misc/month.png}
            % {\fs \zihao{4} \Month}
        };
        \node[xshift=7cm,yshift=0.1cm] at (current page.center){  % 日
            \includegraphics[height=0.6cm]{Misc/day.png}
            % {\fs \zihao{4} \Day}
        };
    \end{tikzpicture}
    \clearpage
    \ifPrint  % 封二单面打印
        \BlankPage
    \fi
}

% 摘要
\newcounter{pagebeforeTOC}
\newenvironment{Abstract}[1]{
    \newcommand{\@keywords}{#1}
    \clearpage
    \pagenumbering{Roman}  % 本页使用罗马数字页码
    \phantomsection
    \chapter*{\centering{摘~~~~要}\\[\TitleVerticalSpace]}
    \addcontentsline{toc}{chapter}{摘~~~~要}
    \song \zihao{-4}
}{
    \par ~\\ \indent {\hei \zihao{-4} 关键词：} \fs \zihao{-4} \@keywords
    \ifPrint  % 中文摘要单面打印
        \BlankPage
    \fi
}
\newenvironment{EngAbstract}[1]{
    \newcommand{\@engkeywords}{#1}
    \phantomsection
    \chapter*{\centering{\engtitle \\{\cambria Abstract}}\\[\TitleVerticalSpace]}
    \addcontentsline{toc}{chapter}{Abstract}
    \zihao{-4}
}{
    \par ~\\ \indent \textbf{\zihao{-4} Key Words:~} \zihao{-4} \@engkeywords
    \addtocounter{pagebeforeTOC}{\value{page}}  % 计算目录前面的页数（摘要）
    \ifPrint  % 英文摘要如果是一页，单面打印；否则双面打印
        \ifodd\value{page}  % 页码要算上中文摘要的一页，所以是奇数时不加空页，是偶数时加空页
        \else
            \BlankPage
        \fi
    \fi
}

% 目录
\RequirePackage{titletoc}
\renewcommand{\contentsname}{\centering{\hei \zihao{-3} 目~~~~录}\\[\TitleVerticalSpace]}  % 标题“目录”，字体：黑体，字号：小三
% 章、节标题和页码，字体：宋体，字号：小四
\titlecontents{chapter}[0em]{\song \zihao{-4}}{\thecontentslabel~~}{}{\titlerule*[5bp]{.}\thecontentspage}   % 章目录定义：判断thechapter计数器是否为字母，字母则为附录
\titlecontents{section}[2em]{\song \zihao{-4}}{\thecontentslabel~~}{}{\titlerule*[5bp]{.}\thecontentspage}  % 节目录定义
\titlecontents{subsection}[3.5em]{\song \zihao{-4}}{\thecontentslabel~~}{}{\titlerule*[5bp]{.}\thecontentspage}  % 节中的一级标题目录定义
\newcommand{\TOC}{
    \tableofcontents
    % 目录如果是一页，单面打印；如果两页，双面打印；如果三页，第一、二页双面打印，第三页单面打印。
    \ifPrint
        \ifodd\inteval{\arabic{page}-\thepagebeforeTOC}  % 采取奇数页补一页
            \BlankPage
        \fi
    \fi
    \clearpage
    \pagenumbering{arabic}  % 下一页是正文，使用阿拉伯数字页码
}
% 将不编号的章节添加进来，参见https://zhuanlan.zhihu.com/p/66434387 以及 https://zhuanlan.zhihu.com/p/398759609

% 引言
\newenvironment{Introduction}{
    \phantomsection
    \chapter*{\centering{引~~~~言}\\[\TitleVerticalSpace]}
    \addcontentsline{toc}{chapter}{引~~~~言}
    \song \zihao{-4}
}{}

% 结论
\newenvironment{Conclusion}{
    \clearpage
    \phantomsection
    \chapter*{\centering{结~~~~论}\\[\TitleVerticalSpace]}
    \addcontentsline{toc}{chapter}{结~~~~论}
    \song \zihao{-4}
}{}

% 附录
% 计数器参见（可用于附注计数器）：https://www.jianshu.com/p/9d53cc6a64b8
\newcounter{appendix}[section]
\renewcommand{\theappendix}{附录\Alph{appendix}}
\newenvironment{Appendix}[1]{
    \clearpage
    \refstepcounter{appendix}
    \phantomsection
    \chapter*{\centering{\theappendix~~{#1}}\\[\TitleVerticalSpace]}
    \addcontentsline{toc}{chapter}{\theappendix~~{#1}}
    \song \zihao{-4}
    \renewcommand{\thefigure}{\Alph{appendix}\arabic{figure}}
    \renewcommand{\thetable}{\Alph{appendix}\arabic{table}}
    \renewcommand{\thefootnote}{\Alph{appendix}\arabic{footnote}}
    \renewcommand{\theequation}{\Alph{appendix}\arabic{equation}}
    \setcounter{figure}{0}
    \setcounter{table}{0}
    \setcounter{footnote}{0}
    \setcounter{equation}{0}
}{}

% 攻读硕士学位期间发表学术论文情况
\newlist{pubs}{enumerate}{1}
\setlist[pubs,1]{wide,label=\arabic*,labelsep=1em}
\newenvironment{Publications}{
    \clearpage
    \phantomsection
    \chapter*{\centering{攻读硕士学位期间发表学术论文情况}\\[\TitleVerticalSpace]}
    \addcontentsline{toc}{chapter}{攻读硕士学位期间发表学术论文情况}
    \song \zihao{-4} \setlength{\parindent}{0em}
}{}

% 致谢
\newenvironment{Acknowledgement}{
    \clearpage
    \phantomsection
    \chapter*{\centering{致~~~~谢}\\[\TitleVerticalSpace]}
    \addcontentsline{toc}{chapter}{致~~~~谢}
    \song \zihao{-4}
}{
    \ifPrint  % 正文从引言开始到致谢结束，双面打印。
        \ifodd\thepage  % 采取奇数页补一页
            \BlankPage
        \fi
    \fi
}

% 授权书：单面打印
\newcommand{\AUTH}{
    \clearpage
    \phantomsection
    \addcontentsline{toc}{chapter}{大连理工大学学位论文版权使用授权书}
    % 插入打印后的文件
    % \includepdf{Misc/authorization.pdf}
    \thispagestyle{empty}
    \begin{tikzpicture}[remember picture, overlay, inner sep=0pt]
        \ifAcademic
            \node at (current page.center)
            {\includegraphics[width=\paperwidth, height=\paperheight, keepaspectratio=false]{Misc/authorization.pdf}};
        \else
            \node at (current page.center)
            {\includegraphics[width=\paperwidth, height=\paperheight, keepaspectratio=false]{Misc/authorization-pro.pdf}};
        \fi
        \node[xshift=-4.5cm,yshift=1.7cm,anchor=west] at (current page.center)
        {{\fs \zihao{4} \titlename}};
        \node[xshift=-2cm,yshift=0.9cm] at (current page.center)
        {\includegraphics[height=1cm]{Misc/sign.png}};  % 签名
        \node[xshift=3.7cm,yshift=0.8cm] at (current page.center){  % 年
            \includegraphics[height=0.8cm]{Misc/year.png}
            % {\fs \zihao{4} \Year}
        };
        \node[xshift=5.55cm,yshift=0.8cm] at (current page.center){  % 月
            \includegraphics[height=0.6cm]{Misc/month.png}
            % {\fs \zihao{4} \Month}
        };
        \node[xshift=7cm,yshift=0.8cm] at (current page.center){  % 日
            \includegraphics[height=0.6cm]{Misc/day.png}
            % {\fs \zihao{4} \Day}
        };
    \end{tikzpicture}
    \clearpage
}

% 其它
\RequirePackage{Style/abbreviation}
\RequirePackage{Style/tikzstyles}
\RequirePackage{Style/algostyles}
