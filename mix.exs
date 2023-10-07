defmodule HttpWatch.MixProject do
  use Mix.Project

  def project do
    [
      app: :http_watch,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {HttpWatch.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto_sql, "~> 3.2"},
      {:postgrex, "~> 0.15"},
      {:finch, "~> 0.13"},
      {:jason, "~> 1.2"},
      {:floki, "~> 0.34.3"},
      {:parent, "~> 0.12.1"}
    ]
  end
end
