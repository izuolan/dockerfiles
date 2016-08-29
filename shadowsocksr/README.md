现在比较主流的方案可能就是SSR+kcptun了,基本上都能流畅看1080P的youtube了。下面讲述如何快速搭建服务端和客户端(主要针对osx和unix,win上有成熟的GUI方案)

## 服务端
SSR一键安装包(引用自https://www.91yun.org/archives/2079)
```
wget -N --no-check-certificate https://raw.githubusercontent.com/91yun/shadowsocks_install/master/shadowsocksR.sh && bash shadowsocksR.sh
```
#### [kcptun](https://github.com/xtaci/kcptun)
`https://github.com/xtaci/kcptun/releases`下载适合自己系统的最新版本`tar -xf`解压得到server_linux_amd64.执行服务端.摘录文档如下
```
服务器: ./server_linux_amd64 -t "127.0.0.1:8388" -l ":4000" -mode fast2  // 转发到服务器的本地8388端口
客户端: ./client_darwin_amd64 -r "服务器IP地址:4000" -l ":8388" -mode fast2    // 监听客户端的本地8388端口
注: 服务器端需要有服务监听8388端口
```
!!! 很重要的就是端口。可能参数填写的比较多一不小心容易被混淆，kcptun作为后台运行程序可以简单的
`nohup command &`

## 使用docker
我个人比较喜欢用docker,想想优势可能有这2个方面。docker logs看日志比较方便.docker的开机启动项也比较友好，特别是相对于osx的plist.另外docker官方支持最低版本为3.1。openvz的内核绝大多数都是2.6.32,所以你的如果购买的是openvz的vps的话那么docker在服务端是无法使用的.强烈建议在电脑客户端使用docker
快速使用步骤

1.  根据[官方文档](https://docs.docker.com)安装docker和docker-compose，在本机设置dockerhub镜像源,推荐使用中科大https://docker.mirrors.ustc.edu.cn ,[镜像设置帮助文档](https://lug.ustc.edu.cn/wiki/mirrors/help/docker)
2. git clone本gist修改ip及端口(修改成自己的ip，密码以及喜欢的端口),需修改ssr.json,server_docker_compose.yaml,client_docker_compose.yaml
3. 服务端在server_docker_compose.yaml目录执行
```
docker-compose -f server_docker_compose.yaml up --build -d
```
4. 客户端在client_docker_compose.yaml目录执行
```
docker-compose -f client_docker_compose.yaml up --build -d
```
如此就搞定了一个ssr+kcptun的socks5代理了

## 额外
1. socks5代理虽好，可是有时候我们会需要http代理.这时果断装上privoxy。最简单的设置如下

    ```
    #osx为例
    brew install privoxy(brew info privoxy)
    echo -n forward-socks5 / localhost:1083 . >> /usr/local/etc/privoxy/config
    # 这样我们就有了一个端口为8118(privoxy默认)的http代理了，转发到我们搭建好的socks5代理
    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.privoxy.plist
    ```

2. unix的世界里http_proxy这种环境变量是相当好用靠谱的,比如curl,wget,httpie超级多的命令行工具都认这种环境变量。可是如果你要是写死。。。。。那么当你不需要代理的时候又会悲催了,写个shell辅助下(switch proxy)sp是设置代理sp -是取消环境变量

    ```
    function sp(){
    if [ -n "$1" ];
    then
        echo "unset proxy"
        unset {http,https,ftp}_proxy
        unset {HTTP,HTTPS,FTP}_PROXY
    else
        echo "set proxy";
        export {http,https,ftp}_proxy="http://127.0.0.1:8118"
        export {HTTP,HTTPS,FTP}_PROXY="http://127.0.0.1:8118"
    fi
    }
    ```

3. 对于日常浏览器用pac进行分流没啥好说的,我本人使用chrome+SwitchyOmega配合这个pac规则[https://raw.githubusercontent.com/calfzhou/autoproxy-gfwlist/master/gfwlist.txt](https://raw.githubusercontent.com/calfzhou/autoproxy-gfwlist/master/gfwlist.txt)
4. 如果你一心想使用safari,像GUI那样设置pac或者全局socket.可以用以下shell脚本。ss设置pac,ss加任意字符设置成全局socks5,ss c取消代理设置.注意，因为networksetup需要root权限。执行sudo visudo -f /etc/sudoers加入`your_name ALL=(root) NOPASSWD: /usr/sbin/networksetup`

    ```
    function ss(){
        case $1 in
            c|C)
            echo "clean proxy"
            sudo networksetup -setautoproxyurl "Wi-Fi" " "
            sudo networksetup -setautoproxystate "Wi-Fi" off
            sudo networksetup -setsocksfirewallproxy "Wi-Fi" "" ""
            sudo networksetup -setsocksfirewallproxystate "Wi-Fi" off
            ;;
            "")
            echo "pac";
            sudo networksetup -setsocksfirewallproxy "Wi-Fi" "" ""
            sudo networksetup -setsocksfirewallproxystate "Wi-Fi" off
            sudo networksetup -setautoproxyurl "Wi-Fi" "http://127.0.0.1:1088/proxy.pac"
            ;;
            *)
            echo "global socks5 proxy"
            sudo networksetup -setautoproxyurl "Wi-Fi" " "
            sudo networksetup -setautoproxystate "Wi-Fi" off
            sudo networksetup -setsocksfirewallproxy "Wi-Fi" '127.0.0.1' '1085'
        esac
    }
    ```

5. kcptun现在还不是特别成熟,有可能会发生突然断流的现象,当你觉得不耐烦的时候,重启一下容器可能是个不错的选择-_-`alias dr='docker-compose -f /abs_path/client_docker_compose.yaml restart'`
6. kcptun对不同的网络需要自己进行一些调试才会取得很好的效果,最差的情况有可能会出现套上kcptun比单独使用ssr速度糟糕的情况,[查看讨论:手动参数设定探讨](https://github.com/xtaci/kcptun/issues/137)
7. 如果你有迅雷快鸟的会员,可以验证下是否能对你的宽带进行加速。如果能，那么请用[Xunlei-Fastdick](https://github.com/fffonion/Xunlei-Fastdick)`docker run -d --name=xunlei-fastdick --restart=always -e XUNLEI_UID=<uid> -e XUNLEI_PASSWD=<uid> flier/xunlei-fastdick`
8. win目前没有kcptun的客户端,脚本参照http://k162.space/kcptun/
9. 如果有任何建议或疑问请留言~~