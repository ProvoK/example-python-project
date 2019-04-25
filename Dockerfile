FROM python:3.6-slim

COPY poetry.lock pyproject.toml ./
RUN pip install --user poetry && /root/.local/bin/poetry install

COPY app.py main.py /app/
WORKDIR /app

EXPOSE 8080
ENTRYPOINT ["/root/.local/bin/poetry", "run", "gunicorn", "main:app", "--bind", "0.0.0.0:8080" ]
