defmodule PhoenixToCsv.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_to_csv,
    adapter: Ecto.Adapters.Postgres
end
