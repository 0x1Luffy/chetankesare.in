# Portfolio container deployment

This site is a static HTML portfolio and is served by Nginx in a lightweight container.

## Build and run locally

```bash
docker build -t chetankesare-portfolio:latest .
docker run --rm -p 6232:6232 chetankesare-portfolio:latest
```

Or with Docker Compose:

```bash
docker compose up -d --build
```

## Oracle VM deployment

1. Copy the project folder to your Oracle VM.
2. Install Docker and Docker Compose plugin.
3. From the project directory, run:

```bash
docker compose up -d --build
```

4. Verify the container:

```bash
docker ps
docker logs chetankesare-portfolio
curl http://127.0.0.1:6232/healthz
```

5. Your site will be reachable at http://140.238.229.225:6232 once the container is running. If you want it reachable from the internet, allow TCP 6232 in your Oracle Cloud firewall/security list.
