import click
from bot.gemini import GeminiBot


@click.command()
def hello() -> None:
    click.echo(message="Hello World!")


if __name__ == "__main__":
    print("😄", end="\n")
    hello()
