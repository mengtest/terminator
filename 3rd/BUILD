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
)

gen_rule(
    name = 'copy_skiplist',
    deps = ':skiplist',
    outs = ['zset.lua'],
    cmd  = 'rsync -av 3rd/lua-zset/zset.lua $BUILD_DIR/3rd/'
)



