use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :bank_account_charts, BankAccountChartsWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :bank_account_charts, BankAccountCharts.Repo,
  username: "postgres",
  password: "postgres",
  database: "bank_account_charts_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
