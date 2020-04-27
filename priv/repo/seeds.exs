# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Cookpod.Repo.insert!(%Cookpod.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

leek = Cookpod.Repo.insert!(%Cookpod.Recipes.Product{name: "leek"})
garlic = Cookpod.Repo.insert!(%Cookpod.Recipes.Product{name: "garlic"})
broccoli = Cookpod.Repo.insert!(%Cookpod.Recipes.Product{name: "broccoli"})
butter = Cookpod.Repo.insert!(%Cookpod.Recipes.Product{name: "butter"})
thyme = Cookpod.Repo.insert!(%Cookpod.Recipes.Product{name: "thyme"})
flour = Cookpod.Repo.insert!(%Cookpod.Recipes.Product{name: "flour"})
milk = Cookpod.Repo.insert!(%Cookpod.Recipes.Product{name: "milk"})
macaroni = Cookpod.Repo.insert!(%Cookpod.Recipes.Product{name: "dried macaroni"})
parmesan = Cookpod.Repo.insert!(%Cookpod.Recipes.Product{name: "Parmesan cheese"})
cheddar = Cookpod.Repo.insert!(%Cookpod.Recipes.Product{name: "Cheddar cheese"})
spinach = Cookpod.Repo.insert!(%Cookpod.Recipes.Product{name: "spinach"})
almonds = Cookpod.Repo.insert!(%Cookpod.Recipes.Product{name: "almonds"})

recipe =
  Cookpod.Repo.insert!(%Cookpod.Recipes.Recipe{
    name: "Greens mac 'n' cheese",
    description: """
    A Friday-night favourite, this is a twist on a comfort classic that uses
    broccoli in two ways – the blitzed-up stalks add colour and punch to the
    sauce, while you enjoy the delicate florets with your pasta. Join the green team!
    """,
    picture:
      "https://img1.jamieoliver.com/jamieoliver/recipe-database/xtra_med/92507790.jpg?tr=w-400"
  })

Cookpod.Repo.insert!(%Cookpod.Recipes.Ingredient{recipe: recipe, amount: 10, product: leek})
Cookpod.Repo.insert!(%Cookpod.Recipes.Ingredient{recipe: recipe, amount: 30, product: garlic})
Cookpod.Repo.insert!(%Cookpod.Recipes.Ingredient{recipe: recipe, amount: 400, product: broccoli})
Cookpod.Repo.insert!(%Cookpod.Recipes.Ingredient{recipe: recipe, amount: 40, product: butter})
Cookpod.Repo.insert!(%Cookpod.Recipes.Ingredient{recipe: recipe, amount: 15, product: thyme})
Cookpod.Repo.insert!(%Cookpod.Recipes.Ingredient{recipe: recipe, amount: 20, product: flour})
Cookpod.Repo.insert!(%Cookpod.Recipes.Ingredient{recipe: recipe, amount: 90, product: milk})
Cookpod.Repo.insert!(%Cookpod.Recipes.Ingredient{recipe: recipe, amount: 450, product: macaroni})
Cookpod.Repo.insert!(%Cookpod.Recipes.Ingredient{recipe: recipe, amount: 30, product: parmesan})
Cookpod.Repo.insert!(%Cookpod.Recipes.Ingredient{recipe: recipe, amount: 150, product: cheddar})
Cookpod.Repo.insert!(%Cookpod.Recipes.Ingredient{recipe: recipe, amount: 100, product: spinach})
Cookpod.Repo.insert!(%Cookpod.Recipes.Ingredient{recipe: recipe, amount: 50, product: almonds})
