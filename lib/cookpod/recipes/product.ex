defmodule Cookpod.Recipes.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :fats, :integer
    field :carbs, :integer
    field :proteins, :integer

    # has_many :recipes, through: [...]

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :fats, :carbs, :proteins])
    |> validate_required([:name])
  end
end
