FROM n8nio/n8n:latest
USER root

# Alpine-friendly: just add ffmpeg & bash
RUN apk add --no-cache ffmpeg bash

# Use the Node version of edge-tts (no Python, no compilers)
RUN npm install -g edge-tts@4.6.4

USER node
