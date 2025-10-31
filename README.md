# Network Optix Client Arch Linux Package

This directory contains the Arch Linux build files for the Network Optix (Nx Witness) Client.
Takes the provided deb file and converts to PKG.
(Faster than building from source lol)

## Files Included

- `PKGBUILD` - Main Arch Linux package build script
- `networkoptix-client.install` - Installation/Removal script for desktop integration
- `.SRCINFO` - Package metadata file
- `Dockerfile` - Docker build environment configuration
- `docker-compose.yml` - Docker Compose configuration
- `build.sh` - Simple Docker build script
- `README-Docker.md` - Detailed Docker documentation
- `README.md` - This file

## Prerequisites

Before building this package, you need:

1. A base Arch Linux system with development tools
2. Internet connection to download the source package
3. The `binutils` package (for `ar` command to extract DEB files)
4. The `curl` package (for automatic version detection)

The PKGBUILD automatically detects and downloads the **latest stable version** from:
- `https://updates.networkoptix.com/default/` (latest stable version)

**New Feature:** This PKGBuild now automatically fetches the newest stable version from the NetworkOptix update site, so you no longer need to manually update version numbers!

## Building Instructions

### Option 1: Native Arch Linux Build

1. Build the package (will automatically download the source):
   ```bash
   makepkg -s
   ```

2. Install the package (replace version number with what was built):
   ```bash
   sudo pacman -U networkoptix-client-*.pkg.tar.zst
   ```

### Option 2: Docker Build (Recommended)

The Docker method provides an isolated build environment that works on any system with Docker installed.

**Quick Start:**
```bash
# Clone and build using the provided script
git clone https://github.com/Sulrwin/nx-witness-archlinux.git
cd nx-witness-archlinux
./build.sh
```

**Alternative Docker Commands:**
```bash
# Using Docker Compose
docker-compose run --rm nx-witness-builder

# Interactive shell for debugging
docker-compose run --rm nx-witness-shell
```

**Docker Benefits:**
- Isolated build environment (no system dependencies required)
- Cross-platform compatibility (works on Linux, macOS, Windows)
- Reproducible builds
- Clean output directory

For detailed Docker instructions, see [README-Docker.md](README-Docker.md).

**Note:** The SHA256 checksum is currently set to 'SKIP' since the version is dynamically detected. If you want to verify the integrity of the downloaded file, you can:

1. After building, check which version was downloaded by examining the PKGBUILD output
2. Generate the checksum for the specific version that was downloaded:
   ```bash
   # Example (replace with actual version from build):
   sha256sum nxwitness-client-X.X.X.XXXXX-linux_x64.deb
   ```

3. Update PKGBUILD with the actual checksum (optional, as SKIP is acceptable for auto-updating packages):
   ```bash
   # Replace sha256sums=('SKIP') with the actual hash
   sha256sums=('your_hash_here')
   ```

Since the version is automatically detected, using 'SKIP' is reasonable as long as you trust the NetworkOptix source.

**Docker Output:** When using Docker, the built package will be placed in the `output/` directory.

## Package Contents

The package installs to:
- `/opt/networkoptix/client/X.X.X.XXXXX/` - Main application files (version-specific directory)
- `/usr/share/applications/` - Desktop integration files
- `/usr/share/icons/` - Application icons

The installation directory will include the dynamically detected version number.

## Dependencies

This package has extensive dependencies including:
- Qt6 framework
- GStreamer multimedia framework
- Various system libraries for multimedia and graphics

See the `depends` array in PKGBUILD for the complete list.

## Troubleshooting

- If you encounter dependency issues, make sure all required packages are installed
- The package requires a 64-bit (x86_64) system
- Some dependencies may require multilib repository to be enabled

## License

This package is licensed under the same terms as the original Network Optix Client software (MPL 2.0).
