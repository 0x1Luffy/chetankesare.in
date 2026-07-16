# Portfolio container deployment

This site is a static HTML portfolio and is served by Nginx in a lightweight container.

## Build and run locally

```bash
docker buildx build --platform linux/arm64 -t 0x1luffy/portfolio:latest --load .
docker run --rm -p 6232:6232 0x1luffy/portfolio:latest
```

Or with Docker Compose:

```bash
docker compose up -d --build
```

## Push to Docker Hub

1. Log in to Docker Hub:

```bash
docker login
```

2. Build and push your ARM64 image:

```bash
docker buildx build --platform linux/arm64 -t 0x1luffy/portfolio:latest --push .
```

3. On your VM, pull and run the image from Docker Hub:

```bash
docker pull 0x1luffy/portfolio:latest
docker run -d --name chetankesare-portfolio -p 6232:6232 0x1luffy/portfolio:latest
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
