# --- Global Args ---
ARG USERNAME=nixdev
ARG HOSTNAME=nixenv
ARG REPO_URL="https://github.com/infraflakes/nix-flakes"

FROM nixos/nix:latest
ARG USERNAME
ARG HOSTNAME
ARG REPO_URL

# 1. Create a workspace home folder and assign full user permissions over /nix
# Since we don't have useradd, we can just manually craft a home environment.
RUN mkdir -p /home/$USERNAME && \
    chown -R 1000:1000 /nix /etc/nix /home/$USERNAME

USER 1000:1000
WORKDIR /home/$USERNAME
ENV USER=$USERNAME
ENV HOME=/home/$USERNAME

# 2. Configure Nix Environment for Flakes
ENV PATH="/home/$USERNAME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:${PATH}"
RUN mkdir -p ~/.config/nix && \
    echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf && \
    echo "cores = 0" >> ~/.config/nix/nix.conf && \
    echo "auto-optimise-store = true" >> ~/.config/nix/nix.conf && \
    echo "max-jobs = auto" >> ~/.config/nix/nix.conf

# 3. Build/Activate your Home-Manager profile via your Flake
RUN git clone $REPO_URL container
WORKDIR /home/$USERNAME/container
RUN nix run nixpkgs#home-manager -- switch --flake .#${USERNAME}@${HOSTNAME}

WORKDIR /home/$USERNAME

# 4. Drop into the fish shell built directly by your home-manager layer!
CMD ["nix-shell", "-p", "fish", "--run", "fish"]
