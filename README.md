# skynet 服务框架
参考 [bewater](https://github.com/zhandouxiaojiji/bewater), 集成了常用的Lua 库, 以及skynet 跟游戏服务相关的轮子

# 编译和运行

项目支持在 Linux 和 MacOS 下编译。 
首先， 安装构建工具 cmake.

接下，编译项目

```shell
    $ git clone https://github.com/samuelyao314/workspace
    $ cd workspace
    $ make

```

下一步，生成部署目录deploy

```shell
    $ make dev
```

最后，复制deploy 目录到测试服务机器。尝试启动测试服务

```shell
   $ cd deploy
   $ ./run.sh test
```

如果看见日志，就表示启动成功了。


# 第三方模块
* [sds](https://github.com/antirez/sds), C 动态字符串库。被应用在Redis 里。
* [lua-zset](https://github.com/xjdrew/lua-zset), Lua 的sorted set实现。基于Redis 的skiplist源码
* lua-cjson, Lua 的json 解析库
* lua-cmsgpack，Lua 的messagepack 解析库， Redis 作者实现。
* argparse, Lua 的命令行参数解析库
* inspect, 可读性好的打印库
