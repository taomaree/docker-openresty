all: build

init:
	wget -c http://res.atrmoney.com/pub/luajit_2.1.20150622_Ubuntu14.04_amd64.deb
	wget -c http://res.atrmoney.com/pub/openresty_1.9.3.1_Ubuntu14.04_amd64.deb

build:  
	@docker build --tag=taomaree/openresty .
	
release: build
	@docker build --tag=taomaree/openresty:$(shell cat VERSION) .

debug: build
	@docker run -ti --rm -v /data:/data taomaree/openresty /bin/bash

run: build
	@docker run -t --rm -v /data:/data taomaree/openresty
