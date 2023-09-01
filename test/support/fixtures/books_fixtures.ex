defmodule PhoenixToCsv.BooksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PhoenixToCsv.Books` context.
  """

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}) do
    {:ok, book} =
      attrs
      |> Enum.into(%{
        name: "some name",
        title: "some title",
        desc: "some desc"
      })
      |> PhoenixToCsv.Books.create_book()

    book
  end
end
