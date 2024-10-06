# **Automating Golden Image Hardening Pipeline: Securing Cloud Deployments**

## **Description**
This project automates the creation of secure, hardened Amazon Machine Images (AMIs) using **AWS EC2 Image Builder** and **Terraform**. The pipeline ensures that all AMIs are up-to-date with the latest security patches and hardened to best practices, making them ready for deployment in production environments. By leveraging **Infrastructure as Code (IaC)**, the pipeline guarantees scalability, security, and efficiency across AWS deployments.

### **Key Features**:
- **Automated Image Creation**: Automatically creates secure AMIs based on Amazon Linux 2 using EC2 Image Builder.
- **Security Hardening**: Applies AWS components for OS hardening and patching to ensure compliance with security standards.
- **IAM Policy Boundaries**: Implements IAM Permission Boundaries to prevent privilege escalation and secure cloud infrastructure.
- **Terraform Integration**: Manages the entire pipeline through Terraform for scalability and ease of maintenance.

### **Project Structure**:
```bash
├── terraform/                       
│   ├── main.tf                      # Terraform configuration for pipeline, IAM roles, and infrastructure
│   ├── policies/
│   │   ├── iam_permission_boundary.json   # IAM Permission Boundary policy
├── scripts/
│   └── install_packages.sh          # Script to install security tools and apply updates
├── configs/
│   └── ec2-image-recipe.json        # Image recipe defining components and base AMI
```

### **Getting Started**:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/golden-image-hardening-pipeline.git
   cd golden-image-hardening-pipeline
   ```

2. **Configuration**:
   - Update `main.tf` with your **AWS region** and **account details**.
   - Customize the **IAM Permission Boundaries** and **hardening components** as needed.

3. **Deploy the Pipeline**:
   ```bash
   terraform init
   terraform apply
   ```

4. **Monitor the Pipeline**:
   - The pipeline will automatically build and harden the AMI. You can monitor the progress via the AWS Management Console or the AWS CLI.

---

### **Contributing**:
Contributions are welcome! If you’d like to propose changes, please open an issue or submit a pull request. For major changes, open an issue first to discuss.

---

### **License**:
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

---

### **Contact**:
If you have questions or need support, reach out via [tanishka.marrott@gmail.com] or open an issue in this repository.

