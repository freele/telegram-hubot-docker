COMPOSE_DEV := docker-compose -f docker-compose.yml -f docker-compose-dev.yml
COMPOSE_PROD := docker-compose -f docker-compose.yml -f docker-compose-prod.yml

up: 
	$(COMPOSE_DEV) up

up-prod: 
	$(COMPOSE_PROD) up

upd-prod: 
	$(COMPOSE_PROD) up -d

build:
	docker build -t makeomatic/hubot-ci .

clean:
	$(COMPOSE_DEV) stop
	$(COMPOSE_DEV) rm -f

clean-all:
	docker stop $$(docker ps -aq)
	docker rm $$(docker ps -aq)

# eval "$(docker-machine env fth-ci)"
# eval "$(docker-machine env -u)"

send:



deploy-staging:
	docker-machine create \
	--driver digitalocean \
	--digitalocean-region ams2 \
	--digitalocean-access-token {TOKEN} \
	--digitalocean-ssh-key-fingerprint {KEYS FINGERPRINT} \
	fth-ci


.PHONY: up up-prod upd-prod debug build clean deploy-staging clean-all start-machine send
