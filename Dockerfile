FROM codercom/code-server:latest

# Switch to root user to install dependencies
USER root

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary system dependencies
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Create a virtual environment for PlatformIO
RUN python3 -m venv /opt/pio && \
    /opt/pio/bin/pip install -U platformio

# Ensure PlatformIO is available in every terminal session
RUN echo 'source /opt/pio/bin/activate' >> /home/coder/.bashrc && \
    echo 'source /opt/pio/bin/activate' >> /home/coder/.profile && \
    echo 'source /opt/pio/bin/activate' >> /home/coder/.bash_profile

# Add PlatformIO to PATH for non-interactive shells
ENV PATH="/opt/pio/bin:$PATH"

# Set permissions to allow coder user to access pio
RUN chown -R coder:coder /opt/pio

# Switch back to non-root user
USER coder

# Set working directory
WORKDIR /workspace

# Run code-server by default
CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "none"]
