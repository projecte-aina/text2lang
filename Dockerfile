FROM python:3.9.7-slim-buster

WORKDIR /app

RUN addgroup --gid 1001 --system text2lang && \
  adduser --system --no-create-home --uid 1001 --gid 1001 text2lang && \
  chown -R text2lang:text2lang /app

USER 1001:1001

COPY --chown=text2lang:text2lang requirements.txt .

# remove torch as we want to install cpu-only linux wheel
RUN sed -i '/torch/d' requirements.txt

RUN python -m venv /app/venv
ENV PATH="/app/venv/bin:$PATH"
ENV TRANSFORMERS_CACHE="/app/.cache/huggingface"
RUN pip install --no-cache-dir -r requirements.txt && \
    pip install https://download.pytorch.org/whl/cpu/torch-1.10.1%2Bcpu-cp39-cp39-linux_x86_64.whl && \
    python -c "from transformers import AutoModelForSequenceClassification, AutoTokenizer; AutoTokenizer.from_pretrained('ivanlau/language-detection-fine-tuned-on-xlm-roberta-base'); AutoModelForSequenceClassification.from_pretrained('ivanlau/language-detection-fine-tuned-on-xlm-roberta-base')"

COPY --chown=text2lang:text2lang main.py .
COPY --chown=text2lang:text2lang languages.py .

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]