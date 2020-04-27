defmodule Cookpod.Repo.Migrations.CreateComponents do
  use Ecto.Migration

  def change do
    create table(:ingredients) do
      add :amount, :integer
      add :recipe_id, references(:recipes, on_delete: :delete_all)
      add :product_id, references(:products, on_delete: :delete_all)

      timestamps()
    end

    create index(:ingredients, [:recipe_id, :product_id], unique: true)
  end
end
