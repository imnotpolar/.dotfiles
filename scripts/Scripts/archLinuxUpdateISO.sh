#!/bin/zsh

# Get current year and month
YEAR=$(date +%Y)
MONTH=$(date +%m)

# Set some local variables
TORRENT_URL="https://archlinux.org/releng/releases/${YEAR}.${MONTH}.01/torrent"
FILENAME="ArchLinux-${YEAR}.${MONTH}.01-x86_64.iso.torrent"
DOWNLOAD_DIR="$HOME/Downloads/Torrents"
TORRENT_PATH="$DOWNLOAD_DIR/$FILENAME"

# Create download dir
mkdir -p "$DOWNLOAD_DIR"

# Download the torrent file
echo "Downloading $FILENAME from $TORRENT_URL..."
curl -L "$TORRENT_URL" -o "$TORRENT_PATH"

# Check if download was successful
if [[ $? -ne 0 ]]; then
    echo "❌ Failed to download torrent file."
    exit 1
fi

# Open with default torrent app
echo "Opening ArchLinux torrent with default app..."
xdg-open "$TORRENT_PATH"

echo "✅ Done."
