FROM python:slim-bullseye AS builder

WORKDIR /app

COPY requirements/backend.in .

RUN pip install --user --no-warn-script-location -r backend.in

FROM python:slim-bullseye

WORKDIR /app

COPY --from=builder /root/.local /root/.local

COPY . .

ENV PATH=/root/.local/bin:$PATH

ENTRYPOINT ["uvicorn", "spaceship.main:app", "--host=0.0.0.0", "--port=8080"]