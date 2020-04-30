FROM elixir:1.10.3-alpine AS build-stage

ARG app_name=cookpod
ARG build_env=prod

ENV MIX_ENV=${build_env}

WORKDIR /opt/app

RUN apk update \
  && apk --no-cache --update add nodejs npm git build-base \
  && mix local.rebar --force \
  && mix local.hex --force

COPY mix.* ./

RUN mix do deps.get --only prod, compile

COPY . .

RUN cd assets \
  && npm install \
  && ./node_modules/webpack/bin/webpack.js --mode production \
  && cd .. \
  && mix phx.digest \
  && mix release \
  && mv _build/${build_env}/rel/${app_name} /opt/release

FROM alpine:latest

ARG app_name=cookpod

RUN apk update && apk --no-cache --update add ca-certificates openssl-dev

COPY --from=build-stage /opt/release /opt/app

WORKDIR /opt/app

CMD /opt/app/bin/${app_name} start
