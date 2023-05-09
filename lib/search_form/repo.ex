defmodule SearchForm.Repo do
  use Ecto.Repo,
    otp_app: :search_form,
    adapter: Ecto.Adapters.Postgres
end
