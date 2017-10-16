default: all

REGISTRY=

.PHONY: all
all: mysql activemq

.PHONY: mysql
mysql:
	docker build -t $(REGISTRY)tba-mysql -f mysql/Dockerfile .

.PHONY: activemq
activemq:
	docker build -t $(REGISTRY)tba-activemq -f activemq/Dockerfile .
