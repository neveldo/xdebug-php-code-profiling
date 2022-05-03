GROUP_ID = $(shell id -g)
USER_ID = $(shell id -u)

DEFAULT_GOAL := help

help:
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-27s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: build
build: stop ## Build docker images
	docker-compose build --build-arg userid=$(USER_ID) --build-arg groupid=$(GROUP_ID)

.PHONY: init
init: run ## Initialize the Symfony application
	docker-compose exec -T codeprofiling-php-fpm bash -c "symfony new app --webapp"

.PHONY: run
run: ## Run the application
	docker-compose up -d

.PHONY: stop
stop: ## Stop docker containers
	docker-compose down

.PHONY: bash
bash: ## run bash into the php-fpm container
	docker exec -it codeprofiling-php-fpm bash