# Automating Golden Image Hardening Pipeline: Ensuring Security & Compliance in Cloud Deployments

## **Description**
This project automates the creation, hardening, and distribution of secure Amazon Machine Images (AMIs) using **AWS EC2 Image Builder** and **Terraform**. The pipeline ensures that all AMIs are kept up-to-date with the latest security patches, are compliant with regulatory and organizational standards, and are ready for production deployments. By leveraging **Infrastructure as Code (IaC)** principles, this solution automates the security hardening process at scale, offering consistency and governance across AWS environments.

## **Key Features:**
1. **Automated Image Creation**: The pipeline automatically triggers the creation of AMIs based on a defined image recipe, incorporating Amazon Linux 2 as a base. This ensures that every instance deployed is consistent with security best practices.
   
2. **Security Hardening**: Using pre-configured components (such as OS hardening scripts and security patches), the pipeline applies security controls that reduce the attack surface, enforce encryption, and ensure patching compliance across all deployed AMIs.

3. **IAM Policy Boundaries**: Incorporates IAM Permission Boundaries to prevent privilege escalation and restrict over-provisioning of access rights. This ensures that even users with elevated permissions are constrained within security guardrails.

4. **Terraform Integration**: Manages the entire infrastructure and security pipeline via **Terraform**, ensuring automated, repeatable, and consistent application of security configurations across multiple accounts or regions.

---

## **Technical Workflow**:
The pipeline leverages **AWS EC2 Image Builder** for image creation and hardening, integrated with **Terraform** for automation and infrastructure management.

1. **EC2 Image Builder**:
   - **Step 1**: Define the image recipe, specifying the base AMI (Amazon Linux 2) and including various hardened components such as security configurations, software patches, and pre-installed packages.
   - **Step 2**: Image Builder compiles these components into a hardened image, ensuring every new AMI is compliant with internal and external security standards.
   - **Step 3**: Distribute the hardened AMI across AWS accounts or regions for deployment.

2. **IAM Boundaries & Permissions**:
   - **Step 4**: IAM Permission Boundaries ensure that only approved roles can provision and launch the hardened AMIs. This prevents accidental or unauthorized privilege escalation, enhancing overall cloud security.

3. **Automated Pipeline with Terraform**:
   - **Step 5**: The entire process—image creation, hardening, and distribution—is managed and automated through Terraform. By leveraging Terraform modules, the pipeline can easily scale across multiple AWS regions or accounts, ensuring consistent enforcement of security practices.

4. **Monitoring & Compliance**:
   - **Step 6**: AWS **CloudWatch** and **AWS Config** rules monitor the compliance of these hardened AMIs post-deployment. Custom security checks ensure that AMIs are not only hardened at creation but remain compliant throughout their lifecycle.

---

## **Project Structure:**

```
├── terraform/                       
│   ├── main.tf                      # Terraform configuration for infrastructure, IAM roles, and pipeline automation
│   ├── variables.tf                 # Variables defining region, AMI ID, and other configurations
│   ├── outputs.tf                   # Outputs for generated AMI IDs, etc.
│   ├── policies/                    
│   │   ├── iam_permission_boundary.json   # IAM Permission Boundary policy to restrict admin privileges
│   └── modules/                     # Modular Terraform code for reusability
│       └── image_builder.tf         # AWS EC2 Image Builder configurations
├── scripts/
│   └── install_packages.sh          # Script to install security tools and apply OS updates and patches
├── configs/
│   └── ec2-image-recipe.json        # EC2 Image Builder recipe defining base AMI and hardened components
```

---

## **Getting Started:**

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/golden-image-hardening-pipeline.git
   cd golden-image-hardening-pipeline
   ```

2. **Configure the Pipeline**:
   - Update `main.tf` with your AWS region, account details, and desired configurations.
   - Modify the **IAM Permission Boundaries** and hardening components based on your security policies.

3. **Deploy the Pipeline**:
   - Initialize the Terraform configuration:
     ```bash
     terraform init
     ```
   - Apply the Terraform configuration to deploy the pipeline:
     ```bash
     terraform apply
     ```

4. **Monitor the Pipeline**:
   - Once deployed, the pipeline will automatically create and harden the AMI.
   - You can monitor the pipeline’s progress through the AWS Management Console or via the CLI:
     ```bash
     aws imagebuilder list-image-pipelines
     ```

---

## **Contributing**:
We welcome contributions! If you have ideas or improvements, feel free to **open an issue** or submit a **pull request**. For major changes, start a discussion first.

## **License**:
This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for more details.

## **Contact**:
For questions or support, reach out to [tanishka.marrott@gmail.com] or open an issue in this repository.
