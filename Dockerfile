FROM n8nio/n8n:latest
USER root

# Keep your existing packages; just add curl
RUN apk add --no-cache ffmpeg bash curl

# Install yt-dlp (standalone binary) – persists across deploys
RUN curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp \
    -o /usr/local/bin/yt-dlp \
 && chmod a+rx /usr/local/bin/yt-dlp

# Keep your Edge TTS install exactly as before
RUN npm config set update-notifier false \
 && npm install -g --unsafe-perm edge-tts

USER node
