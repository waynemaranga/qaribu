import os
from dotenv import load_dotenv
import openai

load_dotenv()

OPENAI_API_KEY: str = os.getenv(key="OPENAI_API_KEY")  # type: ignore
OPENAI_API_TYPE: str = os.getenv(key="OPENAI_API_TYPE")  # type: ignore
DEFAULT_MODEL = "gpt-3.5-turbo"
VALID_MODELS: list[str] = ['gpt-3.5-turbo-16k', 'gpt-4', 'gpt-4-0613', 'gpt-3.5-turbo-1106', 'gpt-3.5-turbo-instruct-0914', 'gpt-3.5-turbo-instruct', 'gpt-4-turbo', 'gpt-3.5-turbo', 'gpt-3.5-turbo-0301', 'gpt-4-turbo-2024-04-09', 'gpt-4-0125-preview', 'gpt-3.5-turbo-0125', 'gpt-4-turbo-preview', 'gpt-3.5-turbo-0613', 'gpt-4-1106-vision-preview', 'gpt-4-vision-preview', 'gpt-3.5-turbo-16k-0613', 'gpt-4-1106-preview']  # fmt: skip
DEFAULT_MAX_TOKENS = 1024
DEFAULT_TEMPERATURE = 0.5
DEFAULT_SYSTEM_MESSAGE = "Your a helpful chatbot"  # Cannot be empty
assert DEFAULT_SYSTEM_MESSAGE is not None

client = openai.OpenAI(
    api_key=OPENAI_API_KEY,
)


class OpenAIBot:
    def __init__(
        self,
        model: str = DEFAULT_MODEL,
        max_tokens: int = DEFAULT_MAX_TOKENS,
        temperature: float = DEFAULT_TEMPERATURE,
        system_message: str = DEFAULT_SYSTEM_MESSAGE,
    ) -> None:
        self.model: str = DEFAULT_MODEL or model  # TODO: Error handling if model passed isn't in list of valid models # fmt: skip
        # self.name = f"OpenAI: {model[0]}"
        self.max_tokens: int = DEFAULT_MAX_TOKENS or max_tokens
        self.temperature: float = DEFAULT_TEMPERATURE or temperature
        self.system_message: str = DEFAULT_SYSTEM_MESSAGE or system_message

    def __str__(self) -> str:
        # return self.name
        return f"{NotImplementedError}"

    def create_completion(self, prompt: str, assistant: str | None = None) -> str:
        DEFAULT_ASSISTANT: str = "Send a clear and concise answer"
        completion = client.chat.completions.create(
            max_tokens=self.max_tokens,
            model=self.model,
            temperature=self.temperature,
            messages=[
                {"role": "system", "content": self.system_message},
                {"role": "user", "content": prompt},
                {"role": "assistant", "content": DEFAULT_ASSISTANT or assistant},
            ],
        )

        return completion.choices[0].message.content  # type: ignore


if __name__ == "__main__":
    test_bot = OpenAIBot()
    print(test_bot.create_completion(prompt="Who is Kenya's first president?"))
    print(openai.models.list())
    # openai.api_key = OPENAI_API_KEY
    # print(type(openai.models.list()))
    # fmt: off
    # for model in openai.models.list(): print(model.id);
    # for model in openai.models.list(): print(type(model)); # <class 'openai.types.model.Model'>
    # VALID_MODEL_LIST: list[str] = [model.id for model in openai.models.list()]; # all models
    # VALID_MODEL_LIST: list[str] = [model.id for model in openai.models.list() if "gpt-" in model.id]; # openai._AmbiguousModuleClientUsageError:
    # print(VALID_MODEL_LIST)
