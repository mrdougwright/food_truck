defmodule FoodTruck.DataTest do
  use ExUnit.Case, async: false
  doctest FoodTruck.Data

  import Mock

  setup_with_mocks([
    {HTTPoison, [], [start: fn -> nil end]},
    {HTTPoison, [:passthrough], [get!: fn(_url) -> response() end]}
  ]) do
    {:ok, data: FoodTruck.Data.get!()}
  end

  test "calls HTTPoison to fetch data from url" do
    assert_called HTTPoison.get!("https://data.sfgov.org/resource/rqzj-sfat.json")
  end

  test "returns parsed json data", %{data: data} do
    assert data == Jason.decode!(response().body)
  end

  defp response do
    %{body: "{\"address\":\"185 BERRY ST\",\"applicant\":\"Bob's Food Truck, LLC\"}"}
  end
end
