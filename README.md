# 🚀 Django CI/CD Deployment Project

This project demonstrates an end-to-end DevOps workflow for deploying a Django web application using CI/CD pipelines, reverse proxy configuration, and AWS cloud services.

---

# 📌 Project Overview

This project showcases the deployment of a Django application using a production-like environment with:

- CI/CD automation using Jenkins
- Reverse proxy using Nginx
- Cloud storage for static/media files using AWS S3
- Managed database using AWS RDS
- Deployment on AWS EC2

The goal of this project is to simulate a real-world production deployment pipeline.

---

# 🏗️ System Architecture

User → Nginx → Gunicorn → Django Application
                     ↓
                AWS RDS (Database)
                     ↓
                AWS S3 (Static/Media Files)
                     ↓
              Jenkins (CI/CD Pipeline)

---

# ⚙️ Tech Stack

- Backend: Django (Python Web Framework)
- CI/CD: Jenkins
- Web Server / Reverse Proxy: Nginx
- Application Server: Gunicorn
- Cloud Platform: AWS (EC2, S3, RDS)
- OS: Ubuntu Linux
- Version Control: Git & GitHub

---

# 🔄 CI/CD Pipeline Workflow

1. Code is pushed to GitHub repository
2. Jenkins detects the changes and triggers a build
3. Jenkins performs:
   - Install dependencies
   - Run migrations
   - Collect static files
   - Health checks
4. Deploys on EC2
5. Restarts Gunicorn
6. Nginx serves application

---

# 🌐 Deployment Details

## EC2 Setup
- Ubuntu AWS EC2 instance used for hosting

## Nginx
- Reverse proxy to Gunicorn

## Database
- AWS RDS PostgreSQL

## Static Files
- AWS S3 storage

---

# 🔐 Security

- Environment variables used for secrets
- No credentials stored in repo
- Jenkins credentials for pipeline
- AWS IAM roles (if configured)

---

# ⚠️ Challenges Faced

- Nginx 502 errors
- Static files not loading from S3
- Jenkins permission issues
- RDS connection security groups

---

# 📈 Key Learnings

- CI/CD with Jenkins
- Production Django deployment
- Nginx reverse proxy
- AWS EC2, S3, RDS integration
- Debugging deployment issues

---

# 🎯 Future Improvements

- Docker containerization
- Kubernetes deployment
- Terraform IaC
- Monitoring (Prometheus/Grafana)

---

# 👨‍💻 Author

DevOps Learning Project
