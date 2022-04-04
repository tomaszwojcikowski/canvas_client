defmodule CanvasClient.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Finch, name: CanvasClientFinch}
    ]

    opts = [strategy: :one_for_one, name: CanvasClient.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
