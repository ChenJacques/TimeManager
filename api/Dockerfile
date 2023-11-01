FROM elixir:latest

RUN apt-get update && \
  apt-get install -y postgresql-client

RUN mkdir /api
COPY . /api
WORKDIR /api

RUN mix local.hex --force
RUN mix deps.get

CMD ["/api/entrypoint.sh"]