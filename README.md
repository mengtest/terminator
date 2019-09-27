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
* [sds](https://github.com/antirez/sds), Redis 作者维护的，非常好用的C字符串库
* [lua-zset](https://github.com/xjdrew/lua-zset), Lua 的sorted set实现。基于Redis 的skiplist源码
* [lua-cjson](https://github.com/openresty/lua-cjson), 高性能的JSON解析器和编码器
* [lua-cmsgpack](https://github.com/antirez/lua-cmsgpack), C语言实现的msgpack解析器和编码器
* [luafilesystem](https://github.com/keplerproject/luafilesystem), lua的一个专门用来进行文件操作的库
* [lua-protobuf](https://github.com/starwing/lua-protobuf/), XLua 作者实现的PB解析库。[文档在这里](https://zhuanlan.zhihu.com/p/26014103)
* inspect, 可读性好的打印库
