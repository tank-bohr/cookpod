server:
	iex -S mix phx.server

db:
	docker-compose up -d
	mix ecto.setup

build:
	docker build -t cookpod .

prod:
	docker run --rm \
		-e COOKPOD_HOST=localhost  \
		-e PORT=4000  \
		-e SECRET_KEY_BASE=+Y0dQezR7SDPae0DuQrQEQZUFXSIhnfkKPtMe+g+1uEVzx3SKjegZG5e+LxEvoUV \
		-e LIVE_VIEW_SALT=Lq24HnRq \
		-e DB_NAME=cookpod_dev \
		-e DB_USERNAME=postgres \
		-e DB_PASSWORD=postgres \
		-e DB_HOSTNAME=docker.for.mac.localhost  \
		-p 127.0.0.1:4000:4000/tcp \
		cookpod
