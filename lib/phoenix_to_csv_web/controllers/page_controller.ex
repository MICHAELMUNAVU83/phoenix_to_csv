defmodule PhoenixToCsvWeb.PageController do
  use PhoenixToCsvWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
