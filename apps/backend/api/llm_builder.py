from fastapi import APIRouter
from pydantic import BaseModel
from services.llm_handler import handle_llm_prompt

router = APIRouter()

class PromptRequest(BaseModel):
    prompt: str

@router.post("/llm-builder")
async def llm_builder(request: PromptRequest):
    result = await handle_llm_prompt(request.prompt)
    return {"result": result} 