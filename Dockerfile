FROM n8nio/n8n:latest
USER root
# Install ffmpeg, python3, pip on Alpine base
RUN apk add --no-cache ffmpeg python3 py3-pip bash ca-certificates && update-ca-certificates
RUN pip3 install --no-cache-dir edge-tts==6.1.12
USER node
