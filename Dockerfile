FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY ["predict.py", "model_rf.bin", "./"]
COPY static/ ./static/

EXPOSE $PORT

CMD gunicorn --bind=0.0.0.0:$PORT predict:app