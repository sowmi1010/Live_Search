defmodule SearchForm.Carts.Cart do
  use Ecto.Schema
  import Ecto.Changeset

  schema "carts" do
    field :image, :string
    field :model, :string
    field :price, :string
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(cart, attrs) do
    cart
    |> cast(attrs, [:model, :type, :price, :image])
    |> validate_required([:model, :type, :price, :image])
  end
end
