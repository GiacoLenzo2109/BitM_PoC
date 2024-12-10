#!/bin/bash

# Start the VNC server
echo "Starting VNC server at $RESOLUTION..."
vncserver -kill :1 || true
vncserver -geometry $RESOLUTION -depth 24 & 

# Wait a moment for the VNC server to start
sleep 5

# Tail to keep the script running
echo "VNC server started at $RESOLUTION! ^-^"
tail -f /dev/null

