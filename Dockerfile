FROM python:3.10-slim

WORKDIR /app

# Copy requirements first for better caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt


# Copy the rest of the code
COPY . .

# Now source the environment variables to set the openai and runloop keys
# Create entrypoint script
# This script will source the .env file and then execute the command passed to the container
# Sets all the environment secrets
RUN echo '#!/bin/bash\nsource .env\nexec "$@"' > /entrypoint.sh && chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

# Default command for production
CMD ["python", "src/main.py"]