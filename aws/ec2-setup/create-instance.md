
# EC2 Instance Creation Guide 🚀

This guide explains how to launch an **Ubuntu EC2 instance** on AWS.

---

## 1. Launch Instance

1. Log in to the **AWS Management Console** → Navigate to **EC2** → Click **Launch Instance**.  
2. **Name and Tags:** Give your server a recognizable name (e.g., `server1`).  
3. **Application and OS Images (AMI):** Select **Ubuntu** (specifically **Ubuntu 22.04 LTS** AMI).  

   ![AMI Selection](./screenshots/ec21.png)

4. **Instance Type:** Choose **t2.micro** (Free Tier eligible) or your preferred spec.

---

## 2. Key Pair Selection 🔑

You need a key pair to log into your instance securely.

* **If creating a new key pair:**
    1. Click **Create new key pair**.  
    2. Name it (e.g., `my-aws-key`).  
    3. Select **RSA** and **.pem**.  
    4. **Download the file:** Save it securely.  
       *Note: You cannot download this file again once you leave this screen.*

* **If using an existing key pair:** Ensure you have the `.pem` file accessible on your local machine.

### 🛡️ Secure Your Key (Linux/Mac)

SSH requires strict permissions. Run this command in your terminal to restrict access:

```bash
chmod 400 /path/to/your-key.pem
```

---

## 3. Configure Security Group 🔒

1. Create a new security group or select an existing one.  
2. Add inbound rules:
   - **SSH**: port 22, source = your IP (for secure SSH connection)  
   - **HTTP**: port 80, source = anywhere (`0.0.0.0/0`)  
3. Configure storage if needed.  
4. Review and launch.  

   ![Security Group Configuration](./screenshots/ec22.png)

---