* Description: Delete one or more files
* Author: Meiting Wang, doctor, Institute for Economic and Social Research, Jinan University
* Email: wangmeiting92@gmail.com
* Updated on July 20, 2021



program define del, rclass
version 16.0

syntax anything(id="Filenames format setting")
/*
***编程注意事项
- anything 会将双引号传递下来
*/


*----------------前期程序-------------------
*初步提取dirname和pattern
local anything = ustrregexra(`"`anything'"',`"(^"\s*)|(\s*"$)"',"") //去除anything中的双引号和前端和末尾多余的空格

if ~ustrregexm("`anything'","(/)|(\\)") {
	local dirname ".\"
	local write_dirname ""
	local pattern "`anything'"
}
else if ustrregexm("`anything'","^([^/\\].*[/\\])([^/\\]+)$") {
	local dirname = ustrregexs(1) //最后带有/或\
	local write_dirname = ustrregexs(1) //最后带有/或\
	local pattern = ustrregexs(2)
}
else {
	dis "{error:del syntax error}"
	error 9999
}


*具体化 dirname
if ustrregexm("`dirname'","(^\.\.)([/\\].*)") { //输入时 .. 开头的必定是以 ../ 或 ..\ 开头
	local temp1 = ustrregexs(2)
	local temp2 = ustrregexra(`"`c(pwd)'"',"\\[^\\]+$","")
	local dirname `"`temp2'`temp1'"'
} //这里的 dirname 最后带有/或\
else if ustrregexm("`dirname'","(^\.)([/\\].*)") {
	local temp1 = ustrregexs(2)
	local dirname `"`c(pwd)'`temp1'"'
} //这里的 dirname 最后带有/或\

local fix_bug_dirname = ustrregexra("`dirname'","(\\)$","\\\\") //便于后面生成 raw_filename1-raw_filename...(解决bug)

/*
- 至此, dirname 为操作文件所在的完整路径, 末尾一定为 / 或 \
- write_dirname 为操作文件所在的手写路径(可能是相对路径，也可能为空)
- pattern 为文件格式，比如可能为 read*.tex
*/


*-------------------主程序--------------------------
*生成带有完整路径的 raw_filename1-raw_filename...
local filename_str: dir `"`dirname'"' files `"`pattern'"', respectcase

local i = 0
foreach s of local filename_str {
	local i = `i' + 1
	local raw_filename`i' "`fix_bug_dirname'`s'"
}
local files_num = `i'

*删除带有完整路径的 raw_filename1-raw_filename...
forvalues i = 1/`files_num' {
	erase "`raw_filename`i''"
}


*---------------------结果的输出与返回值----------------------
dis _n as text `"location dirname: {result:`dirname'}"'
if `"`filename_str'"' != "" {
	dis as text `"    delete files: {result:`filename_str'}"'
}
else {
	dis as text `"    delete files: {result:No files found}"'
}

return local delete_files `"`filename_str'"'
return local delete_files_num = `files_num'
return local delete_pattern `"`pattern'"'
return local write_dirname `"`write_dirname'"'
return local location_dirname `"`dirname'"'

end
