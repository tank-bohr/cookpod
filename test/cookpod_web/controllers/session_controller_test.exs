defmodule SessionControllerTest do
  use CookpodWeb.ConnCase
  import Plug.Test

  test "GET /", %{conn: conn} do
    conn = conn
      |> init_test_session(%{current_user: "test-user"})
      |> get(Routes.session_path(conn, :show))
    assert html_response(conn, 200) =~ "You are logged in"
  end
end
