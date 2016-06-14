defmodule Rumbl.UserController do
  use Rumbl.Web, :controller

  def index(conn, _params) do
    # users = Repo.all(Rumbl.User)
    users = []
    render conn, "index.html", users: users
  end

  def show(conn, %{"id" => id}) do
    # user = Repo.get(Rumbl.User, id)
    user = %{id: "1", name: "José", username: "josevalim", password: "elixir"}
    render conn, "show.html", user: user
  end
end