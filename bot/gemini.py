import os
from dotenv import load_dotenv
import google.generativeai as genai
from google.generativeai import GenerativeModel

load_dotenv()

GOOGLE_API_KEY: str = os.getenv(key="GOOGLE_API_KEY")  # type: ignore
DEFAULT_MODEL = genai.GenerativeModel(model_name="gemini-1.5-pro-latest")
VALID_MODELS: list[str] = ['gemini-1.0-pro', 'gemini-1.0-pro-001', 'gemini-1.0-pro-latest', 'gemini-1.0-pro-vision-latest', 'gemini-1.5-pro-latest', 'gemini-pro', 'gemini-pro-vision']  # fmt: skip
DEFAULT_MAX_TOKENS: int = 1024
DEFAULT_TEMPERATURE: float = 0.5
DEFAULT_SYSTEM_MESSAGE: str = "Your a helpful chatbot"  # Cannot be empty
assert DEFAULT_SYSTEM_MESSAGE is not None

genai.configure(api_key=GOOGLE_API_KEY)


class GeminiBot:
    """
    Bot by Google Gemini.
    """

    def __init__(
        self, model=None, max_tokens=None, temperature=None, system_message=None
    ) -> None:
        # if model not in VALID_MODELS: # error because at this point, model=None
        # if model != None and model.lower() not in VALID_MODELS:
        if model is not None and model.lower() not in VALID_MODELS:
            raise ValueError(f"Incorrect model, pick from {VALID_MODELS}")
        self.model = (
            DEFAULT_MODEL or
            genai.GenerativeModel(model_name=model.lower()))  # model type needed, not name # fmt: skip

        # TODO: Error handling if model passed isn't in list of valid models # fmt: skip
        self.model: GenerativeModel = DEFAULT_MODEL or model
        # self.name = f"OpenAI: {model[0]}"
        self.max_tokens = DEFAULT_MAX_TOKENS or max_tokens
        self.temperature = DEFAULT_TEMPERATURE or temperature
        self.system_message = DEFAULT_SYSTEM_MESSAGE or system_message

    def __str__(self) -> str:
        # return self.name
        return f"{NotImplementedError}"

    def create_completion(self, prompt: str) -> str:
        """Create completion, uses `GenerativeModel.generate_content` method"""
        completion = self.model.generate_content(contents=prompt)
        return completion.text


if __name__ == "__main__":
    test_bot = GeminiBot()
    print(test_bot.create_completion("Who are the Beastie Boys?"))
    # VALID_MODELS: list[str] = [model.name for model in genai.list_models() if 'generateContent' in model.supported_generation_methods]  # fmt: skip
    VALID_MODELS_test: list[str] = [
        # model.name # contains "models/{MODEL_NAME}"
        model.name.replace("models/", "")  # removes "models/", try list slicing as well
        for model in genai.list_models()
        if "generateContent" in model.supported_generation_methods
    ]

    # print(f"Valid Models: {VALID_MODELS_test}")
    # fmt: off
    # for i in VALID_MODELS_test: print(i, end=", ");
    # for i in VALID_MODELS_test: print(type(i), end=", "); # str
