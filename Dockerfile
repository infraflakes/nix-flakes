# --- Global Args ---
ARG USERNAME=nixdev
ARG HOSTNAME=container-env
ARG REPO_URL="https://gitlab.com/infraflakes/nix-flakes"
ARG REPO_BRANCH="container"

FROM alpine:latest
ARG USERNAME
ARG HOSTNAME
ARG REPO_URL
ARG REPO_BRANCH

# 1. Install Alpine-native Nix, git, and fish shell
# We pull shadow to let us manage user groups safely
RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk update && apk add --no-cache \
    nix shadow git fish curl xz

# 2. Setup Dedicated User & Group Layout
# Alpine's native Nix package looks for the 'nixbld' group
RUN groupadd -g 30000 nixbld && \
    useradd -m -s /usr/bin/fish -G nixbld $USERNAME && \
    mkdir -m 0755 /nix && chown $USERNAME:$USERNAME /nix

USER $USERNAME
WORKDIR /home/$USERNAME
ENV USER=$USERNAME

# 3. Configure Nix Environment for Flakes & User Store Access
ENV PATH="/home/$USERNAME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:${PATH}"
RUN mkdir -p ~/.config/nix && \
    echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf && \
    echo "cores = 0" >> ~/.config/nix/nix.conf && \
    echo "auto-optimise-store = true" >> ~/.config/nix/nix.conf && \
    echo "max-jobs = auto" >> ~/.config/nix/nix.conf

# 4. Build/Activate via Flake
RUN git clone -b $REPO_BRANCH $REPO_URL container
WORKDIR /home/$USERNAME/container
RUN nix run nixpkgs#home-manager -- switch --flake .#${USERNAME}@${HOSTNAME}

WORKDIR /home/$USERNAME
CMD ["/usr/bin/fish"]
