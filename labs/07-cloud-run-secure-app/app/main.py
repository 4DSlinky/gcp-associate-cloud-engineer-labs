"""Minimal Cloud Run sample app.

Replace this with the real application you want to demonstrate. The goal of
this skeleton is to give Cloud Run something safe and tiny to run while you
focus the lab on the surrounding security configuration.
"""

import os

from flask import Flask, jsonify

app = Flask(__name__)


@app.get("/")
def index():
    return jsonify(
        {
            "service": "lab07-cloud-run-secure-app",
            "status": "ok",
        }
    )


@app.get("/healthz")
def healthz():
    return ("ok", 200)


if __name__ == "__main__":
    port = int(os.environ.get("PORT", "8080"))
    app.run(host="0.0.0.0", port=port)
