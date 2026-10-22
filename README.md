# Maven Demo — Spring Boot & DevOps

A containerized Spring Boot REST API integrated with PostgreSQL, Docker Compose, and GitHub Actions CI.

## Overview

This project demonstrates a basic backend application with automated testing, containerization, database integration, and continuous integration.

## Tech Stack

- **Language:** Java 11
- **Framework:** Spring Boot 2.7.18
- **Build Tool:** Apache Maven
- **Database:** PostgreSQL 16
- **Containerization:** Docker
- **Container Orchestration:** Docker Compose
- **CI:** GitHub Actions

## Architecture

```text
Client
  |
  v
Spring Boot REST API
  |
  v
PostgreSQL Database

Docker Compose manages the application
and database containers.

GitHub Actions runs the Maven build and tests.
```

## Features

- REST API built with Spring Boot
- PostgreSQL database integration using `JdbcTemplate`
- Docker multi-stage build
- Docker Compose for running the application and database
- Container health check
- Automated Maven build and tests with GitHub Actions

## API Endpoints

### GET `/api/hello`

Returns a simple application status response.

Example response:

```json
{
  "message": "Hello DevOps!",
  "application": "maven-demo",
  "status": "running"
}
```

### GET `/api/products`

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

## Run the Project

### Prerequisites

- Git
- Docker Desktop with Docker Compose

### Start the application

Clone the repository:

```bash
git clone https://github.com/AshanTharaka/maven-demo.git
cd maven-demo
```

Build the application Docker image:

```bash
docker build -t maven-demo:local .
```

**Note:** The PostgreSQL service is currently configured in a separate Docker Compose project. To run the full application, use the Compose configuration and environment file from your `docker-compose-demo` setup. Ensure its `app` service builds or references the correct `maven-demo` image.

### Test the API

```bash
curl http://localhost:8081/api/hello
curl http://localhost:8081/api/products
```

### Check container status

Run this from the directory containing the Compose configuration:

```bash
docker compose ps
```

### Stop the containers

From the same Compose directory:

```bash
docker compose down
```



```

## Continuous Integration

GitHub Actions runs the Maven verification lifecycle when changes are pushed to `main` or a pull request targets `main`.

The pipeline runs:

```bash
mvn --batch-mode clean verify
```

## Learning Goals

This project is part of my hands-on learning journey in backend development and DevOps, focusing on REST APIs, database integration, containerization, automated testing, and CI.

## Author

**Ashan Tharaka**

GitHub: [AshanTharaka](https://github.com/AshanTharaka)
