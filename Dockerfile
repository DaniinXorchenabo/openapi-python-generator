FROM python:3.9-slim-bullseye

RUN mkdir -p /project
RUN pip install poetry
COPY ./pyproject.toml .
COPY ./README.md .
ENV POETRY_VIRTUALENVS_PATH=/project/venv
#COPY ./poetry.lock .
RUN pip install setuptools wheel && poetry install && python3 -m pip install nox && pip install nox-poetry
RUN apt update -y && apt install git -y
