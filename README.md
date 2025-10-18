# Network Optix Client Arch Linux Package

This directory contains the Arch Linux build files for the Network Optix (Nx Witness) Client.

## Files Included

- `PKGBUILD` - Main Arch Linux package build script
- `networkoptix-client.install` - Installation/Removal script for desktop integration
- `.SRCINFO` - Package metadata file
- `README.md` - This file

## Prerequisites

Before building this package, you need:

1. A base Arch Linux system with development tools
2. Internet connection to download the source package
3. The `binutils` package (for `ar` command to extract DEB files)

The PKGBUILD automatically downloads the source from:
- `https://updates.networkoptix.com/default/41837/linux/nxwitness-client-6.0.6.41837-linux_x64.deb`

## Building Instructions

1. Build the package (will automatically download the source):
   ```bash
   makepkg -s
   ```

2. Install the package:
   ```bash
   sudo pacman -U networkoptix-client-6.0.6-1-x86_64.pkg.tar.zst
   ```

**Note:** The SHA256 checksum is currently set to 'SKIP'. If you want to verify the integrity of the downloaded file, you can:

1. Download the file manually and generate its checksum:
   ```bash
   wget https://updates.networkoptix.com/default/41837/linux/nxwitness-client-6.0.6.41837-linux_x64.deb
   sha256sum nxwitness-client-6.0.6.41837-linux_x64.deb
   ```

2. Update PKGBUILD with the actual checksum:
   ```bash
   # Replace sha256sums=('SKIP') with the actual hash
   sha256sums=('your_hash_here')
   ```

## Package Contents

The package installs to:
- `/opt/networkoptix/client/6.0.6.41837/` - Main application files
- `/usr/share/applications/` - Desktop integration files
- `/usr/share/icons/` - Application icons

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