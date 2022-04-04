defmodule CanvasClientTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Finch

  @host "http://localhost:4000"

  test "GET not_found" do
    use_cassette "get_not_found", match_requests_on: [:query] do
      assert CanvasClient.get_by_uuid(%{host: @host}, "d38b6ef7-bf8f-46ca-92e8-065a7c45c9c3") ==
               {:error, 404}
    end
  end

  test "GET success" do
    use_cassette "get_success", match_requests_on: [:query] do
      {:ok, content} =
        CanvasClient.get_by_uuid(%{host: @host}, "7fbfa03e-9935-46d3-9644-cb45f1a308fa")

      assert "\n\n   @@@@@\n   @XXX@  XXXXXXXXXXXXXX\n   @@@@@  XOOOOOOOOOOOOX\n          XOOOOOOOOOOOOX\n          XOOOOOOOOOOOOX\n          XOOOOOOOOOOOOX\n          XXXXXXXXXXXXXX" =
               content
    end
  end
end
