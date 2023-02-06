defmodule FoodTruckTest do
  use ExUnit.Case
  doctest FoodTruck

  describe "add_proximity/3" do
    test "adds `proximity` to truck data when given lat & long" do
      truck = %{"location" => %{
        "latitude" => "37.78484602775554",
        "longitude" => "-122.42256813313709"
      }}

      mutated_truck = FoodTruck.add_proximity(truck, {37.777117, -122.417645})

      assert mutated_truck["proximity"] == 0.009163793424754341
    end
  end
end
