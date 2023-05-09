defmodule SearchForm.CartsTest do
  use SearchForm.DataCase

  alias SearchForm.Carts

  describe "carts" do
    alias SearchForm.Carts.Cart

    import SearchForm.CartsFixtures

    @invalid_attrs %{image: nil, model: nil, price: nil, type: nil}

    test "list_carts/0 returns all carts" do
      cart = cart_fixture()
      assert Carts.list_carts() == [cart]
    end

    test "get_cart!/1 returns the cart with given id" do
      cart = cart_fixture()
      assert Carts.get_cart!(cart.id) == cart
    end

    test "create_cart/1 with valid data creates a cart" do
      valid_attrs = %{image: "some image", model: "some model", price: "some price", type: "some type"}

      assert {:ok, %Cart{} = cart} = Carts.create_cart(valid_attrs)
      assert cart.image == "some image"
      assert cart.model == "some model"
      assert cart.price == "some price"
      assert cart.type == "some type"
    end

    test "create_cart/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Carts.create_cart(@invalid_attrs)
    end

    test "update_cart/2 with valid data updates the cart" do
      cart = cart_fixture()
      update_attrs = %{image: "some updated image", model: "some updated model", price: "some updated price", type: "some updated type"}

      assert {:ok, %Cart{} = cart} = Carts.update_cart(cart, update_attrs)
      assert cart.image == "some updated image"
      assert cart.model == "some updated model"
      assert cart.price == "some updated price"
      assert cart.type == "some updated type"
    end

    test "update_cart/2 with invalid data returns error changeset" do
      cart = cart_fixture()
      assert {:error, %Ecto.Changeset{}} = Carts.update_cart(cart, @invalid_attrs)
      assert cart == Carts.get_cart!(cart.id)
    end

    test "delete_cart/1 deletes the cart" do
      cart = cart_fixture()
      assert {:ok, %Cart{}} = Carts.delete_cart(cart)
      assert_raise Ecto.NoResultsError, fn -> Carts.get_cart!(cart.id) end
    end

    test "change_cart/1 returns a cart changeset" do
      cart = cart_fixture()
      assert %Ecto.Changeset{} = Carts.change_cart(cart)
    end
  end
end
