# FoodTruck

## A kind of CLI
This app lets you perform some operations on a list of food trucks in San Francisco.

You can retrieve a list of the closest food trucks to your location. First get the list, then provide a lat and long of your San Francisco location.

```elixir
list = FoodTruck.list()
my_location = {37, -122}

FoodTruck.closest(list, my_location)
```

You can also filter the list by food type.
```elixir
FoodTruck.by_food(list, "Hot Dog")
```

And tack on permit status.
```elixir
FoodTruck.by_status(list, "APPROVED")
```

So, for example, to build a list of approved Hot Dog stands near Civic Center, you could run:
```elixir
FoodTruck.list()
|> FoodTruck.closest()
|> FoodTruck.by_food("Hot Dog")
|> FoodTruck.by_status("APPROVED")
```

## Developer
To run and test this application yourself, git clone this repository from GitHub and run the following commands to spin up an IEx shell.

```
mix deps.get
iex -S mix
```
If you're feeling fancy, you can run it in docker. Otherwise you'll need Erlang/OTP 25 and Elixir version 1.14.3 locally on your machine.

### Docker

Assuming you have Docker running on your machine, you can run
```
docker compose up
docker compose run app iex -S mix
```
to enter the app in the interactive Elixir shell. Try a command, like
```
list = FoodTruck.list()
FoodTruck.closest(list) |> List.first |> Map.get("address")
```


Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/food_truck>.

