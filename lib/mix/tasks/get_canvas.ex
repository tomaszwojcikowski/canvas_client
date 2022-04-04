defmodule Mix.Tasks.CanvasClient.Get do
  @moduledoc """
    get canvas by UUID
  """
  use Mix.Task
  @requirements ["app.start"]

  @shortdoc "Get canvas by UUID"
  @impl Mix.Task

  def run(args) do
    valid_options = [
      host: :string,
      uuid: :string
    ]

    {parsed, _args, _invalid} = args |> OptionParser.parse(strict: valid_options)
    host = parsed |> Keyword.fetch!(:host)
    uuid = parsed |> Keyword.fetch!(:uuid)

    case CanvasClient.get_by_uuid(%{host: host}, uuid) do
      {:ok, content} ->
        IO.puts(content)

      {:error, error} ->
        exit({error, 1})
    end
  end
end
