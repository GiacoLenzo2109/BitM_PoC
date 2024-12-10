# Use an official Ubuntu base image
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV USER=root

RUN apt-get update && apt-get install -y --no-install-recommends \
    xfce4 xfce4-goodies tightvncserver dbus-x11 xfonts-base wget \
    python3-pip libgl1-mesa-glx libgl1-mesa-dri \
    libxrender1 libxi6 libxrandr2 libxtst6 midori \
    && pip3 install websockify \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Setup VNC server
RUN mkdir /root/.vnc && \
    echo "password" | vncpasswd -f > /root/.vnc/passwd && \
    chmod 600 /root/.vnc/passwd

# Set the working directory and display resolution
WORKDIR /app
ENV RESOLUTION=1920x1080

# Expose VNC port
EXPOSE 5901

# Copy the startup script and xstartup file
COPY xstartup /root/.vnc/xstartup
COPY start-vnc.sh /app/start-vnc.sh
COPY midori.conf /root/.config/midori/config

# Set permissions
RUN chmod +x /root/.vnc/xstartup /app/start-vnc.sh

CMD ["/app/start-vnc.sh"]
