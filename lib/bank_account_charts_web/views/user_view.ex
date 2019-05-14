defmodule BankAccountChartsWeb.UserView do
  use BankAccountChartsWeb, :view
  alias BankAccountChartsWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      username: user.username,
      access_token: user.access_token,
      item_id: user.item_id}
  end
end
