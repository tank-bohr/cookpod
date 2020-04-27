defmodule Cookpod.Recipes.Recipe do
  use Ecto.Schema
  import Ecto.Changeset

  alias Cookpod.Recipes.Ingredient

  schema "recipes" do
    field :name, :string
    field :description, :string
    field :picture, :string

    has_many :ingridients, Ingredient
    has_many :products, through: [:ingridients, :product]

    timestamps()
  end

  @doc false
  def changeset(recipe, attrs) do
    recipe
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
    |> unique_constraint(:name)
  end
end
