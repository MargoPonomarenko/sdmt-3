FROM python:3.10-alpine3.14 AS builder

WORKDIR /app

COPY requirements/backend.in .

RUN apk update && \
    apk add --no-cache build-base gcc musl-dev python3-dev
RUN pip install --user --no-warn-script-location -r backend.in

FROM python:slim-bullseye

WORKDIR /app

COPY --from=builder /root/.local /root/.local

COPY . .

ENV PATH=/root/.local/bin:$PATH

ENTRYPOINT ["uvicorn", "spaceship.main:app", "--host=0.0.0.0", "--port=8080"]