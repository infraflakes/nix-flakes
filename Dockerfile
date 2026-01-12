# --- Global Args ---
ARG USERNAME=nixdev
ARG HOSTNAME=container-env
ARG SHELL=fish
ARG REPO_URL="https://gitlab.com/infraflakes/nix-flakes"
ARG REPO_BRANCH="container"

FROM debian:bookworm-slim

# Re-declare ARGs to bring them into this build stage's scope
ARG USERNAME
ARG HOSTNAME
ARG REPO_URL
ARG REPO_BRANCH

# 1. Install prerequisites
RUN apt-get update && apt-get install -y \
    curl xz-utils git $SHELL sudo \
    && rm -rf /var/lib/apt/lists/*

# 2. Setup User & Nix Path
RUN useradd -m -s /usr/bin/$SHELL $USERNAME && \
    echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    mkdir -m 0755 /nix && chown $USERNAME /nix

USER $USERNAME
WORKDIR /home/$USERNAME
ENV USER=$USERNAME
ENV SHELL=/usr/bin/$SHELL

# 3. Install Nix (Single-user mode)
RUN curl -L https://nixos.org/nix/install | sh -s -- --no-daemon

# 4. Configure Environment
ENV PATH="/home/$USERNAME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:${PATH}"
RUN mkdir -p ~/.config/nix && \
    echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf && \
    echo "cores = 0" >> ~/.config/nix/nix.conf && \
    echo "max-jobs = auto" >> ~/.config/nix/nix.conf

# 5. Build/Activate via Flake
RUN git clone -b $REPO_BRANCH $REPO_URL container
WORKDIR /home/$USERNAME/container
RUN nix run nixpkgs#home-manager -- switch --flake .#${USERNAME}@${HOSTNAME}

CMD /usr/bin/$SHELL --login
