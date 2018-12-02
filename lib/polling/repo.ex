defmodule Polling.Repo do
  use Ecto.Repo,
    otp_app: :polling,
    adapter: Ecto.Adapters.Postgres
end
