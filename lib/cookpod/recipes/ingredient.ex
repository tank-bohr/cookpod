defmodule Cookpod.Recipes.Ingredient do
  use Ecto.Schema
  import Ecto.Changeset

  alias Cookpod.Recipes.Recipe
  alias Cookpod.Recipes.Product

  schema "ingredients" do
    field :amount, :integer
    belongs_to :recipe, Recipe
    belongs_to :product, Product

    timestamps()
  end

  @doc false
  def changeset(component, attrs) do
    component
    |> cast(attrs, [:amount])
    |> validate_required([:amount])
  end
end
