defmodule CanvasClient.MixProject do
  use Mix.Project

  def project do
    [
      app: :canvas_client,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {CanvasClient.Application, []}
    ]
  end

  defp deps do
    [
      {:dialyzex, "~> 1.3.0", only: [:test, :dev]},
      {:exvcr, "~> 0.13.2", only: :test},
      {:finch, "~> 0.11.0"},
      {:nicene, "~> 0.6.0"},
      {:tesla, "~> 1.4.0"}
    ]
  end
end
