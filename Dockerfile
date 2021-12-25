FROM python:3.9.7-slim-buster

WORKDIR /app

COPY requirements.txt .

RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
ENV TRANSFORMERS_CACHE="/.cache/huggingface"

RUN pip install --no-cache-dir -r requirements.txt && \
    python -c "from transformers import AutoModelForSequenceClassification; AutoModelForSequenceClassification.from_pretrained('ivanlau/language-detection-fine-tuned-on-xlm-roberta-base')"

COPY main.py .
COPY languages.py .

RUN addgroup --gid 1001 --system text2lang && \
  adduser --system --uid 1001 --gid 1001 text2lang && \
  chown -R text2lang:text2lang /app && \
  chown -R text2lang:text2lang /.cache/huggingface

USER 1001:1001

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]