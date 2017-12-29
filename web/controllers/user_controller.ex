defmodule RoomieApi.UserController do
  use RoomieApi.Web, :controller

  alias RoomieApi.User

  plug :scrub_params, "user" when action in [:create]

  def index(conn, _params) do
    users = Repo.all(RoomieApi.User)
    json conn, users
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.registration_changeset(%User{}, user_params)

    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> render("show.json", user: user)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(RoomieApi.ChangesetView, "error.json", changeset: changeset)
    end
  end
end
