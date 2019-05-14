defmodule BankAccountChartsWeb.Api.TokenController do
  use BankAccountChartsWeb, :controller

  alias BankAccountCharts.Accounts.User

  def exchange_token(conn, %{"public_token" => public_token, "username" => username}) do
    {:ok,
     %{
       access_token: access_token,
       item_id: item_id
     }} = Plaid.Item.exchange_public_token(%{public_token: public_token})

    %User{}
    |> User.changeset(%{
      access_token: access_token,
      item_id: item_id,
      username: username
    })
    |> BankAccountCharts.Repo.insert!()

    conn
    |> resp(200, "")
  end
end
