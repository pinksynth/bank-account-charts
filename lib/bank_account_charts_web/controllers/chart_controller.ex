defmodule BankAccountChartsWeb.ChartController do
  use BankAccountChartsWeb, :controller
  alias BankAccountCharts.Repo
  alias BankAccountCharts.Accounts.User

  def over_time(conn, %{"username" => username}) do
    %{access_token: access_token} = Repo.get_by!(User, username: username)

    two_years_in_secs = 60 * 60 * 24 * 365
    end_date = NaiveDateTime.utc_now() |> NaiveDateTime.to_date()

    start_date =
      NaiveDateTime.utc_now()
      |> NaiveDateTime.add(two_years_in_secs * -1, :second)
      |> NaiveDateTime.to_date()

    {:ok, transactions} =
      Plaid.Transactions.get(%{
        access_token: access_token,
        start_date: "#{start_date}",
        end_date: "#{end_date}",
        options: %{
          count: 500
        }
      })

    {:ok, categories} = Plaid.Categories.get()

    result = %{
      categories: categories,
      transactions: transactions
    }

    render(conn, "over_time.html", obj: Poison.encode!(result))
  end
end
