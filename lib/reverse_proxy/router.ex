defmodule ReverseProxy.Router do
  @moduledoc """
  A Plug for routing requests to either be served
  from a set of upstream servers.
  """

  use Plug.Router

  plug :match
  plug :dispatch

  # I Switched this to work at runtime. This way I can use Heroku API
  # and configure the routes in memory, and do it with hooks, rather
  # than using configs and rebuilding the API after every change
  match _ do
    upstream = Application.get_env(:reverse_proxy, :upstreams)
    |> Map.get(conn.host)

    if upstream do
      ReverseProxy.call(conn, upstream: upstream)
    else
      conn |> send_resp(400, "Bad Request")
    end
  end
end
