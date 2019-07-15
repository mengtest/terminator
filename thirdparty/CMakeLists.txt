# https://github.com/antirez/sds
set (SRC_SDS sds/sds.c)
add_library(sds ${SRC_SDS})

# https://github.com/xjdrew/lua-zset
aux_source_directory(lua-zset/ SRC_SKIPLIST)
add_lua_library(skiplist ${SRC_SKIPLIST})
file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/lua-zset/zset.lua
     DESTINATION ${CMAKE_CURRENT_BINARY_DIR})

# https://github.com/openresty/lua-cjson/
set(SRC_CJSON lua-cjson/lua_cjson.c lua-cjson/strbuf.c lua-cjson/fpconv.c)
add_lua_library(cjson ${SRC_CJSON})

# https://github.com/samuelyao314/lua-cmsgpack
aux_source_directory(lua-cmsgpack/ SRC_MSGPACK)
add_lua_library(cmsgpack ${SRC_MSGPACK})

# https://github.com/keplerproject/luafilesystem/
aux_source_directory(luafilesystem/src SRC_LFS)
add_lua_library(lfs ${SRC_LFS})

# https://github.com/kikito/inspect.lua
file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/inspect/inspect.lua
     DESTINATION ${CMAKE_CURRENT_BINARY_DIR})

# https://github.com/mpeterv/argparse
file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/argparse/src/argparse.lua
     DESTINATION ${CMAKE_CURRENT_BINARY_DIR})