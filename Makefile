server:
	iex -S mix phx.server

db:
	docker-compose up -d
	mix ecto.setup
