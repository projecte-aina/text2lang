from fastapi import FastAPI, HTTPException
from transformers import AutoTokenizer, AutoModelForSequenceClassification, TextClassificationPipeline
from languages import LANGUAGE_MAP
from pydantic import BaseModel

model_name = "ivanlau/language-detection-fine-tuned-on-xlm-roberta-base"
tokenizer = AutoTokenizer.from_pretrained(model_name)
model = AutoModelForSequenceClassification.from_pretrained(model_name, id2label=LANGUAGE_MAP)
pipe = TextClassificationPipeline(model=model, tokenizer=tokenizer, return_all_scores=True)

class Request(BaseModel):
    inputs: str

app = FastAPI()

@app.get('/health')
async def health_check():
    return 'OK'

@app.post('/text2lang')
async def detect_language(req: Request):
    inputs = req.inputs
    if inputs:
        return pipe(inputs)
    else:
        raise HTTPException(status_code=400, detail="Inputs field required")