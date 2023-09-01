defmodule PhoenixToCsvWeb.BookLive.Index do
  use PhoenixToCsvWeb, :live_view

  alias PhoenixToCsv.Books
  alias PhoenixToCsv.Books.Book

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :book_collection, list_book())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Book")
    |> assign(:book, Books.get_book!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Book")
    |> assign(:book, %Book{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Book")
    |> assign(:book, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    book = Books.get_book!(id)
    {:ok, _} = Books.delete_book(book)

    {:noreply, assign(socket, :book_collection, list_book())}
  end

  defp list_book do
    Books.list_book()
  end
end
