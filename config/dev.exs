import Config

config :rl,
  "{apps,lib,config}/**/*.{erl,ex,exs,eex,xrl,yrl,hrl}": Rl.Watcher.CompileFormat,
  "mix.exs": Rl.Watcher.Compile,
  "{apps,lib,config,test}/**/*.{erl,ex,exs,eex,xrl,yrl,hrl}": Rl.Watcher.Nothing

config :reverse_proxy,
  upstreams: %{
    # You could add foobar.localhost to /etc/hosts to test this
    "simplecast.local" => ["http://www.example.com"],
    "www.simplecast.local" => ["http://www.example.com"],
    "one.simplecast.local" => ["http://localhost:4001"],
    "two.simplecast.local" => ["http://localhost:4002"],
    "router.simplecast.local" => {ReverseProxy.RouterPlug, []},
  }