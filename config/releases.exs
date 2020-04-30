import Config

host = System.fetch_env!("COOKPOD_HOST")
port = System.fetch_env!("PORT") |> String.to_integer()
secret_key_base = System.fetch_env!("SECRET_KEY_BASE")
live_view_salt = System.fetch_env!("LIVE_VIEW_SALT")

db_name = System.fetch_env!("DB_NAME")
db_username = System.fetch_env!("DB_USERNAME")
db_password = System.fetch_env!("DB_PASSWORD")
db_hostname = System.fetch_env!("DB_HOSTNAME")
db_pool_size = System.get_env("DB_POOL_SIZE", "15") |> String.to_integer()

config :cookpod, CookpodWeb.Endpoint,
  http: [:inet6, port: port],
  url: [host: host, port: port],
  cache_static_manifest: "priv/static/cache_manifest.json",
  secret_key_base: secret_key_base,
  live_view: [signing_salt: live_view_salt],
  server: true

config :cookpod, Cookpod.Repo,
  username: db_username,
  password: db_password,
  database: db_name,
  hostname: db_hostname,
  pool_size: db_pool_size
