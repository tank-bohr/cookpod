defmodule Cookpod.Repo.Migrations.CreateRecipes do
  use Ecto.Migration

  def change do
    create table(:recipes) do
      add :name, :string
      add :description, :string
      add :picture, :string

      timestamps()
    end

    create unique_index(:recipes, [:name])
  end
end
