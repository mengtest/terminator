cache = true
std = 'max'
ignore = {
    "_", -- 忽略 _ 变量，我们用它来表示没有用到的变量
    "6..", -- 忽略格式上的warning
}

globals = {
    "skynet",
}


-- 不检查来自第三方的代码库
exclude_files = {
    "skynet",
	"3rd",
}
