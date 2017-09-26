#!/bin/sh

dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "======================================="
echo "$dt. Starting container..."

# move on to the work directory
cd $APP_DIR
echo "App dir: $APP_DIR"

if [ -e bower.json ]; then
  bower install --allow-root
fi

echo "Installing Node dependencies..."
npm install & wait

#echo "Starting chrome for testing"
xvfb-run --server-args='-screen 0, 1024x768x16' google-chrome -start-maximized > /dev/null &

ember test
