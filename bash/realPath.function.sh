
#有些系统默认不安装realpath命令,这里自己实现,shell的function返回字符中只能echo,然后调用时通过re=$(realPath 'kkk')来获得
function realPath() {
    #得到当前文件的绝对路径,()会fork一个subshell,所以,cd并不会影响parentShell的pwd
    realPath=$(cd `dirname "${1}"`; pwd)
    name=$(basename "${1}");
    
    
    if [[ "${name}" = "." || "${name}" = ".." ]];then
          name="";
    fi
 
    realPath="${realPath}/${name}"
    realPath="${realPath//\/\//\/}";
    realPath="${realPath//\/.\//\/}";
    echo "${realPath}"
    return 0;
}
