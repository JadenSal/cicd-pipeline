# CI/CD Pipeline with GitHub Actions, Docker & AWS ECS

## Overview
This project builds a full CI/CD pipeline that automatically deploys a Python Flask app to AWS ECS Fargate using GitHub Actions, Docker, and Terraform.

## Tech Stack
- Python Flask
- Docker
- Terraform
- AWS ECR
- AWS ECS Fargate
- AWS ALB
- GitHub Actions

## Project Structure

cicd-pipeline/
├── app/
│   ├── app.py
│   └── requirements.txt
├── infra/
│   ├── provider.tf
│   ├── networking.tf
│   ├── ecr.tf
│   ├── ecs.tf
│   ├── alb.tf
│   ├── iam.tf
│   └── outputs.tf
├── .github/
│   └── workflows/
│       └── deploy.yml
├── Dockerfile
└── README.md

## Prerequisites
- AWS CLI installed and configured
- Terraform installed
- Docker installed
- GitHub account

## Setup Instructions

### Step 1 - Clone the repo

git clone https://github.com/JadenSal/cicd-pipeline.git
cd cicd-pipeline

### Step 2 - Configure AWS

aws configure

### Step 3 - Deploy Infrastructure

cd infra
terraform init
terraform apply

### Step 4 - Add GitHub Secrets
Go to your GitHub repo Settings → Secrets and add:
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_REGION`

### Step 5 - Push code to trigger pipeline

git add .
git commit -m "deploy"
git push origin main

### Step 6 - Access the app
Open the ALB DNS URL in your browser:

http://cicd-alb-1101863380.us-east-2.elb.amazonaws.com

## How the Pipeline Works
1. Developer pushes code to main branch
2. GitHub Actions triggers automatically
3. Docker image is built
4. Image is pushed to Amazon ECR
5. ECS service is updated with new image
6. App is live at the ALB DNS URL

## Live App URL

http://cicd-alb-1101863380.us-east-2.elb.amazonaws.com