FROM python:3.10-slim

WORKDIR /app

# Copy requirements first for better caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt


# Copy the rest of the code
COPY . .

# Now source the environment variables to set the openai and runloop keys
RUN source .env

# Default command for production
CMD ["python", "src/main.py"]