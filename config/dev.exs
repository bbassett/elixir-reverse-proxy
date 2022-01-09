import Config

config :rl,
  "{apps,lib,config}/**/*.{erl,ex,exs,eex,xrl,yrl,hrl}": Rl.Watcher.CompileFormat,
  "mix.exs": Rl.Watcher.Compile,
  "{apps,lib,config,test}/**/*.{erl,ex,exs,eex,xrl,yrl,hrl}": Rl.Watcher.Nothing
