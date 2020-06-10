# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :rust_phoenix,
  ecto_repos: [RustPhoenix.Repo]

# Configures the endpoint
config :rust_phoenix, RustPhoenixWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "JZRRh+2sPOo/SgZEfH3pHCAN9ohKu9i6fUYeNXty0YH53hNtlPRnipEsN7YKriF6",
  render_errors: [view: RustPhoenixWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: RustPhoenix.PubSub,
  live_view: [signing_salt: "G37njBys"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :mime, :types, %{"application/wasm" => ["wasm"]}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
