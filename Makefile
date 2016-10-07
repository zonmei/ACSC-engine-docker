all: engine-base.dummy
engine-deps.dummy:
	sudo /bin/sh -c "docker build -t engine-deps engine-deps" && touch engine-deps.dummy
engine-base.dummy: engine-deps.dummy
	sudo docker build -t engine-base engine && touch engine-base.dummy
