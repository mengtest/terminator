# https://github.com/antirez/sds
cc_library (
    name='sds',
    srcs=['sds/sds.c'],
    link_all_symbols=False
)

cc_binary (
    name = 'sds_test',
    srcs=['sds/sds.c'],
    defs=['SDS_TEST_MAIN'],
    extra_cppflags = ['-Wno-sign-compare'],
)

# https://github.com/xjdrew/lua-zset
cc_plugin (
    name = 'skiplist',
    srcs = [
        'lua-zset/lua-skiplist.c',
        'lua-zset/skiplist.c',
    ],
    incs=['../skynet/3rd/lua/'],
    prefix = "",
    extra_cppflags = ['-Wno-float-equal'],
)

gen_rule(
    name = 'copy_skiplist',
    deps = ':skiplist',
    outs = ['zset.lua'],
    cmd  = 'rsync -av thirdparty/lua-zset/zset.lua $BUILD_DIR/thirdparty/'
)

# https://github.com/openresty/lua-cjson/
cc_plugin (
    name = 'cjson',
    srcs = [
        'lua-cjson/lua_cjson.c',
        'lua-cjson/strbuf.c',
        'lua-cjson/fpconv.c',
    ],
    incs=['../skynet/3rd/lua/'],
    prefix = "",
    extra_cppflags = ['-Wno-implicit-function-declaration', '-Wno-format-nonliteral'],
)

# https://github.com/samuelyao314/lua-cmsgpack
cc_plugin (
    name = 'cmsgpack',
    srcs = [
        'lua-cmsgpack/lua_cmsgpack.c',
        'lua-cmsgpack/compat-5.2.c',
    ],
    incs=['../skynet/3rd/lua/'],
    prefix = "",
    extra_cppflags = ['-Wno-sign-compare'],
)





