### Personal env flakes for podman/docker setup.

Build the image:
```bash
podman build -t nixenv https://github.com/infraflakes/nixenv/raw/main/Dockerfile
```

Create the container:
```bash
podman run -it --network host --name nixenv nixenv
```

Reattach to the stopped container:
```bash
podman start -ai nixenv
```

Access the running container:
```bash
podman exec -it nixenv /usr/bin/fish
```
