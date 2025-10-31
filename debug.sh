#!/bin/bash

# Debug script to check Docker build and output

echo "🔍 Debugging Docker build process..."

# Create output directory if it doesn't exist
mkdir -p output

echo "📁 Current directory contents:"
ls -la

echo ""
echo "📦 Output directory contents (before):"
ls -la output/ || echo "Output directory doesn't exist or is empty"

echo ""
echo "🐳 Running interactive build shell..."
echo "You can now run: makepkg -s"
echo "Then check files with: ls -la *.pkg.tar.zst"
echo "And copy to output: cp *.pkg.tar.zst /home/builder/output/"
echo ""
echo "Type 'exit' when done to see final output directory contents."

docker-compose run --rm nx-witness-shell

echo ""
echo "📦 Output directory contents (after):"
ls -la output/