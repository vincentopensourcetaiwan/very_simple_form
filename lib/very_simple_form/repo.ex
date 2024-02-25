defmodule VerySimpleForm.Repo do
  use Ecto.Repo,
    otp_app: :very_simple_form,
    adapter: Ecto.Adapters.Postgres
end
