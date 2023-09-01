defmodule PhoenixToCsv.Repo.Migrations.CreateBook do
  use Ecto.Migration

  def change do
    create table(:book) do
      add :name, :string
      add :title, :string
      add :desc, :string

      timestamps()
    end
  end
end
