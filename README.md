# Maven Demo — Spring Boot & DevOps

A containerized Spring Boot REST API with PostgreSQL, Docker Compose, and an automated CI/CD workflow using GitHub Actions and Docker Hub.

## Overview

This project demonstrates backend development and DevOps practices, including REST API development, database integration, automated testing, Docker containerization, health checks, and automated Docker image publishing.

## Tech Stack

- **Language:** Java 11
- **Framework:** Spring Boot 2.7.18
- **Build Tool:** Apache Maven
- **Database:** PostgreSQL 16
- **Database Access:** Spring JDBC (`JdbcTemplate`)
- **Containerization:** Docker
- **Container Orchestration:** Docker Compose
- **CI/CD:** GitHub Actions
- **Container Registry:** Docker Hub

## Architecture

```text
Developer
   |
   v
GitHub Repository
   |
   v
GitHub Actions
   |
   +--> Maven Build and Tests
   |
   +--> Docker Image Build
   |
   +--> Publish Image to Docker Hub
           |
           v
      Docker Compose
           |
           +--> Spring Boot REST API
           |
           +--> PostgreSQL Database
```

The application and database run in separate containers. Docker Compose manages their configuration, networking, health checks, and persistent database storage.

## Features

- REST API developed with Spring Boot
- PostgreSQL integration using `JdbcTemplate`
- Multi-stage Docker build
- Docker Compose deployment
- Application and database health checks
- Automated Maven verification with GitHub Actions
- Automated Docker image publishing to Docker Hub on pushes to `main`
- Docker image tags: `latest` and the Git commit SHA
- Persistent PostgreSQL storage using a Docker volume

## API Endpoints

### `GET /api/hello`

Returns the application status.

Example response:

```json
{
  "message": "Hello DevOps!",
  "application": "maven-demo",
  "status": "running"
}
```

### `GET /api/products`

Returns products retrieved from PostgreSQL.

Example response:

```json
[
  {
    "id": 1,
    "name": "Laptop",
    "price": 250000.00
  }
]
```

## Run the Application

### Prerequisites

- Git
- Docker Desktop with Docker Compose
- Internet access to pull the Docker images

### 1. Clone the repositories

Clone the application repository:

```bash
git clone https://github.com/AshanTharaka/maven-demo.git
```

Clone the repository containing the Docker Compose configuration, if it is published separately:

```bash
git clone <DOCKER_COMPOSE_REPOSITORY_URL>
```

The Compose repository should contain `compose.yaml` and a local `.env` file with the required database settings. Do not commit `.env` or publish real credentials.

### 2. Configure environment variables

In the directory containing `compose.yaml`, create a local `.env` file with the variables required by the Compose configuration:

```dotenv
POSTGRES_DB=your_database
POSTGRES_USER=your_database_user
POSTGRES_PASSWORD=replace_with_a_strong_password
```

Use values appropriate for your environment. Keep `.env` out of version control.

### 3. Start the services

From the directory containing `compose.yaml`, run:

```bash
docker compose up -d --pull always
```

This pulls the configured application image from Docker Hub and starts the application and PostgreSQL services.

### 4. Check service health

```bash
docker compose ps
```

Wait until both services are healthy before testing the API.

### 5. Test the API

```bash
curl http://localhost:8081/api/hello
curl http://localhost:8081/api/products
```

The products endpoint requires a working PostgreSQL connection and available product data.

### 6. Stop the services

```bash
docker compose down
```

The named PostgreSQL volume is retained by default, so database data can persist between container restarts. To delete the database volume as well, use `docker compose down -v` only when you intentionally want to remove the stored data.

## Continuous Integration and Image Publishing

The GitHub Actions workflow is located at `.github/workflows/ci.yml`.

For pushes to `main` and pull requests targeting `main`, the workflow runs Maven verification and builds a Docker image.

For pushes to `main`, the workflow also logs in to Docker Hub using GitHub Actions secrets and publishes two tags:

- `latest` — the most recently published image
- `<git-commit-sha>` — an image associated with a specific commit

The repository uses these GitHub Actions secrets:

- `DOCKERHUB_USERNAME`
- `DOCKERHUB_TOKEN`

Secret values must be configured in GitHub repository settings and must never be committed to the repository.

## Learning Goals

This project is part of my hands-on learning journey in backend engineering and DevOps, focusing on REST APIs, database integration, automated testing, containerization, CI/CD, and deployment workflows.

## Author

**Ashan Tharaka**

GitHub: [AshanTharaka](https://github.com/AshanTharaka)
