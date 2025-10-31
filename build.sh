#!/bin/bash

# Nx Witness Arch Linux Package Builder Script
# This script builds the package using Docker

set -e

echo "🏗️  Building Nx Witness Arch Linux package using Docker..."

# Create output directory if it doesn't exist
mkdir -p output

# Build the Docker image
echo "📦 Building Docker image..."
docker-compose build nx-witness-builder

# Run the build
echo "🔨 Building the package..."
docker-compose run --rm nx-witness-builder

echo "✅ Build complete! Check the 'output' directory for the package."