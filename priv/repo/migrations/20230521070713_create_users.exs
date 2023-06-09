defmodule PhoenixLiveviewValidations.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :password, :string
      add :password_confirmation, :string
      add :gender, :string
      add :age, :integer

      timestamps()
    end
    create unique_index(:users, [:email])
  end
end
