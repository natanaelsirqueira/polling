defmodule PollingWeb.PageController do
  use PollingWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
