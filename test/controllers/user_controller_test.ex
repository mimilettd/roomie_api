defmodule RoomieApi.UserControllerTest do
  use RoomieApi.ConnCase

  alias RoomieApi.User

  @valid_attrs %{first_name: "Mimi", last_name: "Le", birthday: 1990-09-18, sex: "Female", email: "mimi@roomie.com", password: "password", bio: "I am a software developer who loves to hike, rock climb, and snowboard!"}

  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, user_path(conn, :create), user: @valid_attrs
    body = json_response(conn, 201)
    assert body["data"]["id"]
    assert body["data"]["first_name"]
    assert body["data"]["last_name"]
    assert body["data"]["sex"]
    assert body["data"]["email"]
    refute body["data"]["password"]
    assert body["data"]["bio"]
    assert Repo.get_by(User, email: "mimi@roomie.com")
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, user_path(conn, :create), user: @invalid_attrs
    assert json_response(conn, 422)["errors"] != {}
  end
end
