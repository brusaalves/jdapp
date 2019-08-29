# DEFAULT CONFIG
BASE_DIR=$(shell pwd)

# IMPORT VARIABLES
include .env

# RUN MAVEN
run-mvn:
	make run-docker command="run --rm maven mvn $(command)"

# MAVEN
mvn-clean:
	make run-mvn command="clean"
mvn-install:
	make run-mvn command="install"
mvn-clean-install:
	make run-mvn command="clean install"
mvn-dependency-resolve:
	make run-mvn command="dependency:resolve"
mvn-package:
	make run-mvn command="package"

# RUN DOCKER
run-docker:
	docker-compose $(command)

# DOCKER
docker-up:
	make mvn-clean-install && \
	make run-docker command="up -d"
docker-down:
	make mvn-clean && \
	make run-docker command="down"
docker-logs:
	make run-docker command="logs -f"
docker-ps:
	make run-docker command="ps"

# START AND STOP APPLICATION
start:
	make docker-up
stop:
	make docker-down