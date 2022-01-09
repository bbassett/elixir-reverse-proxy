defmodule ReverseProxy.RouterPlug do
  def init(opts), do: opts

  def call(conn, _opts) do
    conn
    |> Plug.Conn.send_resp(200, "Router UI")
    |> Plug.Conn.halt()
  end
end

defmodule ReverseProxy.DefaultPlug do
  def init(opts), do: opts

  def call(conn, _opts) do
    conn
    |> Plug.Conn.send_resp(200, "Customer Sites")
    |> Plug.Conn.halt()
  end
end
