defmodule RoomieApi.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string
      add :last_name, :string
      add :birthday, :date
      add :sex, :string
      add :email, :string, null: false
      add :password_hash, :string
      add :bio, :string

      timestamps
    end

    create unique_index(:users, [:email])
  end
end
