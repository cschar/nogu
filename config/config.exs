# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :nogu,
  ecto_repos: [Nogu.Repo]

# Configures the endpoint
config :nogu, NoguWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ma9DVCP3lkc2MFbfHGcU9mpT1aUWxE5ntTKvmTtN0dcMXzT2krdpz/erKeyc0PAu",
  render_errors: [view: NoguWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Nogu.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"


## LiveView
config :nogu, NoguWeb.Endpoint,
   live_view: [
     signing_salt: "REcUIGaCq6ZnnVtNYU7jyBv5yZuvkYmZ"  # replace in prod
   ]