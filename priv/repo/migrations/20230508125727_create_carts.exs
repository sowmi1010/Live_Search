defmodule SearchForm.Repo.Migrations.CreateCarts do
  use Ecto.Migration

  def change do
    create table(:carts) do
      add :model, :string
      add :type, :string
      add :price, :string
      add :image, :string

      timestamps()
    end
  end
end
