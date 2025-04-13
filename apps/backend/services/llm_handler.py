import os
import openai
from dotenv import load_dotenv
from pathlib import Path

# Cargar variables de entorno desde la raíz del proyecto
env_path = Path(__file__).resolve().parent.parent.parent / '.env'
load_dotenv(dotenv_path=env_path)

# Configurar la API key de OpenAI
openai.api_key = os.getenv("OPENAI_API_KEY")

async def handle_llm_prompt(prompt: str) -> str:
    try:
        response = await openai.ChatCompletion.acreate(
            model="gpt-4",
            messages=[{"role": "user", "content": prompt}],
            temperature=0.7
        )
        return response.choices[0].message.content.strip()
    except Exception as e:
        return f"Error: {str(e)}" 