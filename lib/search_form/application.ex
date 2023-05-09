defmodule SearchForm.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SearchFormWeb.Telemetry,
      # Start the Ecto repository
      SearchForm.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: SearchForm.PubSub},
      # Start Finch
      {Finch, name: SearchForm.Finch},
      # Start the Endpoint (http/https)
      SearchFormWeb.Endpoint
      # Start a worker by calling: SearchForm.Worker.start_link(arg)
      # {SearchForm.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SearchForm.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SearchFormWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
