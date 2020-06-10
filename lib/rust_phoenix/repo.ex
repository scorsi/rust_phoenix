defmodule RustPhoenix.Repo do
  use Ecto.Repo,
    otp_app: :rust_phoenix,
    adapter: Ecto.Adapters.Postgres
end
