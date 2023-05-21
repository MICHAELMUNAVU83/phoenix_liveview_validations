defmodule PhoenixLiveviewValidationsWeb.PageController do
  use PhoenixLiveviewValidationsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
