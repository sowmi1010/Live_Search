defmodule SearchForm.CartsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SearchForm.Carts` context.
  """

  @doc """
  Generate a cart.
  """
  def cart_fixture(attrs \\ %{}) do
    {:ok, cart} =
      attrs
      |> Enum.into(%{
        image: "some image",
        model: "some model",
        price: "some price",
        type: "some type"
      })
      |> SearchForm.Carts.create_cart()

    cart
  end
end
