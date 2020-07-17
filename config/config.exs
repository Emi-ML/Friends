# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :friends,
  ecto_repos: [Friends.Repo]

# Configures the endpoint
config :friends, FriendsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vV4aaHAcMYRtpCnA0pw5+oU1Q4N/lnWR+RnjOlj6pa5HdiYDjA82dU2TcfQJN8LM",
  render_errors: [view: FriendsWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Friends.PubSub,
  live_view: [signing_salt: "jQdbeLwh"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
