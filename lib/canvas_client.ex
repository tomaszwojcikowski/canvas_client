defmodule CanvasClient do
  @moduledoc """
  Client for Canvas
  """

  @spec get_by_uuid(map, any) :: {:error, any} | {:ok, String.t()}
  def get_by_uuid(config, uuid) do
    result =
      get_client(config)
      |> Tesla.get(get_query(uuid))

    case result do
      {:ok, %{status: 200, body: body}} ->
        {:ok, body}

      {:ok, %{status: status}} ->
        {:error, status}

      {:error, error} ->
        {:error, error}
    end
  end

  defp get_client(config) do
    host = Map.fetch!(config, :host)

    [{Tesla.Middleware.BaseUrl, host}]
    |> Tesla.client({Tesla.Adapter.Finch, name: CanvasClientFinch})
  end

  defp get_query(uuid) do
    "#{base_path()}/#{uuid}"
  end

  defp base_path do
    "/api/canvas"
  end
end
