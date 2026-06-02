ARG USERNAME=nixenv
ARG HOSTNAME=nixenv
ARG REPO_URL="https://github.com/infraflakes/nixenv"

FROM alpine:latest
ARG USERNAME
ARG HOSTNAME
ARG REPO_URL

RUN apk add --no-cache bash fish curl git openssh-client xz less coreutils && \
    adduser -D -u 1000 -s /bin/bash $USERNAME && \
    mkdir -m 0755 /nix && chown $USERNAME:$USERNAME /nix

USER $USERNAME
WORKDIR /home/$USERNAME
ENV USER=$USERNAME
ENV HOME=/home/$USERNAME

RUN curl -L https://nixos.org/nix/install | sh -s -- --no-daemon

# explicit hardware tuning & flake configuration
RUN mkdir -p ~/.config/nix && \
    echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf && \
    echo "cores = 0" >> ~/.config/nix/nix.conf && \
    echo "auto-optimise-store = true" >> ~/.config/nix/nix.conf && \
    echo "max-jobs = auto" >> ~/.config/nix/nix.conf

RUN git clone --depth=1 $REPO_URL && \
    . ~/.nix-profile/etc/profile.d/nix.sh && \
    nix run nixpkgs#home-manager -- switch --flake ./nixenv#${USERNAME}@${HOSTNAME}

CMD ["sh", "-c", "/home/${USER}/.nix-profile/bin/fish"]
