# Project A -  Frontend

## Project Overview

This project is a frontend service providing brief purpose/functionalities.
The service is fully containerized with Docker, automated through a CI/CD pipeline, and is designed for deployment on AWS EC2, Kubernetes, ensuring scalability, resilience, and maintainability with best security practices.

## Architecture

    [Git Repository(Push)] 
        |
        v
    [CI/CD Pipeline (GitHub Actions security pipeline)]
        |
        v
    [Test, Docker-Build, Scurity scans,  Push to Registry]
        |
        v
    [Deploy to EC2(Staging or Production)]
        
## Key Points:

    - Multi-environment deployment (dev, staging, prod)
    - Automated build, test, security scans, and deployment


### Pipeline stages:
- sonar-qube code quality workflow runs
- Gitleaks workflow runs
- Test_build workflow run

- Checkout code from Git repository
    - Run linting and dependencies scan
    - Run unit tests 
    - Build Docker image

- scan_push workflow runs 
    - trivy security FS scan
    - trivy image security scan
    - Push Docker image to private ECR (On approval)
    - On approval, deploy to EC2

### picture of a successful CICD 
![Architecture Diagram](images/image.png)


## Configuration & Secrets
    
-   workflow secrets are stored in github secrets
- workflow variable are stored in github variable
-   Configs differ per environment:
-       local Env
-       staging Env
-       production Env



##  Running docker container Locally (DevOps Perspective)
```
    # clone the repo to your local machine
     git clone https://github.com/Felix-John-coder/Final_Assessment_-_springer_capital.git

    # change directory 
    cd Final_Assessment_-_springer_capital

    # Build Docker image
    docker build -t frontend:latest .

    # Run container locally
    docker run -p 80:80 --name front frontend:latest

    # Check logs
    docker logs -f front
```