defmodule FoodTruck.MixProject do
  use Mix.Project

  def project do
    [
      app: :food_truck,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env())
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  def elixirc_paths(:test), do: ["lib", "test/support"]
  def elixirc_paths(_other), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:distance, "~> 1.0"},
      {:httpoison, "~> 2.0"},
      {:jason, "~> 1.4"},
      {:mock, "~> 0.3.0", only: :test}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
