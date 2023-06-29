FROM python:3.11

WORKDIR /app
COPY . /app

RUN pip install --upgrade pip setuptools wheel
RUN pip install poetry
RUN poetry config virtualenvs.create false && poetry install --no-interaction --no-ansi
RUN poetry env use 3.11

ENTRYPOINT "flask"

CMD ["--app", "run", "run"]
