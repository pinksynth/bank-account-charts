defmodule BankAccountCharts.Repo do
  use Ecto.Repo,
    otp_app: :bank_account_charts,
    adapter: Ecto.Adapters.Postgres
end
