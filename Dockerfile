FROM python:3.12-slim

RUN apt-get update \
    && apt-get install dos2unix \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .
RUN dos2unix docker/* \
    && cp docker/* /usr/local/bin

RUN pip install --no-cache-dir --no-compile -r requirements_docker.txt

ENTRYPOINT [ "/bin/bash" ]
