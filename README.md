# Learning DevOps

This repository documents my hands-on DevOps learning journey in public. It is structured as a portfolio of notes, configurations, and deployment projects that show how I am building practical experience with Linux, AWS, web infrastructure, and automation.

The goal of this repository is straightforward:

- build real projects instead of only studying theory
- document what I learned clearly
- keep a  record of troubleshooting and improvements
- create a body of work I can share

## What This Repository Contains

This repository is organized by topic and project:

- `aws/` - AWS-related learning and infrastructure notes
- `linux/` - Linux commands, setup steps, and administration practice
- `nginx/` - Nginx concepts and configuration work
- `bash-scripting/` - shell scripting practice and examples
- `projects/` - end-to-end projects that combine multiple DevOps tools and services

## Featured Project

### Django SaaS Deployment on AWS

My first major project is a deployment-focused case study for a Django multi-tenant application. It includes:

- application hosting on AWS EC2
- PostgreSQL on AWS RDS
- static and media file storage with AWS S3
- Nginx as a reverse proxy
- deployment scripts and troubleshooting notes
- Jenkins integration planned as the next phase

Project link:

- [`projects/django-saas-ci-cd-deployment/`](./projects/django-saas-ci-cd-deployment)

## Current Focus

I am currently extending this project by adding Jenkins-based CI/CD. The design goal is to run Jenkins on a separate EC2 instance from the Django application server so the setup reflects a more realistic production-style architecture.

## What I Am Practicing

Across this repository, I am focusing on:

- Linux server administration
- AWS services and networking fundamentals
- reverse proxy and web server configuration
- application deployment and operations
- CI/CD concepts and tooling
- troubleshooting and clear technical documentation

## Next Steps

The next areas I plan to add or improve are:

- Jenkins pipeline automation
- stronger deployment documentation
- containerization with Docker
- infrastructure as code with Terraform
- monitoring and observability basics

## About This Repository

This is an active learning repository, so content will continue to evolve as I build new projects and refine existing ones.
