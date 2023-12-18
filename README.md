
# 开题报告模板

此项目旨在帮助杭州电子科技大学的本科、硕博生高效地完成毕业论文开题以及开题报告的写作。非官方模板，如若使用，后果自负！！！

## 使用方法

### 基本环境
此模板，建议用texlive配合vscode来使用，可参考下面网站
https://zhuanlan.zhihu.com/p/166523064或者
https://zhuanlan.zhihu.com/p/38178015
<font color=red>VSCode的latex插件安装后的具体配置，参考文档末尾说明</font>
### 模板种类
支持本科生、硕士、博士开题报告，支持实验报告、思政报告、课程报告等报告的撰写。
具体配置方法修改`master-main.tex`的`\documentclass[#]{hdu-report}`中的`[#]`修改，配置如下
| 模式| 备注 |
|---|---|
|bachelor_p| 本科开题模板 | 
|master_p| 硕士开题模板 | 
|doctor_p| 博士开题模板 |
|course_p| 实验/课程/思政报告模板 |


### 模板说明
本科生开题报告及开题报告符合要求，硕博生有待学院和学校认可。

### 文档编译
编译文档请使用XeLaTeX引擎。

手动编译的话执行
```bash
xelatex main.tex
```
命令即可，若文档内部有交叉引用或录入参考文献则需要编译两次。

使用BibTeX录入参考文献需要先运行一次xelatex，运行一次bibtex，再运行两次xelatex。按顺序运行以下命令：

```bash
xelatex main.tex
bibtex main.aux
xelatex main.tex
xelatex main.tex
```

## 论文写作指南

### 论文封面

论文封面和扉页由`\makecover`命令添加，可以显示论文题目，作者，指导老师等。

封面显示的信息可以使用一系列命令进行设置，包括标题、作者、学院等。

| 命令名称 | 参数#1 | 参数#2 | 参数#3 |备注|
|---|---|---|---|---|
|\title{#1}{#2}| 中文标题 | 英语标题 |无 |英文标题|
|\author{#1}{#2}| 作者中文名 | 作者英文名 |无 |无|
|\advisor{#1}{#2}| 导师中文名 | 导师英文名 |无 |无|
|\school{#1}{#2}| 学院中文名 | 学院英文名|无 |无|
|\major{#1}{#2}| 专业中文名| 专业英文名 |无 |无|
|\authornumber{#1}| 学号 | 无 |无 |无|
|\authorclass{#1}| 班级 | 无 |无 |本科生填|
|\course{#1}{#2}| 课程名称 | 报告类型 |无 |实验报告、思政报告、课程报告等需填|
|\completedate{#1}{#2}{#3}| 年 | 中文月 |英文月简写，如Feb |无|




### 论文主体

建议先备份，然后参考main-report.tex或main-report.pdf里面的说明，对比着完成撰写。所有要插入的图片，可放在pic文件夹下。


### 参考文献

使用BibTeX录入参考文献由`\thesisbibliography{}`命令导入`*.bib`文件数据库，参考文献文件夹放在ref目录下。

<font color=red>本工程bst文件参考以下网址工程，参考文献中文献类型bibtex可参考以下网址中test项目编写，注意如果文献格式不规范可能导致编译不通过：</font>
https://github.com/Haixing-Hu/GBT7714-2005-BibTeX-Style

### 分割文件

使用者认为必要可以将各个章节写在不同的子文件内，然后放在`contents`文件夹下，使用`\input`命令统一包含到正文。比如`\input{contents/sectionA}`插入一整章。





## VSCODE Latex插件安装后的具体配置

在 VSCode 界面下按下 F1，然后键入“setjson”，点击“首选项: 打开设置(JSON)”，JSON里面添加以下代码完成

    //------------------------------LaTeX 配置----------------------------------
       // 设置是否自动编译
       "latex-workshop.latex.autoBuild.run":"never",
       //右键菜单
       "latex-workshop.showContextMenu":true,
       //从使用的包中自动补全命令和环境
       "latex-workshop.intellisense.package.enabled": true,
       //编译出错时设置是否弹出气泡设置
       "latex-workshop.message.error.show": false,
       "latex-workshop.message.warning.show": false,
       // 编译工具和命令
       "latex-workshop.latex.tools": [
        {
            "name": "latex",
            "command": "latex.exe",
            "args": [
                "-src",
                "-interaction=nonstopmode",
                "%DOCFILE%.tex"
            ]
        },        
        {
            "name": "pdflatex",
            "command": "pdflatex.exe",
            "args": [
                "-synctex=1",
                "-interaction=nonstopmode",
                "-aux-directory=build",
                "%DOCFILE%.tex"
            ]
        },
        {
            "name": "xelatex",
            "command": "xelatex.exe",
            "args": [
                "-synctex=1",
                "-interaction=nonstopmode",
                "%DOCFILE%.tex"
            ]
        },
        {
            "name": "latexmk",
            "command": "latexmk",
            "args": [
                "-synctex=1",
                "-interaction=nonstopmode",
                "-file-line-error",
                "-pdf",
                "-outdir=%OUTDIR%",
                "%DOCFILE%"
            ]
        },
        {
            "name": "lualatex",
            "command": "lualatex.exe",
            "args": [
                "-synctex=1",
                "-interaction=nonstopmode",
                "%DOCFILE%.tex"
            ]
        },
        {
            "name": "dvips",
            "command": "dvips.exe",
            "args": [
                "-o",
                "%DOCFILE%.ps",
                "%DOCFILE%.dvi"
            ]
        },
        {
            "name": "dvipng",
            "command": "dvipng.exe",
            "args": [
                "-T",
                "tight",
                "-D",
                "120",
                "%DOCFILE%.dvi"
            ]
        },
        {
            "name": "ps2pdf",
            "command": "ps2pdf.exe",
            "args": [
                "%DOCFILE%.ps"
            ]
        },
        {
            "name": "dvipdf",
            "command": "dvipdfm.exe",
            "args": [
                "%DOCFILE%.dvi"
            ]
        },
        {
            "name": "bibtex",
            "command": "bibtex.exe",
            "args": [
                "%DOCFILE%.aux"
            ]
        },
        {
            "name": "biber",
            "command": "biber.exe",
            "args": [
                "%DOCFILE%.bcf"
            ]
        }
        ],
       // 用于配置编译链
       "latex-workshop.latex.recipes": [
           {
               "name": "XeLaTeX",
               "tools": [
                   "xelatex"
               ]
           },
           {
               "name": "PDFLaTeX",
               "tools": [
                   "pdflatex"
               ]
           },
           {
            "name": "latex",
            "tools": [
                "latex"
            ]
            },
           {
               "name": "BibTeX",
               "tools": [
                   "bibtex"
               ]
           },
           {
               "name": "LaTeXmk",
               "tools": [
                   "latexmk"
               ]
           },


           {
                "name": "luatex",
                "tools": [
                 "lualatex"
                ]
            },
            {
                "name": "dvips",
                "tools": [
                    "dvips"
                ]
            },
            {
                "name": "dvipng",
                "tools": [
                    "dvipng"
                ]
            },
            {
                "name": "ps2pdf",
                "tools": [
                    "ps2pdf"
                ]
            },
            {
                "name": "dvipdf",
                "tools": [
                "dvipdf"
                ]
            },
            {
                "name": "bibtex",
                "tools": [
                    "bibtex"
                ]
            },
            {
                "name": "biber",
                "tools": [
                    "biber"
                ]
            },
           {
            "name": "xelatex -> biber -> xelatex*2",
            "tools": [
                "xelatex",
                "biber",
                "xelatex",
                "xelatex"
            ]
        },
           {
                "name": "xelatex -> bibtex -> xelatex*2",
                "tools": [
                    "xelatex",
                    "bibtex",
                    "xelatex",
                    "xelatex"
                ]
            },

           {
               "name": "pdflatex -> bibtex -> pdflatex*2",
               "tools": [
                   "pdflatex",
                   "bibtex",
                   "pdflatex",
                   "pdflatex"
               ]
           },
           {
            "name": "latex -> dvips -> ps2pdf",
            "tools": [
                "latex",
                "dvips",
                "ps2pdf"
            ]
            },
            {
                "name": "latex -> bibtex -> latex -> dvips -> ps2pdf",
                "tools": [
                    "latex",
                    "bibtex",
                    "latex",
                    "dvips",
                    "ps2pdf"
                ]
            }
       ],
       //文件清理。此属性必须是字符串数组
       "latex-workshop.latex.clean.fileTypes": [
           "*.aux",
           "*.bbl",
           "*.blg",
           "*.idx",
           "*.ind",
           "*.lof",
           "*.lot",
           "*.out",
           "*.toc",
           "*.acn",
           "*.acr",
           "*.alg",
           "*.glg",
           "*.glo",
           "*.gls",
           "*.glsdefs",
           "*.ist",
           "*.fls",
           "*.log",
           "*.fdb_latexmk"
       ],
       //设置为onFaild 在构建失败后清除辅助文件
       "latex-workshop.latex.autoClean.run": "onFailed",
       // 使用上次的recipe编译组合
       "latex-workshop.latex.recipe.default": "lastUsed",
       // 用于反向同步的内部查看器的键绑定。ctrl/cmd +点击(默认)或双击
       "latex-workshop.view.pdf.internal.synctex.keybinding": "double-click",
       "latex-workshop.view.pdf.viewer": "tab",
       "latex-workshop.synctex.synctexjs.enabled": true,
        "latex-workshop.synctex.afterBuild.enabled": true,

    "editor.fontSize": 18,
    "workbench.editorAssociations": {
        "*.pdf": "latex-workshop-pdf-hook"
    }
