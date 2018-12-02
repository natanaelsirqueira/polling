defmodule PollingWeb.Router do
  use PollingWeb, :router

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

  scope "/", PollingWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources "/polls", PollController

    get "/polling", PollController, :polling
  end

  # Other scopes may use custom stacks.
  # scope "/api", PollingWeb do
  #   pipe_through :api
  # end
end
