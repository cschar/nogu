defmodule NoguWeb.PageController do
  use NoguWeb, :controller
  alias Phoenix.LiveView


  def index(conn, _params) do
    render(conn, "index.html")

  end

  def git(conn, _params) do
    
    LiveView.Controller.live_render(conn, NoguWeb.GithubDeployView, session: %{})

  end
end
