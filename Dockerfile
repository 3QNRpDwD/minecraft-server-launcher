FROM openjdk:17-slim

WORKDIR /app

# Install necessary tools
RUN apt-get update && apt-get install -y wget curl tar

# Copy project files
COPY . .

# Make scripts executable
RUN chmod +x run

# Set environment variables
ENV REPO_BASE_URL="https://raw.githubusercontent.com/monun/minecraft-server-launcher"
ENV REPO_BRANCH="master"
ENV DIR="server"
ENV SERVER="paper-1.19.3-latest"
ENV MEMORY=4
ENV BACKUP=false
ENV RESTART=true
ENV PLAYERS=100
ENV PLUGINS="plugins"
ENV WORLDS="worlds"
ENV PORT=-1
ENV DEBUG_PORT=-1

# Create necessary directories
RUN mkdir -p $DIR $PLUGINS $WORLDS

# Expose Minecraft server port
EXPOSE 25565

# Set entrypoint
ENTRYPOINT ["./run"]