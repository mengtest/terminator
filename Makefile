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
	python tools/deploy.py . deploy

test:
	python tools/unittest.py skynet/3rd/lua/lua lualib


