# Issues Faced During Deployment

This document records the main problems I encountered while deploying the Django application and the actions I took to resolve them. It is intended to show the practical troubleshooting side of the project, not just the final working setup.

## 1. Nginx Was Not Reachable in the Browser

### Problem

The server appeared healthy:

- Nginx was running
- the expected ports were open
- network rules looked correct

Even so, the application was not loading in the browser.

![Nginx status](../screenshots/nginx_status.png)
![Open ports](../screenshots/ports.png)

### Cause

The browser was attempting to access the site over `https://`, while the server was only configured for `http://` at that stage.

### Resolution

I tested the URL explicitly with `http://` and confirmed the application was reachable. This helped isolate the issue to protocol mismatch rather than Nginx service health or AWS networking.

## 2. Unable to Clone the Repository

### Problem

The repository clone failed during setup.

![GitHub access error](../screenshots/github_access_error.png)

### Cause

The personal access token was created without the required repository read permission.

### Resolution

I generated a new token with the correct read access and retried the clone successfully.

## 3. `requirements.txt` Installation Failed

### Problem

Installing Python dependencies failed on the EC2 instance.

![Python package build error](../screenshots/build_wheel_error.png)

### Cause

Some Python packages required system-level build and development dependencies that were not installed on the server.

### Resolution

I installed the missing packages:

```bash
sudo apt install python3-dev default-libmysqlclient-dev build-essential pkg-config -y
```

After that, the Python dependency installation completed successfully.

## 4. Database Tables Were Missing After Migration

### Problem

The application still reported missing tables even after running migrations.

![Migration issue](../screenshots/migrations.png)

### Cause

The database schema was not fully created for all required tables.

### Resolution

I ran:

```bash
python manage.py migrate --run-syncdb
```

This created the missing tables and resolved the issue.

## 5. Nginx Was Not Listening on Port 80

### Problem

After updating the site configuration in `sites-available`, Nginx was still not serving traffic on port `80`.

![Nginx configuration](../screenshots/nginx_config.png)

### Cause

The site configuration had been updated, but it was not enabled in `sites-enabled`.

### Resolution

I created the symbolic link:

```bash
sudo ln -s /etc/nginx/sites-available/django /etc/nginx/sites-enabled/
```

Once the site was enabled properly, Nginx started serving the application as expected.

## 6. S3 File Uploads Were Not Saving Through Django

### Problem

The S3 bucket was reachable from the EC2 instance, and I could copy files using Bash and AWS access through the instance role, but uploads from the Django application were not being saved to S3.

### Cause

The issue was caused by using an older Django storage configuration style. In Django 5, the storage configuration syntax changed, and the old approach I was using did not work correctly for the application's file handling.

### Resolution

I updated the project to use the Django 5-compatible `STORAGES` configuration for S3-backed media storage. After correcting the storage settings, Django was able to save files to S3 successfully.

## Why This File Matters

Troubleshooting is a core part of DevOps work. Keeping a record of failures, root causes, and fixes helps build repeatable deployment knowledge and demonstrates practical operational thinking.
