FROM python:3.8.6

ARG AIRFLOW_HOME
ENV AIRFLOW_HOME=${AIRFLOW_HOME}

COPY requirements.txt "${AIRFLOW_HOME}/requirements.txt"
COPY dags "${AIRFLOW_HOME}/dags"

RUN pip install --upgrade pip setuptools wheel \
    && pip install -r "${AIRFLOW_HOME}/requirements.txt" \
    && airflow initdb

ENTRYPOINT ["airflow"]
