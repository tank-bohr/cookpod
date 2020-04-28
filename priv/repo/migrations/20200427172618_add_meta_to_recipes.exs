defmodule Cookpod.Repo.Migrations.AddMetaToRecipes do
  use Ecto.Migration

  def change do
    alter table("recipes") do
      add :meta, :map
    end
  end
end
