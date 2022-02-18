FROM python:3.10.2-alpine3.15

COPY generator.py /app/
COPY run.sh /app/

WORKDIR /app
CMD mkdir data; sh run.sh