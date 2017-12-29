defmodule RoomieApi.UserView do
  use RoomieApi.Web, :view

  def render("show.json", %{user: user}) do
    %{data: render_one(user, RoomieApi.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email}
  end
end
