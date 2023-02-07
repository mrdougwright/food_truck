defmodule FoodTruckTest do
  use ExUnit.Case
  doctest FoodTruck


  describe "closest/2" do
    test "returns sorted list of closest food trucks to Civic Center (default)" do
      proximities =
        FoodTruckData.list() # sample data; don't hit the API
        |> FoodTruck.closest()
        |> Enum.map(& &1["proximity"])

      assert proximities == [0.022610684370621796, 0.028553319522502688, 0.03355137377320268, 0.0610716693534569, 0.06171050980025459]
    end

    test "returns list with closest food truck near me" do
      my_location = {37.792862, -122.401316} # near 401 California st
      first_truck =
        FoodTruckData.list() # sample data; don't hit the API
        |> FoodTruck.closest(my_location)
        |> List.first

      assert first_truck["address"] == "401 CALIFORNIA ST"
    end
  end

  describe "add_proximity/2" do
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
