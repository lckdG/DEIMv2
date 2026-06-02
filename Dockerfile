FROM python:3.12-slim

RUN apt-get update \
    && apt-get install dos2unix \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /onnx2tf
RUN python -m venv ./venv \
    && ./venv/bin/pip install onnx2tf[tensorflow]

WORKDIR /app

COPY . .
RUN dos2unix docker/* \
    && chmod +x docker/* \
    && cp docker/* /usr/local/bin

RUN pip install --no-cache-dir --no-compile -r requirements_docker.txt

