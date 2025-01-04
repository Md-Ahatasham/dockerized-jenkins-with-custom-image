# Use the official Jenkins LTS image as the base
FROM jenkins/jenkins:lts

# Switch to root user to install packages
USER root

# Install dependencies for Docker CLI and Docker Compose
RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl software-properties-common gnupg2 lsb-release && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list && \
    apt-get update && \
    apt-get install -y docker-ce-cli && \
    apt-get clean

# Install Docker Compose
RUN curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

# Ensure /tmp/pear directory exists and set permissions (optional fix for PHP or PEAR-related tasks)
RUN mkdir -p /tmp/pear/download/ && \
    chmod -R 777 /tmp/pear

# Switch back to Jenkins user
USER jenkins