# DEFAULT CONFIG
BASE_DIR=$(shell pwd)

# IMPORT VARIABLES
include docker/.env

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
	cd docker && docker-compose $(command)

# DOCKER
docker-up:
	make run-docker command="up -d"
docker-down:
	make run-docker command="down"
docker-logs:
	make run-docker command="logs -f"
docker-ps:
	make run-docker command="ps"

# START AND STOP APPLICATION
start:
	make mvn-clean-install && \
	make docker-up
status:
	make docker-ps
logs:
	make docker-logs
stop:
	make mvn-clean && \
	make docker-down