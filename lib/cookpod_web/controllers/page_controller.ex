defmodule CookpodWeb.PageController do
  use CookpodWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def terms(conn, _params) do
    render(conn, "terms.html", foo: "Я переменная")
  end

  def hard_work(conn, _params) do
    id = gen_id()

    Task.async(fn ->
      Process.sleep(5000)
      CookpodWeb.Endpoint.broadcast!("demo:#{id}", "done", %{})
    end)

    render(conn, "hard_work.html", id: id)
  end

  defp gen_id() do
    7
    |> :crypto.strong_rand_bytes()
    |> Base.encode16()
    |> String.downcase()
  end
end
