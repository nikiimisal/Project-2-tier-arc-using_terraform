# Two-Tier Architecture using Terraform on AWS

## 📌 Overview
This project implements a **Two-Tier Architecture** on **AWS** using **Terraform**.
It is designed for beginners and interview preparation, focusing on **clear separation of infrastructure layers**.

Terraform enables **Infrastructure as Code (IaC)**, which means the entire AWS setup is written in code and can be:
- Version controlled
- Reused
- Recreated easily
- Destroyed safely (easily)

>For the 3-tier architecture, I haven’t created separate documentation as the steps are slightly similar. All related code is available in the repository.<br>
👉[click here](https://github.com/nikiimisal/Project-code-3-tier-arc-using_terraform)


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


| **2-tier-arc dig**    | **img**          | **best-practice**          |
|--------------------------------|------------------------------------|------------------------------------|
| ![VS](https://github.com/nikiimisal/Project-2-tier-arc-using_terraform/blob/main/img/12334.png?raw=true) | ![AWS](https://github.com/nikiimisal/Project-2-tier-arc-using_terraform/blob/main/img/kk.gif?raw=true) | ![AWS](https://github.com/nikiimisal/Project-2-tier-arc-using_terraform/blob/main/img/123.jpg?raw=true) |

---

## 📁 Project Folder Structure

```
2-tier-project/
├── main.tf        # Core infrastructure code
├── variables.tf   # Input variables
├── outputs.tf     # Output values
└── README.md      # Project documentation
```

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

---

## 🔐 Security Groups (Firewall Rules)

A security group is used to control inbound and outbound traffic.

### Allowed Inbound Rules
- SSH (22) → Server access
- HTTP (80) → Web traffic
- MySQL (3306) → Database access

### Outbound Rules
- Allow all outbound traffic

---

## 💻 EC2 Instances

### 🟢 Public Server (Web/App Server)
- Located in **public subnet**
- Has **public IP**
- Handles application traffic
- Can connect to DB server internally

---

### 🔵 Private Server (Database Server)
- Located in **private subnet**
- No public IP
- Accessible only from public server
- Used for database storage

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


---

## 🚀 How to Deploy This Project

### Step 0: Entering the 2-tier arc project Folder

<p align="center">
  <img src="https://github.com/nikiimisal/Project-2-tier-arc-using_terraform/blob/main/img/Screenshot%202025-12-15%20205546.png?raw=true" width="500" alt="Initialize Repository Screenshot">
</p>
 

### Step 1: Initialize Terraform
```
terraform init
```

 <p align="center">
  <img src="https://github.com/nikiimisal/Project-2-tier-arc-using_terraform/blob/main/img/Screenshot%202025-12-15%20211424.png?raw=true" width="500" alt="Initialize Repository Screenshot">
</p>


### Step 2: Validate Configuration
```
terraform validate
```

### Step 3: Preview Resources
```
terraform plan
```

 <p align="center">
  <img src="https://github.com/nikiimisal/Project-2-tier-arc-using_terraform/blob/main/img/Screenshot%202025-12-15%20211613.png?raw=true" width="500" alt="Initialize Repository Screenshot">
 </p>

### Step 4: Create Infrastructure
```
terraform apply
```

 <p align="center">
  <img src="https://github.com/nikiimisal/Project-2-tier-arc-using_terraform/blob/main/img/Screenshot%202025-12-15%20211948.png?raw=true" width="500" alt="Initialize Repository Screenshot">
 </p>

### Step 5: Destroy Infrastructure
```
terraform destroy
```

 <p align="center">
  <img src="https://github.com/nikiimisal/Project-2-tier-arc-using_terraform/blob/main/img/Screenshot%202025-12-15%20221524.png?raw=true" width="500" alt="Initialize Repository Screenshot">
 </p>
---

## 📌 Terraform Backend
- Uses **S3 backend**
- Stores Terraform state remotely
- Enables:
  - State safety
  - Team collaboration
  - Recovery

```
terraform {
  backend "s3" {
    bucket = "gdfs23"
    key    = "terraform.tfstate"
    region = "eu-north-1"
  }
}

```

 <p align="center">
  <img src="https://github.com/nikiimisal/Project-2-tier-arc-using_terraform/blob/main/img/Screenshot%202025-11-25%20155703.png?raw=true" width="500" alt="Initialize Repository Screenshot">
 </p>
---

## Out-Put's

>The screenshots show the outputs that are generated from the 2-tier architecture project code.

1️⃣  Created instances.

<p align="center">
  <img src="https://github.com/nikiimisal/Project-2-tier-arc-using_terraform/blob/main/img/Screenshot%202025-12-15%20220113.png?raw=true" width="500" alt="Initialize Repository Screenshot">
</p>

2️⃣  VPC


<p align="center">
  <img src="https://github.com/nikiimisal/Project-2-tier-arc-using_terraform/blob/main/img/Screenshot%202025-12-15%20220212.png?raw=true" width="500" alt="Initialize Repository Screenshot">
</p>

3️⃣  Subnet's


<p align="center">
  <img src="https://github.com/nikiimisal/Project-2-tier-arc-using_terraform/blob/main/img/Screenshot%202025-12-15%20220415.png?raw=true" width="500" alt="Initialize Repository Screenshot">
</p>

4️⃣  Route Table

<p align="center">
  <img src="https://github.com/nikiimisal/Project-2-tier-arc-using_terraform/blob/main/img/Screenshot%202025-12-15%20220430.png?raw=true" width="500" alt="Initialize Repository Screenshot">
</p>

5️⃣ Internate Gateway

<p align="center">
  <img src="https://github.com/nikiimisal/Project-2-tier-arc-using_terraform/blob/main/img/Screenshot%202025-12-15%20220454.png?raw=true" width="500" alt="Initialize Repository Screenshot">
</p>


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

## 🧠 Explanation in Simple
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
