# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     SearchForm.Repo.insert!(%SearchForm.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias SearchForm.Repo
alias SearchForm.Carts.Cart

%Cart{
  model: "Lenovo IdeaPad Slim 3 Intel Core i3 11th Gen ",
  price: "30,000",
  type: "Laptop",
  image: "/images/cart/Lenovo IdeaPad Slim 3 Intel Core i3 11th Gen .webp"
}
|> Repo.insert!()
