defmodule RustPhoenix.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      RustPhoenix.Repo,
      # Start the Telemetry supervisor
      RustPhoenixWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: RustPhoenix.PubSub},
      # Start the Endpoint (http/https)
      RustPhoenixWeb.Endpoint
      # Start a worker by calling: RustPhoenix.Worker.start_link(arg)
      # {RustPhoenix.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RustPhoenix.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    RustPhoenixWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
