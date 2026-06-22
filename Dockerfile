# Use Ubuntu as base
FROM ubuntu:20.04

# Install build tools
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy source code
COPY . .

# Compile the project (adjust if your Makefile exists)
RUN make

# Default command (replace with your binary name)
CMD ["./main"]

