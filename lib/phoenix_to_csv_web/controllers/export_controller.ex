defmodule PhoenixToCsvWeb.ExportController do
  use PhoenixToCsvWeb, :controller

  alias PhoenixToCsv.Books

  def create(conn, _params) do
    fields = [:name, :title, :desc]
    csv_data = csv_content(Books.list_book(), fields)

    conn
    |> put_resp_content_type("text/csv")
    |> put_resp_header("content-disposition", "attachment; filename=\"export.csv\"")
    |> put_root_layout(false)
    |> send_resp(200, csv_data)
  end

  defp csv_content(records, fields) do
    records
    |> Enum.map(fn record ->
      record
      |> Map.from_struct()
      # gives an empty map
      |> Map.take([])
      |> Map.merge(Map.take(record, fields))
      |> Map.values()
    end)
    |> CSV.encode()
    |> Enum.to_list()
    |> to_string()
  end
end
