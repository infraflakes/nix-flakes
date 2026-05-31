### Personal env flakes for podman/docker setup.

Build the image:
```bash
curl -sSL https://github.com/infraflakes/nixenv/-/raw/container/Dockerfile | podman build -t nixdev -f - .
```

Create the container:
```bash
podman run -it --network host --name nixdev nixdev
```

Reattach to the stopped container:
```bash
podman start -ai nixdev
```

Access the running container:
```bash
podman exec -it nixdev /usr/bin/fish
```
