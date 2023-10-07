defmodule HttpWatch.Repo do
  use Ecto.Repo,
    otp_app: :http_watch,
    adapter: Ecto.Adapters.Postgres
end
