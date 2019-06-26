# skynet 服务框架
参考 [bewater](https://github.com/zhandouxiaojiji/bewater), 集成了常用的Lua 库, 以及skynet 跟游戏服务相关的轮子

# 编译和运行
项目只支持在 Linux 下编译。 
首先， 安装构建工具 [blade](https://github.com/chen3feng/blade-build), 参考[这里](https://github.com/chen3feng/blade-build/blob/master/doc/zh_CN/install.md)。

接下，编译项目

```shell
    $ git clone https://github.com/samuelyao314/workspace
    $ cd workspace
    $ make

```

下一步，生成部署目录deploy

```shell
    $ make install
```

最后，复制deploy 目录到测试服务机器。尝试启动测试服务

```shell
   $ cd deploy
   $ ./run.sh test
```

如果看见日志，就表示启动成功了。

