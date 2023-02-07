FROM elixir:latest

WORKDIR /app

COPY mix.exs .
COPY mix.lock .

CMD mix deps.get
