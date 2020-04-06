defmodule CookpodWeb.SessionController do
  use CookpodWeb, :controller

  action_fallback :fallback
  plug :any_plug

  def show(conn, _params) do
    current_user = get_session(conn, :current_user)
    # render(conn, "show.html", current_user: current_user)
    # text(conn, conn.assigns[:from_any_plug])
    json(conn, %{status: :ok})
  end

  def new(conn, _params) do
    render(conn, "new.html", errors: %{})
  end

  def create(conn, %{"user" => user}) do
    case validate_user(user) do
      errors when map_size(errors) == 0 ->
        conn
        |> put_session(:current_user, user["name"])
        |> redirect(to: Routes.page_path(conn, :index))

      errors ->
        render(conn, "new.html", errors: errors)
    end
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:current_user)
    |> redirect(to: Routes.page_path(conn, :index))
  end

  defp validate_user(user) do
    Enum.reduce(user, %{}, fn {name, value}, acc ->
      if String.length(value) == 0, do: Map.put(acc, name, "#{name} cannot be blank"), else: acc
    end)
  end

  def fallback(conn, :ok) do
    send_resp(conn, 200, "I'm function fallback")
  end

  def any_plug(%Plug.Conn{params: _params} = conn, _opts) do
    assign(conn, :from_any_plug, :cool)
  end
end
