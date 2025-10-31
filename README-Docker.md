# Docker Build Instructions for Nx Witness Arch Linux Package

This directory now contains Docker configuration files to build the Nx Witness Arch Linux package in a containerized environment.

## Files Added

- `Dockerfile` - Arch Linux based build environment
- `docker-compose.yml` - Docker Compose configuration for easy building
- `build.sh` - Simple build script
- `.dockerignore` - Files to exclude from Docker context
- `README-Docker.md` - This file

## Quick Start

### Option 1: Using the build script (Recommended)

```bash
# Clone the repository
git clone https://github.com/Sulrwin/nx-witness-archlinux.git
cd nx-witness-archlinux

# Build the package
./build.sh
```

### Option 2: Using Docker Compose directly

```bash
# Build the package
docker-compose run --rm nx-witness-builder

# Get an interactive shell for debugging
docker-compose run --rm nx-witness-shell
```

### Option 3: Using Docker directly

```bash
# Build the image
docker build -t nx-witness-archlinux-builder .

# Build the package
docker run --rm -v $(pwd)/output:/home/builder/output nx-witness-archlinux-builder
```

## Output

The built package will be placed in the `output/` directory:
- `networkoptix-client-*.pkg.tar.zst` - The Arch Linux package

## Docker Services

### nx-witness-builder
- Builds the package automatically
- Uses all available CPU cores (`MAKEFLAGS=-j$(nproc)`)
- Outputs the package to the shared volume

### nx-witness-shell
- Provides an interactive shell in the build environment
- Useful for debugging or manual building
- Mounts the current directory and output volume

## Development

### Interactive Development Shell

```bash
# Get an interactive shell
docker-compose run --rm nx-witness-shell

# Inside the container, you can:
makepkg -s -i  # Build and install
makepkg -s     # Build only
pacman -Qi networkoptix-client  # Check package info
```

### Rebuild without Cache

```bash
docker-compose build --no-cache nx-witness-builder
```

### Clean Up

```bash
# Remove Docker images and containers
docker-compose down --rmi all
docker system prune -f
```

## Troubleshooting

### Permission Issues
If you encounter permission issues with the output directory:

```bash
sudo chown -R $USER:$USER output/
```

### Build Failures
To debug build failures:

```bash
# Get an interactive shell
docker-compose run --rm nx-witness-shell

# Check PKGBUILD
cat PKGBUILD

# Try building manually
makepkg -s
```

### Version Detection Issues
The PKGBUILD automatically detects the latest version from Network Optix. If this fails:

1. Check internet connectivity in the container
2. Verify the update URL is still accessible
3. Manually specify a version in PKGBUILD if needed

## Installation

After building, install the package on your Arch Linux system:

```bash
sudo pacman -U output/networkoptix-client-*.pkg.tar.zst
```

## Architecture

The Dockerfile:
1. Uses Arch Linux base image
2. Installs required build dependencies
3. Creates a non-root `builder` user
4. Installs yay for potential AUR dependencies
5. Sets up the build environment

The build process:
1. Detects the latest Nx Witness version
2. Downloads the corresponding DEB package
3. Extracts and converts to Arch Linux format
4. Creates a installable package

## Advantages of Docker Build

- **Isolated Environment**: No need to install build dependencies on host
- **Reproducible**: Same environment every time
- **Cross-platform**: Works on any system with Docker
- **Clean**: No leftover files on host system
- **Version Management**: Easy to switch between build environments