# Maintainer: Network Optix
pkgname=networkoptix-client
pkgver=6.0.6
pkgrel=1
pkgdesc="Nx Witness Client"
arch=('x86_64')
url="https://networkoptix.com"
license=('MIT')
depends=(
    'alsa-lib'
    'cuda-tools'
    'ffmpeg4.4'
    'fontconfig'
    'freetype2'
    'glu'
    'gst-plugins-base-libs'
    'gstreamer'
    'intel-gmmlib'
    'libdrm'
    'mesa'
    'libglvnd'
    'libgudev'
    'libpulse'
    'libva'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxi'
    'libxkbcommon'
    'libxkbfile'
    'libxml2-legacy'
    'libxrandr'
    'libxrender'
    'libxslt'
    'libxss'
    'libxtst'
    'nspr'
    'nss'
    'openssl'
    'orc'
    'qt6-base'
    'qt6-declarative'
    'qt6-positioning'
    'qt6-quicktimeline'
    'qt6-wayland'
    'qt6-webengine'
    'qt6-websockets'
    'qt6-webview'
    'wayland'
    'xcb-util'
    'xcb-util-cursor'
    'xcb-util-image'
    'xcb-util-keysyms'
    'xcb-util-renderutil'
    'xcb-util-wm'
    'zlib'
)
makedepends=('binutils')
optdepends=()
options=('!strip' '!emptydirs')

source=("https://updates.networkoptix.com/default/41837/linux/nxwitness-client-6.0.6.41837-linux_x64.deb")
install=networkoptix-client.install
sha256sums=('SKIP')

prepare() {
    # Extract the DEB file to get the files
    mkdir -p "${srcdir}/extracted"
    cd "${srcdir}/extracted"
    ar x "${srcdir}/nxwitness-client-6.0.6.41837-linux_x64.deb"
    tar -xf data.tar.xz
}

package() {
    cd "${srcdir}/extracted"

    # Copy all files from the extracted package
    cp -r opt "${pkgdir}/"
    cp -r usr "${pkgdir}/"

    # Set proper permissions
    chmod -R 755 "${pkgdir}/opt"
    chmod -R 755 "${pkgdir}/usr"

    # Make sure executables are executable
    find "${pkgdir}/opt/networkoptix/client/${pkgver}.41837/bin" -type f -executable -exec chmod 755 {} \;
}

# vim:set ts=2 sw=2 et: