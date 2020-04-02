defmodule CookpodWeb.PageController do
  use CookpodWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def terms(conn, _params) do
    conn
    |> render("terms.html", foo: "Я переменная")
  end
end
