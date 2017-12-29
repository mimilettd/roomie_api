defmodule RoomieApi.UserTest do
  use RoomieApi.ModelCase

  alias RoomieApi.User

  @valid_attrs %{first_name: "Mimi", last_name: "Le", birthday: 1990-09-18, sex: "Female", email: "mimi@roomie.com", password: "password", bio: "I am a software developer who loves to hike, rock climb, and snowboard!"}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)

    assert changeset.valid?
  end

  test "changeset, email is too short" do
    changeset = User.changeset(
      %User{}, Map.put(@valid_attrs, :email, " ")
    )
    refute changeset.valid?
  end

  test "changeset, email invalid format" do
    changeset = User.changeset(
      %User{}, Map.put(@valid_attrs, :email, "foo.com")
    )

    refute changeset.valid?
  end

  test "registration_changeset, valid password" do
    changeset = User.registration_changeset(%User{}, @valid_attrs)
    assert changeset.changes.password_hash
    assert changeset.valid?
  end

  test "registration_changeset, password too short" do
    changeset = User.registration_changeset(
      %User{}, Map.put(@valid_attrs, :password, "12345")
    )

    refute changeset.valid?
  end
end
