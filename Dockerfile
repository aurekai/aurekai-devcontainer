FROM python:3.11-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    bash curl git jq \
    && rm -rf /var/lib/apt/lists/*

ENV AUREKAI_VERSION=0.8.0-alpha.4
ENV PATH="/root/.aurekai/bin:$PATH"

RUN curl -fsSL https://github.com/aurekai/aurekai/releases/download/v0.8.0-alpha.4/install.sh | bash || true

WORKDIR /workspace
