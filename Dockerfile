FROM debian

RUN apt-get update \
  && apt-get install -y --no-install-recommends tpp \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["tpp"]
