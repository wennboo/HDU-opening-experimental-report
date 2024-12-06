###### Mon Mar 13 16:44:40 CST 2023

%%% This project is made by BoWang (School of Automation, HDU)
%%%  bowang1988@163.com    2023.10.13


### 文档编译
latex的具体使用方法，请参考本科毕业设计latex模板的详细说明。

通过命令`\vspace{20cm}`空20cm的距离适当调整段间距离，保证和word模板一致

编译文档请使用XeLaTeX引擎。模版提供latexmk设置文件用于自动编译。将命令行工作目录切换到项目文件夹下，执行
latexmk main-thesis.tex

命令即可自动调用相关程序进行编译，处理各种文件依赖并自动预览。执行`latexmk -c`命令清理所有缓存文件。
手动编译的话 
xelatex main-thesis.tex
命令即可，若文档内部有交叉引用或录入参考文献则需要编译两次。

使用BibTeX录入参考文献需要先运行一次xelatex，运行一次bibtex，再运行两次xelatex。完成编译需运行以下命令：
xelatex bibtex xelatex xelatex

