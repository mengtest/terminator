## 介绍
terminator 是基于 [skynet](https://github.com/cloudwu/skynet) 游戏服务端开发方案.

## 编译和运行
项目支持在 Linux 和 MacOS 下编译。 
首先， 安装构建工具 cmake.

接下来，编译项目

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


## 运行测试服务
```shell
  #  启动进程, run.sh [配置名]
  ./run.sh test 
```

当前测试服务都位于 examples/service 下。 你可以直接创建新的服务


## 项目结构

```
lualib(lua库)
   bw (基于skynet上的基础库)
   		 hotfix (热更新机制)
   base(通用库，支持单元测试)
   perf(性能相关）
   test(测试相关)
service(通用服务)
luaclib(编译好的c库)
examples(测试服务)
    etc(启动配置)
    lualib(测试lib)
    service(测试服务)
    lualib-src(c库源码)
skynet(fork skynet项目，不作任何改动)
tools(各种工具)
		deploy.py (生成部署目录)
		unittest.py. (单元测试驱动)
thirdparty. (第三方依赖)
xxxxx  (创建你自己的项目)
```


## 新项目

生成你自己的项目路径   XXX ?     *TODO*

脚本， 生成模版
* 创建目录，支持 deploy, test, check。 （可以回滚?)
* 区分开各个项目
* 或者不能创建项目，只能创建svr. 部署的时刻，只部署指定服务。


## 代码规范
使用 luacheck进行代码质量检查，配置文件.luacheckrc. 

安装完 luacheck 后 （建议用 hererock + luarocks 进行安装）

```shell
   $ make check
```

## 单元测试
单元测试文件，  是以   xx_test.lua 命名的文件。 
执行单元测试

```shell
	$ make test
```

##  代码热更新
热更新机制针对开发环境，在正式环境不建议使用。 因为Lua的灵活性以及游戏逻辑的复杂，热更新很难做完毕。 正式环境， 临时修复代码， 可以用 skynet 自带的 inject 机制。

指定服务开启热更新，细节看  service/hotfix

```lua
	  # skynet.start 加入下面代码
    local hotfix_runner = require("bw.hotfix.hotfix_runner")
    # 具体需要热更新的模块， 放入这个列表里
    local modules = {"mod"}
    hotfix_runner.update_hotfix_modules(modules)
```

## 配置热更新

*TODO*



##  第三方模块
* [sds](https://github.com/antirez/sds), Redis 作者维护的，非常好用的C字符串库
* [lua-zset](https://github.com/xjdrew/lua-zset), Lua 的sorted set实现。基于Redis 的skiplist源码
* [lua-cjson](https://github.com/openresty/lua-cjson), 高性能的JSON解析器和编码器
* [lua-cmsgpack](https://github.com/antirez/lua-cmsgpack), C语言实现的msgpack解析器和编码器
* [luafilesystem](https://github.com/keplerproject/luafilesystem), lua的一个专门用来进行文件操作的库
* [lua-protobuf](https://github.com/starwing/lua-protobuf/), XLua 作者实现的PB解析库。[文档在这里](https://zhuanlan.zhihu.com/p/26014103)
* [inspect](https://github.com/kikito/inspect.lua), 可读性好的打印库


## 参考资料
* [bewater](https://github.com/zhandouxiaojiji/bewater),  skynet通用模块
* [RillServer](https://github.com/cloudfreexiao/RillServer)，skynet 游戏框架