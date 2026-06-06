### Nixenv: containerized and nixified dev environment.

Grab the script:
```bash
curl -sSL "https://raw.githubusercontent.com/infraflakes/nixenv/main/nixenv" -o ~/.local/bin/nixenv
chmod +x ~/.local/bin/nixenv
```

Fetch the image:
```bash
nixenv pull
```

Create the environment:
```bash
nixenv create
```

Accessing the environment:
```bash
nixenv start
```
