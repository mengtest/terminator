.PHONY:all skynet clean install

all: skynet build


SKYNET_MAKEFILE=skynet/Makefile
$(SKYNET_MAKEFILE):
	git submodule update --init

skynet: | $(SKYNET_MAKEFILE)
	cd skynet && $(MAKE) linux


build:
	blade build -p debug ... --verbose

clean:
	rm -rf build64_* blade-bin
	cd skynet && make clean


INSTALL_DIR = deploy/
INSTALL_SKYNET = ${INSTALL_DIR}/skynet
THIRD_PARTY_DIR = build64_debug/thirdparty

install:
	rm -rf $(INSTALL_DIR)/*
	mkdir $(INSTALL_SKYNET)
	cp skynet/skynet $(INSTALL_SKYNET)
	cp skynet/3rd/lua/lua $(INSTALL_SKYNET)
	cp skynet/3rd/lua/luac $(INSTALL_SKYNET)
	cp -r skynet/lualib $(INSTALL_SKYNET)
	cp -r skynet/luaclib $(INSTALL_SKYNET)
	cp -r skynet/service $(INSTALL_SKYNET)
	cp -r skynet/cservice $(INSTALL_SKYNET)
	mkdir $(INSTALL_DIR)/lualib $(INSTALL_DIR)/luaclib $(INSTALL_DIR)/service
	cp $(THIRD_PARTY_DIR)/*.lua $(INSTALL_DIR)/lualib/
	cp $(THIRD_PARTY_DIR)/*.so $(INSTALL_DIR)/luaclib/
	cp -r examples/* $(INSTALL_DIR)
	cp -r lualib/* $(INSTALL_DIR)/lualib


