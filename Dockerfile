FROM python:slim-bullseye

WORKDIR /app

COPY . .

RUN pip install -r requirements/backend.in

ENTRYPOINT ["uvicorn", "spaceship.main:app", "--host=0.0.0.0", "--port=8080"]