# --- Global Args ---
ARG USERNAME=nixdev
ARG HOSTNAME=container-env
ARG REPO_URL="https://gitlab.com/infraflakes/nix-flakes"
ARG REPO_BRANCH="container"

FROM debian:bookworm-slim
ARG USERNAME
ARG HOSTNAME
ARG REPO_URL
ARG REPO_BRANCH

# 1. Install prerequisites
RUN apt-get update && apt-get install -y \
    git fish opendoas \
    && rm -rf /var/lib/apt/lists/*

# 2. Setup User & Nix Path
RUN useradd -m $USERNAME && \
    mkdir -m 0755 /nix && chown $USERNAME /nix && \
    # Configure doas: permit the user to run commands as root without a password
    echo "permit nopass $USERNAME as root" > /etc/doas.conf

USER $USERNAME
WORKDIR /home/$USERNAME
ENV USER=$USERNAME

# 3. Install Nix (Single-user mode)
RUN curl -L https://nixos.org/nix/install | sh -s -- --no-daemon

# 4. Configure Environment
ENV PATH="/home/$USERNAME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:${PATH}"
RUN mkdir -p ~/.config/nix && \
    echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf && \
    echo "cores = 0" >> ~/.config/nix/nix.conf && \
    echo "auto-optimise-store = true" >> ~/.config/nix/nix.conf && \
    echo "max-jobs = auto" >> ~/.config/nix/nix.conf

# 5. Build/Activate via Flake
RUN git clone -b $REPO_BRANCH $REPO_URL container
WORKDIR /home/$USERNAME/container
RUN nix run nixpkgs#home-manager -- switch --flake .#${USERNAME}@${HOSTNAME}

WORKDIR /home/$USERNAME
CMD ["/usr/bin/fish"]
