FROM python:3.11

# Install system dependencies
RUN apt-get update && apt-get install -y git

WORKDIR /app

# Copy files and install requirements
COPY . .
RUN pip install --no-cache-dir -r requirements.txt

# --- CRITICAL FOR HUGGING FACE ---
# Hugging Face needs port 7860 to be open to mark the build as "Complete"
EXPOSE 7860
ENV PORT=7860
ENV PYTHONPATH=/app

# Start the bot
CMD ["python3", "-m", "FileStream"]
