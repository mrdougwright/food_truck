defmodule FoodTruck.Data do
  @moduledoc """
  Simple http request to fetch json data from SF Gov FoodTruck data source.
  """

  @url "https://data.sfgov.org/resource/rqzj-sfat.json"

  def get! do
    HTTPoison.start()

    @url
    |> HTTPoison.get!()
    |> parse!()
  end

  defp parse!(%{body: body}), do: Jason.decode!(body)
end
