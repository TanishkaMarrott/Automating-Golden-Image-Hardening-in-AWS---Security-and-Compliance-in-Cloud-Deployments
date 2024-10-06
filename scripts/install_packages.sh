#!/bin/bash
set -e

# Update system packages
echo "Updating system packages..."
yum update -y

# Install security tools
echo "Installing security tools..."
yum install -y fail2ban clamav

# Configure fail2ban to protect against brute force attacks
echo "Configuring fail2ban..."
systemctl enable fail2ban
systemctl start fail2ban

# Install AWS Systems Manager agent for secure access
echo "Installing AWS SSM Agent..."
yum install -y amazon-ssm-agent
systemctl enable amazon-ssm-agent
systemctl start amazon-ssm-agent

# Clean up
echo "Cleaning up..."
yum clean all
