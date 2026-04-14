# syntax=docker/dockerfile:1

FROM python:3.13-slim AS base
WORKDIR /app

# Builder stage: install dependencies in a venv
FROM base AS builder
# Copy only requirements.txt first for better caching
COPY --link requirements.txt ./
RUN python -m venv .venv && \
    .venv/bin/pip install --upgrade pip && \
    .venv/bin/pip install -r requirements.txt

# Final stage: copy app code and venv, set up non-root user
FROM base AS final
# Create non-root user
RUN addgroup --system appuser && adduser --system --ingroup appuser appuser
USER appuser

# Copy virtual environment from builder
COPY --from=builder /app/.venv /app/.venv
ENV PATH="/app/.venv/bin:$PATH"

# Copy application code and assets (excluding .git and secrets)
COPY --link app.py ./
COPY --link templates/ ./templates/
COPY --link static/ ./static/

EXPOSE 80
CMD ["python", "app.py"]
