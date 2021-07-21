cls
cd X:\exercise\Stata\del
pr drop _all

cap copy "X:\exercise\Stata\mas\read.tex" "read.tex"
cap copy "X:\exercise\Stata\mas\read2.tex" "read2.tex"
cap copy "X:\exercise\Stata\mas\read3.tex" "read3.tex"

del read.tex
del "read2.tex"
del ".\read3.tex"
del "X:\exercise\Stata\del\read.tex"
ret list

del "read*.tex"
del ".\read*.tex"
ret list

cap copy "X:\exercise\Stata\mas\read.tex" "..\read.tex"
cap copy "X:\exercise\Stata\mas\read2.tex" "..\read2.tex"
cap copy "X:\exercise\Stata\mas\read3.tex" "..\read3.tex"

dir ..\read*.tex
del "..\read*.tex"
ret list


github install Meiting-Wang/fn
github install Meiting-Wang/del
github install Meiting-Wang/mas

h fn
h del
h mas
