defmodule PhoenixToCsv.BooksTest do
  use PhoenixToCsv.DataCase

  alias PhoenixToCsv.Books

  describe "book" do
    alias PhoenixToCsv.Books.Book

    import PhoenixToCsv.BooksFixtures

    @invalid_attrs %{name: nil, title: nil, desc: nil}

    test "list_book/0 returns all book" do
      book = book_fixture()
      assert Books.list_book() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Books.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      valid_attrs = %{name: "some name", title: "some title", desc: "some desc"}

      assert {:ok, %Book{} = book} = Books.create_book(valid_attrs)
      assert book.name == "some name"
      assert book.title == "some title"
      assert book.desc == "some desc"
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Books.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      update_attrs = %{name: "some updated name", title: "some updated title", desc: "some updated desc"}

      assert {:ok, %Book{} = book} = Books.update_book(book, update_attrs)
      assert book.name == "some updated name"
      assert book.title == "some updated title"
      assert book.desc == "some updated desc"
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Books.update_book(book, @invalid_attrs)
      assert book == Books.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Books.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Books.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Books.change_book(book)
    end
  end
end
