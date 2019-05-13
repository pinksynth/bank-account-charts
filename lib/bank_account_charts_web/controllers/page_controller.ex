defmodule BankAccountChartsWeb.PageController do
  use BankAccountChartsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
