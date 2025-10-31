# Use Arch Linux as the base image
FROM archlinux:latest

# Install required build dependencies
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
    base-devel \
    binutils \
    curl \
    sudo \
    git \
    pacman-contrib

# Create a non-root user for building
RUN useradd -m -s /bin/bash builder && \
    echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Set working directory
WORKDIR /home/builder

# Copy the PKGBUILD and related files
COPY PKGBUILD networkoptix-client.install ./

# Change ownership to builder user
RUN chown -R builder:builder /home/builder

# Switch to builder user
USER builder

# Install yay (AUR helper) for potential AUR dependencies
RUN git clone https://aur.archlinux.org/yay.git && \
    cd yay && \
    makepkg -si --noconfirm && \
    cd .. && \
    rm -rf yay

# Set the entrypoint to build the package
ENTRYPOINT ["makepkg", "-s"]