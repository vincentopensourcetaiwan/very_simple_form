defmodule VerySimpleForm.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      VerySimpleFormWeb.Telemetry,
      VerySimpleForm.Repo,
      {DNSCluster, query: Application.get_env(:very_simple_form, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: VerySimpleForm.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: VerySimpleForm.Finch},
      # Start a worker by calling: VerySimpleForm.Worker.start_link(arg)
      # {VerySimpleForm.Worker, arg},
      # Start to serve requests, typically the last entry
      VerySimpleFormWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: VerySimpleForm.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    VerySimpleFormWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
