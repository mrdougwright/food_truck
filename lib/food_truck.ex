defmodule FoodTruck do
  @moduledoc """
  Documentation for `FoodTruck`.
  """

  @civic_center {37.777117, -122.417645}

  @doc """
  Raw list data of Food Trucks in San Francisco. Should memoize...
  """
  def list, do: FoodTruck.Data.get!()

  @doc """
  Given a list of food trucks, and a {lat, long} tuple location,
  return a sorted list of the closest food trucks.
  """
  def closest(list, {lat, long} \\ @civic_center) do
    list
    |> Enum.map(&add_proximity(&1, {lat, long}))
    |> Enum.sort_by(&(&1["proximity"]))
  end

  def add_proximity(%{"location" => %{"latitude" => lat, "longitude" => long}} = truck, my_location) do
    distance = Distance.distance(
      {String.to_float(lat), String.to_float(long)},
      my_location
    )

    Map.put(truck, "proximity", distance)
  end


end
