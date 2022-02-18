defmodule ReverseProxy do
  @moduledoc """
  A Plug based, reverse proxy server.

  `ReverseProxy` can act as a standalone service or as part of a plug
  pipeline in an existing application.

  From [Wikipedia](https://wikipedia.org/wiki/Reverse_proxy):

  > In computer networks, a reverse proxy is a type of proxy server
  > that retrieves resources on behalf of a client from one or more
  > servers. These resources are then returned to the client as
  > though they originated from the proxy server itself. While a
  > forward proxy acts as an intermediary for its associated clients
  > to contact any server, a reverse proxy acts as an intermediary
  > for its associated servers to be contacted by any client.
  """

  use Application

  def init(opts), do: opts

  def call(conn, opts) do
    ReverseProxy.Runner.retrieve(conn, opts[:upstream])
  end

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    cowboy_opts = [
      scheme: :http,
      plug: ReverseProxy.Router,
      options: [port: (System.get_env("PORT") || "4000") |> String.to_integer()]
    ]

    children = [{Plug.Cowboy, cowboy_opts}]

    opts = [strategy: :one_for_one, name: ReverseProxy.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
