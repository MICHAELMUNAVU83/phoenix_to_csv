defmodule PhoenixToCsv.Books.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "book" do
    field :name, :string
    field :title, :string
    field :desc, :string

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:name, :title, :desc])
    |> validate_required([:name, :title, :desc])
  end
end
