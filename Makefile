.PHONY:all skynet clean dev build

all: skynet build

CUR_OS="linux"
ifeq ($(shell uname), Darwin)
	CUR_OS="macosx"
endif


SKYNET_MAKEFILE=skynet/Makefile
$(SKYNET_MAKEFILE):
	git submodule update --init
skynet: | $(SKYNET_MAKEFILE)
	cd skynet && $(MAKE) $(CUR_OS)

build:
	cd build && cmake .. && make

clean:
	cd build && rm -rf *
	rm -rf deploy
	cd skynet && make clean


INSTALL_DIR = deploy/
INSTALL_SKYNET = ${INSTALL_DIR}/skynet
BUILD_THIRD_PARTY = build/thirdparty
BUILD_EXAMPLE_CLIB = build/examples/luaclib

dev:
	rm -rf $(INSTALL_DIR)/*
	mkdir -p $(INSTALL_SKYNET)
	cp skynet/skynet $(INSTALL_SKYNET)
	cp skynet/3rd/lua/lua $(INSTALL_SKYNET)
	cp skynet/3rd/lua/luac $(INSTALL_SKYNET)
	cp -r skynet/lualib $(INSTALL_SKYNET)
	cp -r skynet/luaclib $(INSTALL_SKYNET)
	cp -r skynet/service $(INSTALL_SKYNET)
	cp -r skynet/cservice $(INSTALL_SKYNET)
	mkdir $(INSTALL_DIR)/lualib $(INSTALL_DIR)/luaclib $(INSTALL_DIR)/service
	cp $(BUILD_THIRD_PARTY)/*.lua $(INSTALL_DIR)/lualib/
	cp $(BUILD_THIRD_PARTY)/*.so $(INSTALL_DIR)/luaclib/
	cp ${BUILD_EXAMPLE_CLIB}/*.so ${INSTALL_DIR}/luaclib/
	cp -r examples/service $(INSTALL_DIR)/
	cp -r examples/etc $(INSTALL_DIR)/
	cp -r examples/lualib $(INSTALL_DIR)/
	cp  examples/run.sh $(INSTALL_DIR)/
	cp -r lualib/* $(INSTALL_DIR)/lualib


