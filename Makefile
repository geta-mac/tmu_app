run.server:
	bundle exec rails server -b 0.0.0.0

run.web:
	cd ./front_end && yarn dev

build.prod:
	rm -rf ./public && cd ./front_end && yarn build:prod && mv ./dist ../public
