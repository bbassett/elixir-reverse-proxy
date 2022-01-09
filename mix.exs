defmodule ReverseProxy.Mixfile do
  use Mix.Project

  def project do
    [app: :reverse_proxy,
     version: "0.3.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     name: "ReverseProxy",
     description: description(),
     package: package(),
     docs: [extras: ["README.md"],
            main: "readme"],
     test_coverage: [tool: ExCoveralls]]
  end

  def application do
    [applications: [:logger, :plug, :cowboy, :httpoison],
     mod: {ReverseProxy, []}]
  end

  defp deps do
    [{:plug, "~> 1.12"},
     {:plug_cowboy, "~> 2.0"},
     {:cowboy, "~> 2.9"},
     {:httpoison, "~> 1.8"},

     {:earmark, "~> 1.4", only: :dev},
     {:ex_doc, "~> 0.26", only: :dev},
     {:rl, github: "simplecastapps/rl", only: :dev},

     {:credo, "~> 1.6", only: [:dev, :test]},
     {:excoveralls, "~> 0.14.4", only: :test},
     {:dialyze, "~> 0.2.1", only: :test}]
  end

  defp description do
    """
    A Plug based reverse proxy server.
    """
  end

  defp package do
    %{maintainers: ["Shane Logsdon"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/slogsdon/elixir-reverse-proxy"}}
  end
end
