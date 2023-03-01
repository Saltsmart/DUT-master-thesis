# DUT-master-thesis
📕连附录都有的大连理工大学硕士（包括学术型硕士和专业型硕士）学位论文LaTeX模板，参考了以下工作：

[清华大学学位论文模板](https://github.com/tuna/thuthesis)

[DUT-HPC团队的大连理工大学学位论文模板](https://github.com/DUT-HPC/DUT-TEX-TEMPLATE)

---

💯目前已在overleaf平台及VSCode+LaTeX Workshop上通过编译。

宏包的所有选项在`main.tex`的开头部分。

支持选择学术型硕士`academic`或专业型硕士`professional`，以及电子版`ecopy`或打印版`print`（会自动插入空页以实现部分页面单面打印）

---

🈚目前存在以下bug：

1.  附录插入参考文献的编号暂无法调整为 \[A1\] 这样的格式；（考虑到附录中不常出现参考文献，需要参考[宏包biblatex-gb7714-2015的说明](https://mirror-hk.koddos.net/CTAN/macros/latex/contrib/biblatex-contrib/biblatex-gb7714-2015/biblatex-gb7714-2015.pdf)）

**算法`algorithm`环境的双语标题已经正常！**（目前学校对算法伪代码格式没有规定。该问题是由`bicaption`宏包与`algorithm`环境不适配导致的，参见[bicaption的issue](https://gitlab.com/axelsommerfeldt/caption/-/issues/158)）

学校同学当中流传过各种latex模板，重复造轮子非常耽误大家的时间，非常希望这个模板能够继续开发下去♥有任何问题反馈，欢迎cue：ts151820\[at\]163\[dot\]com！
