FROM python:3.13-slim

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

WORKDIR /app

# Ku rakib bash iyo dependencies muhiim ah
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
        bash \
        build-essential \
        libssl-dev \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

COPY . .

# Hubi in thunder.sh uu yahay executable
RUN chmod +x thunder.sh

# Isticmaal bash si uu u bilaabo botka
CMD ["bash", "thunder.sh"]
