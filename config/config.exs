import Config

# alias HttpWatch.{Repo, Notify, Courier, Oracle, Poet}; alias HttpWatch.Repo.{Endpoint, Response}

config :http_watch,
  ecto_repos: [HttpWatch.Repo]

config :http_watch, HttpWatch.Repo,
  database: "http_watch_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :http_watch, HttpWatch.Notify.Discord,
  dev_discord: "https://discord.com/api/webhooks/1157233913882738729/4XtJzd8RYqY6GNnPVO18T3suZzvvwN3e0nmydiTFBsGE_tT0NIPd4bSzhIfxCLwBDGuK"
