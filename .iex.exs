alias Cookpod.Repo
alias Cookpod.Recipes.Recipe
alias Cookpod.Recipes.Product
alias Cookpod.Recipes.Ingredient

import_if_available(Ecto.Query)

defmodule H do
  def recipe() do
    Repo.one(from(r in Recipe, limit: 1))
  end
end
