defmodule RoomieApi.SessionView do
  use RoomieApi.Web, :view

  def render("show.json", %{session: session}) do
    %{data: render_one(session, RoomieApi.SessionView, "session.json")}
  end

  def render("session.json", %{session: session}) do
    %{token: session.token}
  end

  def render("error.json", _anything) do
    %{errors: "failed to authenticate"}
  end
end
