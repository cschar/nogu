defmodule Nogu.Repo do
  use Ecto.Repo,
    otp_app: :nogu,
    adapter: Ecto.Adapters.Postgres
end
