defmodule BankAccountChartsWeb.Router do
  use BankAccountChartsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BankAccountChartsWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/:username/over_time", ChartController, :over_time
  end

  # Other scopes may use custom stacks.
  scope "/api", BankAccountChartsWeb.Api do
    pipe_through :api

    post "/exchange_token", TokenController, :exchange_token
  end
end
