# Setuptools integration: https://click.palletsprojects.com/en/8.1.x/setuptools/#setuptools-integration
# Entry points spec: https://packaging.python.org/en/latest/specifications/entry-points/
from setuptools import setup

setup(
    name="qaribu",
    version="0.0.2",
    py_modules=["qaribu"],
    install_requires=[
        "Click",
    ],
    entry_points={
        "console_scripts": [
            "qaribu = qaribu:cli",
        ],
    },
)
