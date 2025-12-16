# Two-Tier Architecture using Terraform on AWS

## 📌 Overview
This project implements a **Two-Tier Architecture** on **AWS** using **Terraform**.
It is designed for beginners and interview preparation, focusing on **clear separation of infrastructure layers**.

Terraform enables **Infrastructure as Code (IaC)**, which means the entire AWS setup is written in code and can be:
- Version controlled
- Reused
- Recreated easily
- Destroyed safely

---

## 🏗 What is Two-Tier Architecture?

A Two-Tier Architecture divides the system into **two logical layers**:

### 1️⃣ Web / Application Tier (Public)
- Runs inside a **public subnet**
- Connected to the **Internet Gateway**
- Has a **public IP address**
- Handles:
  - HTTP requests
  - Application logic
  - User interaction

### 2️⃣ Database Tier (Private)
- Runs inside a **private subnet**
- **No direct internet access**
- More secure
- Stores application data (example: MySQL)

This separation improves:
- 🔐 Security
- ⚙ Manageability
- 📈 Scalability (future ready)

---

## 🖼 Architecture Diagram
(Add architecture diagram screenshot here)

Suggested diagram:
- VPC
- Public Subnet → Web Server
- Private Subnet → DB Server
- Internet Gateway attached to VPC

---

## 📁 Project Folder Structure

2-tier-project/
├── main.tf        # Core infrastructure code
├── variables.tf   # Input variables
├── outputs.tf     # Output values
└── README.md      # Project documentation

(Add project folder screenshot here)

---

## 🌐 Network Design

### VPC
- CIDR: `10.0.0.0/16`
- Acts as a private network in AWS

### Subnets
| Layer | Subnet Type | CIDR |
|-----|------------|------|
| Web Tier | Public | 10.0.16.0/20 |
| DB Tier | Private | 10.0.0.0/20 |

(All values are configurable in `variables.tf`)

---

## 🌍 Internet Connectivity

### Internet Gateway (IGW)
- Attached to the VPC
- Allows internet access for the public subnet

### Route Table
- Route: `0.0.0.0/0 → IGW`
- Applied to public subnet

(Add route table screenshot here)

---

## 🔐 Security Groups (Firewall Rules)

A security group is used to control inbound and outbound traffic.

### Allowed Inbound Rules
- SSH (22) → Server access
- HTTP (80) → Web traffic
- MySQL (3306) → Database access

### Outbound Rules
- Allow all outbound traffic

(Add security group rules screenshot here)

---

## 💻 EC2 Instances

### 🟢 Public Server (Web/App Server)
- Located in **public subnet**
- Has **public IP**
- Handles application traffic
- Can connect to DB server internally

(Add public EC2 screenshot here)

---

### 🔵 Private Server (Database Server)
- Located in **private subnet**
- No public IP
- Accessible only from public server
- Used for database storage

(Add private EC2 screenshot here)

---

## 📄 Terraform Files Explained

### main.tf
Contains:
- AWS provider
- VPC
- Subnets
- Internet Gateway
- Route table
- Security group
- EC2 instances

(Add `terraform apply` success screenshot here)

---

### variables.tf
Used to define reusable values:
- Region
- Availability Zones
- CIDR blocks
- AMI ID
- Instance type
- Key pair name
- Project name

This helps avoid hardcoding values.

---

### outputs.tf
Displays useful information after deployment:
- Public IP of web server
- Private IP of database server

(Add terraform output screenshot here)

---

## 🚀 How to Deploy This Project

### Step 1: Initialize Terraform
terraform init

### Step 2: Validate Configuration
terraform validate

### Step 3: Preview Resources
terraform plan

### Step 4: Create Infrastructure
terraform apply

### Step 5: Destroy Infrastructure
terraform destroy

---

## 📌 Terraform Backend
- Uses **S3 backend**
- Stores Terraform state remotely
- Enables:
  - State safety
  - Team collaboration
  - Recovery

(Add S3 bucket screenshot here)

---

## 🎯 Key Terraform Concepts Used
- Providers
- Resources
- Variables
- Outputs
- Backend (S3)
- Dependency management
- Infrastructure as Code (IaC)

---

## 🧠 Interview Explanation (Simple)
“This project demonstrates a two-tier AWS architecture using Terraform where the web server is deployed in a public subnet and the database server is deployed in a private subnet, ensuring security and separation of concerns.”

---

## 🔮 Future Enhancements
- Add NAT Gateway for private subnet
- Replace DB EC2 with Amazon RDS
- Add Application Load Balancer
- Convert project into Terraform modules
- Add Auto Scaling Group
- Create dev & prod environments

---

## ✅ Conclusion
This project provides hands-on experience with:
- AWS networking
- Terraform automation
- Real-world architecture design

It is suitable for:
- Beginners
- DevOps learners
- Interview preparation
- Portfolio projects

---
