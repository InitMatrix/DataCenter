.PHONY: base clear build start server destroy help
IMAGE = imager
## 初始化系统
base:
	pip install -r requirements.txt
	python base.py

## 清除冗余镜像、容器等
clear:
	docker system prune

## 构建引擎基础镜像
build:
	echo "hello ,this is build"
	python build.py

start:
	docker rm -f sync-block-bsc && docker run -itd --name sync-block-bsc -e NETWORK="bsc" -e ORIGIN=99887766 -e INTERVAL=3 -e NODE="https://bsc.test.com" -e RELOAD=False sync-block && docker logs -f sync-block-bsc
## 启动rpc服务
server:
	echo "hello,this is server,run it"
	docker run -itd --name server -e HOST="0.0.0.0" -e PORT=9005 -v /var/run/docker.sock:/var/run/docker.sock -v /usr/bin/docker:/usr/bin/docker server
destroy:
	echo "禁止执行!!!!"
	#docker rm -f center_redis
	#docker rm -f center_pg
	#docker volume remove v_center_pg
	#docker volume remove v_center_redis
	#docker network rm net_center

## Show help
help:
	@echo ''
	@echo 'Usage:'
	@echo ' make target'
	@echo ''
	@echo 'Targets:'
	@awk '/^[a-zA-Z\-\_0-9]+:/ { \
	helpMessage = match(lastLine, /^## (.*)/); \
	if (helpMessage) { \
	helpCommand = substr($$1, 0, index($$1, ":")-1); \
	helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
	printf " %-20s %s\n", helpCommand, helpMessage; \
	} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)