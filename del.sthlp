{smcl}
{right:Updated time: July 20, 2021}
{* -----------------------------title------------------------------------ *}{...}
{p 0 16 2}
{bf:[W-15] del} {hline 2} Delete one or more files. You can view the source code in {browse "https://github.com/Meiting-Wang/del":github}.


{* -----------------------------Syntax------------------------------------ *}{...}
{title:Syntax}

{p 8 8 2}
{cmd:del} ["][{it:filespec}]["]


{* -----------------------------Contents------------------------------------ *}{...}
{title:Contents}

{p 4 4 2}
{help del##Description:Description}{break}
{help del##Examples:Examples}{break}
{help del##Author:Author}{break}
{help del##Also_see:Also see}{break}


{* -----------------------------Description------------------------------------ *}{...}
{marker Description}{title:Description}

{p 4 4 2}{cmd:del} means "delete" and can delete one or more specified files.{p_end}

{p 4 4 2}{cmd:del} is equivalent to an extended version of {help erase}. In other words, {cmd:del} can delete one or more specified files, report the results on the Stata interface, and store the results above in {bf:r()} for later programming use, while {help erase} can only delete one file at a time, without any report on the Stata interface and {bf:r()} return value.{p_end}

{p 4 4 2}It is worth noting that this command can only be used in version 16.0 or later.{p_end}


{* -----------------------------Examples------------------------------------ *}{...}
{marker Examples}{title:Examples}

{p 4 4 2}Delete a single file{p_end}
{p 8 10 2}. {bf:del read.tex}{p_end}
{p 8 10 2}. {bf:del "read.tex"}{p_end}
{p 8 10 2}. {bf:del ".\read.tex"}{p_end}
{p 8 10 2}. {bf:del "..\read.tex"}{p_end}
{p 8 10 2}. {bf:del "X:\exercise\Stata\del\read.tex"}{p_end}

{p 4 4 2}Delete multiple files{p_end}
{p 8 10 2}. {bf:del "read*.tex"}{p_end}
{p 8 10 2}. {bf:del ".\read*.tex"}{p_end}
{p 8 10 2}. {bf:del "..\read*.tex"}{p_end}
{p 8 10 2}. {bf:del "X:\exercise\Stata\del\read*.tex"}{p_end}

{p 4 4 2}Show the content stored in {bf:r()}{p_end}
{p 8 10 2}. {bf:del "read*.tex"}{p_end}
{p 8 10 2}. {bf:return list}{p_end}


{* -----------------------------Author------------------------------------ *}{...}
{marker Author}{title:Author}

{p 4 4 2}
Meiting Wang{break}
Institute for Economic and Social Research, Jinan University{break}
Guangzhou, China{break}
wangmeiting92@gmail.com


{* -----------------------------Also see------------------------------------ *}{...}
{marker Also_see}{title:Also see}

{space 4}{help erase}

