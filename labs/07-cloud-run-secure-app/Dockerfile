# Minimal Python base for a Cloud Run sample app.
# Pin to a specific minor version for reproducibility.
FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PORT=8080

WORKDIR /app

COPY app/requirements.txt ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY app/ ./

RUN useradd --create-home --shell /usr/sbin/nologin appuser
USER appuser

EXPOSE 8080
CMD ["python", "main.py"]
