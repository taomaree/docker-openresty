all: build

build:
	@docker build --tag=taomaree/nginx .
	
release: build
	@docker build --tag=taomaree/nginx:$(shell cat VERSION) .

debug: build
	@docker run -ti --rm -v /data:/data taomaree/nginx /bin/bash

run: build
	@docker run -ti --rm -v /data:/data taomaree/nginx