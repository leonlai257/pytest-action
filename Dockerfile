FROM python:3.12-slim AS BUILDER

USER root

WORKDIR /app/

RUN python -m venv /opt/venv

COPY ./requirements.txt /app/requirements.txt
RUN pip install -Ur requirements.txt

# COPY . /app

# RUN . ./app/venv/bin/activate && \
#     pip install -r requirements.txt

EXPOSE 8000


COPY . .

ENV PORT=8000
ENTRYPOINT ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]