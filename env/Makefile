# DEFAULT CONFIG
BASE_DIR=$(shell cd .. && pwd)

# IMPORT VARIABLES
include .env

# RUN MAVEN
run-mvn:
	docker run -it --rm --name maven \
		-v "$(BASE_DIR)/app/maven/modules/$(MODULE_NAME)":/usr/src/app \
		-v "$(BASE_DIR)/app/bin/jar":/usr/src/app/build \
		-v "$(BASE_DIR)/app/maven/resources":/root/.m2 \
		-w /usr/src/app \
		$(ENV_MAVEN) mvn $(command)

# MAVEN
mvn-clean:
	make run-mvn command="clean"
mvn-install:
	make run-mvn command="install"
mvn-clean-install:
	make run-mvn command="clean install"
mvn-dependency-resolve:
	make run-mvn command="dependency:resolve"
# IN TESTS
# mvn-generate:
# 	make run-mvn command="archetype:generate"

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