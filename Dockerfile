FROM python:3.11

WORKDIR /app
COPY . /app

RUN pip install --upgrade setuptools wheel
RUN pip install poetry
RUN poetry config virtualenvs.create false
RUN poetry install --no-interaction --no-ansi --no-dev

ENTRYPOINT "./docker-entrypoint.sh"
