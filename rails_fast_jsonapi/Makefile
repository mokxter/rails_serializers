default:
	@echo
	@echo "Makefile targets:"
	@grep -E '^[a-zA-Z_-].*?: .*?## .*$$' Makefile | sed 's#\\:#:#g' | awk 'BEGIN {FS = ": .*?## "}; {printf "\033[36m  %-20s\033[0m %s\n", $$1, $$2}'
	@echo


docker := docker-compose

build: ## Build the services
	$(docker) build

start: ## Start all services
	$(docker) up

stop: ## Stop all services
	$(docker) down
