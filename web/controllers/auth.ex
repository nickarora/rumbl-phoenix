defmodule Rumbl.Auth do
  import Plug.Conn

  def init(opts) do
    # extract the repo from options
    Keyword.fetch!(opts, :repo)
  end

  # call receives repo from init
  def call(conn, repo) do
    # if user_id exists in the session, look it up and assign it within conn
    user_id = get_session(conn, :user_id)
    user    = user_id && repo.get(Rumbl.User, user_id)
    assign(conn, :current_user, user)
  end

  def login(conn, user) do
    conn
    |> assign(:current_user, user)
    |> put_session(:user_id, user.id)
    |> configure_session(renew: true)
  end
end