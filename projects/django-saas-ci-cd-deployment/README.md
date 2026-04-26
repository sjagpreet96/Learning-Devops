# Django SaaS Deployment on AWS

This project documents my first end-to-end DevOps deployment for a Django multi-tenant application. The objective was to deploy the application in a production-style environment, connect it to managed AWS services, configure a reverse proxy, and document the issues encountered along the way.

It is part of my public DevOps learning portfolio and is written to demonstrate both technical implementation and problem-solving.

## Project Goals

This project was built to practice:

- deploying a Django application on Linux
- configuring Nginx as a reverse proxy
- connecting Django to AWS RDS
- storing static and media files in AWS S3
- documenting deployment issues and fixes clearly
- building CI/CD automation with Jenkins across development and production environments

## Architecture

Phase 1 deployment flow:

![Current architecture](./screenshots/architecture-phase1.png)


Phase 2 CI/CD flow:

```text
GitHub webhook -> Jenkins -> deploy to development server -> manual approval -> deploy to production server
```

## Stack

- `Django` for the application
- `Gunicorn` as the application server
- `Nginx` as the reverse proxy
- `AWS EC2` for application hosting
- `AWS RDS` for the managed relational database
- `AWS S3` for static and media storage
- `Ubuntu` as the server operating system
- `GitHub` for version control
- `Jenkins` for CI/CD automation

## What This Project Covers

This project includes:

- deploying a Django application on an EC2 instance
- configuring Nginx to serve as the public entry point
- connecting the application to an RDS database
- integrating S3 for file storage
- automating deployment with a Jenkins pipeline triggered by GitHub webhook
- deploying automatically to a development server and promoting to production after approval
- organizing deployment-related scripts and configuration files
- documenting real deployment problems and their solutions

## Project Phases

### Phase 1: Application Deployment

Phase 1 focuses on building and deploying the application in a production-style environment. This stage includes:

- deploying the Django application on EC2
- configuring Gunicorn and Nginx
- connecting the application to AWS RDS
- storing static and media files in AWS S3

### Phase 2: Jenkins CI/CD

Phase 2 adds CI/CD automation with Jenkins. This stage includes:

- triggering builds through a GitHub webhook
- checking out code and preparing the virtual environment
- running Django checks and application tests
- automatically deploying to the development server
- pausing for manual approval before production deployment
- deploying to the production server after approval

## Repository Structure

- `nginx/` - Nginx configuration files used for the deployment
- `scripts/` - helper scripts for setup or deployment tasks
- `jenkins/` - Jenkins pipeline configuration, including the deployment workflow
- `screenshots/` - deployment and application screenshots used in documentation
- `settings.py` - Django configuration showing the deployment setup
- `Issues_faced/README.md` - troubleshooting notes from the project

## Screenshots

The following screenshots capture parts of the deployment and application setup:

### Application

![Application screenshot 1](./screenshots/app1.png)
![Application screenshot 2](./screenshots/app2.png)

### Deployment Evidence

![Gunicorn status](./screenshots/gunicorn.png)
![RDS instance screenshot 1](./screenshots/rds1.png)
![RDS instance screenshot 2](./screenshots/rds2.png)
![Files stored in S3](./screenshots/files_in_s3.png)
![Nginx homepage](./screenshots/nginx_homepage.png)

### CI/CD Evidence

![Jenkins servers](./screenshots/servers.png)
![Jenkins node connected](./screenshots/node_connected.png)
![Pipeline builds](./screenshots/builds.png)
![Manual approval step](./screenshots/user_input.png)
![Deployment success](./screenshots/deploy_success.png)

## Key Learning Outcomes

Through this project, I gained practical experience with:

- Linux-based application deployment
- reverse proxy configuration and web traffic flow
- AWS networking and service integration
- externalizing storage and database dependencies
- CI/CD pipeline design with gated production deployment
- GitHub webhook integration with Jenkins
- debugging deployment and environment issues
- writing technical documentation that explains both process and outcomes

## Challenges Encountered

Some of the issues I ran into during this project included:

- browser requests opening with HTTPS when the server was configured only for HTTP
- repository clone failures caused by incorrect token permissions
- dependency installation failures caused by missing system packages
- Django 5 S3 storage configuration issues caused by using an outdated storage syntax
- missing database tables after migrations
- Nginx configuration changes not taking effect because the site was not enabled correctly
- webhook, Jenkins credential, environment file, and deployment permission issues during CI/CD setup

Detailed notes are available here:

- [`Issues_faced/README.md`](./Issues_faced/README.md)

## Security and Good Practices

While working on this deployment, I focused on basic operational discipline:

- avoiding hardcoded secrets in the repository
- using environment variables for sensitive settings
- managing access through AWS security groups and permissions
- separating infrastructure responsibilities across services

The shared version of `settings.py` is now sanitized for public use and expects sensitive values such as the Django secret key, database credentials, AWS configuration, and third-party API keys to be provided through environment variables.

## CI/CD Workflow

The Jenkins pipeline currently follows this flow:

1. A code push triggers the pipeline through a GitHub webhook.
2. Jenkins checks out the repository.
3. The pipeline sets up the virtual environment and installs dependencies.
4. Django checks and tests run before deployment.
5. The application is deployed to the development server automatically.
6. Jenkins waits for manual approval before production release.
7. After approval, the same deployment flow runs on the production server.

## Next Improvements

The next areas I plan to improve are:

- refining the Jenkins pipeline further
- adding stronger release validation and rollback planning
- extending the project with containerization and infrastructure automation

## Purpose of This Project

This project is intended to show how I approach learning DevOps: by building, troubleshooting, documenting, and improving real deployments in public.
