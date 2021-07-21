# Stata 新命令：del——删除一个或多个文件

> 作者：王美庭  
> Email: wangmeiting92@gmail.com

## 一、引言

我们知道，`erase`可以删除文件，但其一次性只能删除一个文件。

另外，我们知道，类似`! del *.tex`也能删除多个文件，但是其调用的本非本身的命令，而是 cmd 的命令。除此之外，在运行以上语句时，屏幕会闪烁 cmd 窗口。以上特点，会让人感觉 Stata 用起来不“顺滑”。

于是，我们就使用`erase`命令加循环，写了一个基于 Stata 本身的`del`命令，以使得 Stata 本身也能支持一次性删除多个文件（以通配符的方式）。除此之外，该命令还具有以下特点：

- 输入文件名时支持绝对路径和相对路径。
- 运行命令后会在 Stata 界面上展示删除了哪些文件以及这些文件所在的路径。
- 使用命令后运行`return list`可以得到以下返回值：（1）删除了哪些文件；（2）被删除文件所在的路径；（3）匹配文件时所设定的格式；（4）删除文件的数量。

因此，该命令不仅方便用户直接在 Stata 界面上查看被删除文件的信息，而且其返回值的多样性也方便用户使用这些信息进行后续的编程。

## 二、命令的安装

`del`及本人其他命令的代码都托管于 GitHub 上，读者可随时下载安装这些命令。

你可以通过系统自带的`net`命令进行安装：

```stata
net install del, from("https://raw.githubusercontent.com/Meiting-Wang/del/main")
```

也可以通过`github`外部命令进行安装（`github`命令本身可以通过`net install github, from("https://haghish.github.io/github/")`进行安装）：

```stata
github install Meiting-Wang/del
```

## 三、语法与选项

**命令语法**：

```stata
del ["]filespec["]
```

> - `filespec`: 输入要删除的文件名的格式，如`*`、`read.tex`、`read*.tex`、`..\*`、`c:\Windows\*.exe`等
> - 命令的使用很简单，更多细节可以`help del`。

## 四、实例

```stata
* 单个文件的删除
del read.tex
del "read.tex"
del ".\read.tex"
del "..\read.tex"
del "X:\exercise\Stata\del\read.tex"

* 多个文件的删除
del *
del "read*.tex"
del ".\read*.tex"
del "..\read*.tex"
del "X:\exercise\Stata\del\read*.tex"

* 获得返回值
del "read*.tex"
return list
```

## 五、输出效果展示

```stata
del ".\read*.tex"
```

```stata
location dirname: X:\exercise\Stata\del\
    delete files: "read.tex" "read2.tex" "read3.tex"
```

```stata
return list
```

```stata
macros:
   r(location_dirname) : "X:\exercise\Stata\del\"
      r(write_dirname) : ".\"
     r(delete_pattern) : "read*.tex"
   r(delete_files_num) : "3"
       r(delete_files) : ""read.tex" "read2.tex" "read3.tex""
```

> 点击【阅读原文】可进入该命令的 github 项目。