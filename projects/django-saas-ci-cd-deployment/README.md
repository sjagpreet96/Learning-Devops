# Django SaaS CI/CD Deployment

## Executive Summary

This repository presents a production-grade deployment of a Django-based SaaS application leveraging AWS infrastructure and Linux tooling. The implementation demonstrates a full-stack DevOps workflow with application hosting on EC2, reverse proxy configuration with Nginx, persistent storage in AWS S3, managed database services through AWS RDS, and a planned Jenkins CI/CD pipeline.

## Key Technologies

- Django
- AWS EC2
- AWS S3
- AWS RDS
- Nginx
- Gunicorn / uWSGI
- Linux shell scripting
- GitHub version control
- Jenkins (planned CI/CD)

## Solution Architecture

- `EC2` serves as the application host for the Django service.
- `Nginx` functions as a reverse proxy and static content handler.
- `AWS S3` is used for durable storage of static and media assets.
- `AWS RDS` provides a managed relational database backend.
- `GitHub` is used for source control and repository documentation.

## Implementation Summary

- Provisioned a Linux EC2 instance for application deployment.
- Configured Nginx to proxy HTTP traffic to the Django application server.
- Integrated the Django application with AWS RDS for persistent data storage.
- Configured AWS S3 for static and media file handling.
- Documented deployment procedures and operational troubleshooting.
- Verified networking, security group rules, and application availability.

## Repository Structure

- `jenkins/` - placeholder for Jenkins pipeline configuration and automation scripts.
- `nginx/` - Nginx configuration files used for the deployment.
- `scripts/` - setup and deployment scripts for EC2 instance initialization.
- `Issues_faced/README.md` - operational issues and resolution notes.

## Deployment Considerations

- Ensure the EC2 security group permits inbound HTTP/HTTPS and SSH traffic.
- Enable the active Nginx site configuration by linking from `sites-available` to `sites-enabled`.
- Use `python manage.py migrate --run-syncdb` when database migrations do not create schema objects automatically.
- Validate browser access using the correct protocol (HTTP or HTTPS) for the service.
- Confirm that GitHub access tokens include repository permissions for source checkout.

## Operational Insights

The implementation captured several real-world deployment challenges:

- Browser access failure when HTTPS was attempted against an HTTP deployment.
- Git clone failures caused by insufficient token permissions.
- Python dependency installation failures resolved by installing required OS packages: `python3-dev`, `default-libmysqlclient-dev`, `build-essential`, and `pkg-config`.
- Missing database tables resolved by using `python manage.py migrate --run-syncdb`.
- Nginx site configuration not enabled initially; resolved by creating the symlink to `sites-enabled`.

## Next Phase: Jenkins CI/CD

Planned Jenkins automation will cover:

- source checkout from GitHub
- dependency installation
- Django database migrations
- test execution
- deployment to EC2
- application restart and verification

## Presentation for Stakeholders

This repository can be presented as a documented DevOps deployment case study that highlights:

- AWS infrastructure deployment
- Django production deployment with Nginx
- AWS S3 and RDS integration
- troubleshooting and operational resilience
- roadmap for Jenkins-based CI/CD automation

## Usage Guide

1. Review the Nginx configuration files in `nginx/`.
2. Review EC2 setup and deployment scripts in `scripts/`.
3. Review operational issue resolution in `Issues_faced/README.md`.
4. Add Jenkins pipeline artifacts in `jenkins/` as CI/CD automation is implemented.

---

Recommended LinkedIn summary: "Deployed a Django SaaS application on AWS using EC2, Nginx, S3, and RDS, with documented deployment practices and a roadmap for Jenkins CI/CD."