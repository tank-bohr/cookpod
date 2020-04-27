defmodule Cookpod.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :fats, :integer
      add :carbs, :integer
      add :proteins, :integer

      timestamps()
    end
  end
end
