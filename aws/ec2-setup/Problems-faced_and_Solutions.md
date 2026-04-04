## Unable to Access EC2 Due to IP/Network Settings

**Problem:**  
```text
  ssh: connect to host <IP address> port 22: Connection timed out

**Causes:**   
  Security group rules blocking your current IP because the IP address in the security group changed.  


**Solution:**  

 **Update security group inbound rules:**  
   Go to Network & Security → Security Groups.
   Select the relevant security group.
   Select SSH and Edit inbound rules.
   Allow SSH (port 22) from your current IP. 
  
(./screenshots/ec26.png)

---