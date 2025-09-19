FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Install locales (optional, avoids warning)
RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/*


COPY ./app/* ./

  
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

