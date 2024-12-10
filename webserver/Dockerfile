# Use an official Ubuntu base image
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV USER=root

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget python3-pip && \
    pip3 install websockify && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set up noVNC
RUN mkdir -p /opt/noVNC && \
    wget https://github.com/novnc/noVNC/archive/refs/tags/v1.2.0.tar.gz -O /opt/noVNC.tar.gz && \
    tar -xzf /opt/noVNC.tar.gz -C /opt/noVNC --strip-components=1 && \
    rm /opt/noVNC.tar.gz

# Expose the noVNC port
EXPOSE 80 6080

# Copy the custom index.html
COPY index.html /opt/noVNC/index.html

CMD ["websockify", "--web", "/opt/noVNC", "6080", "vnc:5901"]
