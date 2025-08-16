FROM n8nio/n8n:latest
USER root

# ---- System deps (Alpine uses apk) ----
# build-base: gcc, g++, make (for wheels that need compiling)
# python3-dev/libffi-dev/openssl-dev: headers for common Py deps
RUN apk add --no-cache \
    bash \
    ca-certificates \
    ffmpeg \
    python3 \
    py3-pip \
    build-base \
    python3-dev \
    libffi-dev \
    openssl-dev \
 && update-ca-certificates

# ---- Python tooling + edge-tts ----
RUN pip3 install --no-cache-dir --upgrade pip setuptools wheel
# PEP 668: allow installing into system site-packages on Alpine
RUN pip3 install --no-cache-dir --break-system-packages edge-tts==6.1.12

USER node
