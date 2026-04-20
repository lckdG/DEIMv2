FROM python:3.12-slim

WORKDIR /app

COPY . .
ADD docker/* /usr/local/bin

RUN pip install --no-cache-dir --no-compile -r requirements_docker.txt

ENTRYPOINT [ "/bin/bash" ]
