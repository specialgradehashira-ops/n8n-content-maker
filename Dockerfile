FROM n8nio/n8n:latest
USER root

# ffmpeg for video/audio, bash for shell nodes
RUN apk add --no-cache ffmpeg bash

# Install Edge TTS (Node CLI). No native builds, no Python.
# --unsafe-perm avoids permission issues in containerized installs.
RUN npm config set update-notifier false \
 && npm install -g --unsafe-perm edge-tts

USER node
