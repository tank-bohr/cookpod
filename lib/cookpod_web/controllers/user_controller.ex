defmodule CookpodWeb.UserController do
  use CookpodWeb, :controller

  alias Cookpod.User
  alias Cookpod.Repo

  def create(conn, %{"user" => attrs}) do
    changeset = User.changeset(%User{}, attrs)
    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user)
        |> redirect(to: Routes.page_path(conn, :index))
      {:error, changeset}
        render(conn, "new.html", changeset: changeset)
    end
  end
end
