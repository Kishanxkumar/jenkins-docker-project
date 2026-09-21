# 🚀 End-to-End DevOps CI/CD Pipeline with Jenkins, Docker & Kubernetes

A hands-on DevOps project implementing a complete CI/CD workflow from source code management to application deployment on Kubernetes.

This project demonstrates how multiple DevOps tools can be integrated together to build, package, containerize, publish, and deploy a Spring Boot application.

The project was implemented using:

**AWS EC2 | Linux | Git | GitHub | Jenkins | Maven | Java 21 | Spring Boot | Docker | Docker Hub | Kubernetes | Minikube | kubectl**

---

# 📌 Project Overview

The goal of this project was to gain practical, hands-on experience with an end-to-end DevOps workflow.

Instead of learning each tool individually, I integrated the tools into one complete workflow.

The application starts as source code stored in GitHub and goes through Jenkins CI/CD automation, Maven packaging, Docker containerization, Docker Hub image storage, and finally Kubernetes deployment.

---

# 🔄 Complete DevOps Workflow

```text
Developer
    │
    ▼
 GitHub
    │
    ▼
 Jenkins
    │
    ▼
 Git Checkout
    │
    ▼
 Maven Build
    │
    ▼
 Spring Boot JAR
    │
    ▼
 Docker Build
    │
    ▼
 Docker Image
    │
    ▼
 Docker Hub
    │
    ▼
 Docker Pull
    │
    ▼
 Kubernetes / Minikube
    │
    ▼
 Deployment
    │
    ├───────────────┐
    ▼               ▼
  Pod 1            Pod 2
 Running           Running
    │               │
    └───────┬───────┘
            ▼
   Kubernetes Service
            │
            ▼
      Spring Boot App
            │
            ▼
         Browser
🏗️ Project Architecture
                         ┌───────────────────┐
                         │      GitHub       │
                         │   Source Code     │
                         └─────────┬─────────┘
                                   │
                                   ▼
                         ┌───────────────────┐
                         │      Jenkins      │
                         │      CI / CD      │
                         └─────────┬─────────┘
                                   │
                                   ▼
                         ┌───────────────────┐
                         │       Maven       │
                         │    Build JAR      │
                         └─────────┬─────────┘
                                   │
                                   ▼
                         ┌───────────────────┐
                         │      Docker       │
                         │   Build Image     │
                         └─────────┬─────────┘
                                   │
                                   ▼
                         ┌───────────────────┐
                         │    Docker Hub     │
                         │  Image Registry   │
                         └─────────┬─────────┘
                                   │
                                   │ docker pull
                                   ▼
                 ┌────────────────────────────────┐
                 │       AWS EC2 - Ubuntu         │
                 │                                │
                 │       Minikube Cluster         │
                 │                                │
                 │   ┌──────────┐  ┌──────────┐  │
                 │   │   Pod 1   │  │   Pod 2   │  │
                 │   │  Running  │  │  Running  │  │
                 │   └─────┬────┘  └────┬─────┘  │
                 │         │             │         │
                 │         └──────┬──────┘         │
                 │                ▼                │
                 │      Kubernetes Service         │
                 │             NodePort             │
                 └────────────────┬────────────────┘
                                  │
                                  ▼
                         ┌───────────────────┐
                         │   Spring Boot     │
                         │   Application     │
                         └───────────────────┘
☁️ AWS EC2

AWS EC2 was used to create the cloud infrastructure for the project.

Two separate EC2 environments were used.

Jenkins Server
Operating System : Amazon Linux 2023
Instance Type    : t3.small
RAM              : 2 GB
Jenkins Port     : 8080
Kubernetes Server
Operating System : Ubuntu
Instance Type    : c7i-flex.large
RAM              : ~4 GB
AWS concepts practiced
EC2 instance creation
Instance types
Linux server access
SSH
Security Groups
Inbound ports
Public IP access
Resource monitoring
CPU and memory considerations
Cloud infrastructure management
🐧 Linux

Linux was the main operating-system environment used for the DevOps tools.

I worked with Linux on both Amazon Linux and Ubuntu EC2 servers.

Linux concepts learned
SSH
Users
Groups
File permissions
Directory structure
Environment variables
Processes
Services
Package installation
Disk management
Memory monitoring
Networking
Ports
Troubleshooting
Linux commands practiced
ls
cd
pwd
mkdir
rm
cp
mv
cat
nano
chmod
chown
ps
top
free
df
curl
ssh
Linux service management
systemctl status
systemctl start
systemctl restart
systemctl enable
journalctl
🔀 Git

Git was used for source-code version control.

Git concepts learned
Repository
Working directory
Staging area
Commits
Branches
Remote repositories
Git history
Push
Pull
Version control
Git commands practiced
git init
git status
git add .
git commit -m "commit message"
git branch
git branch -M main
git remote -v
git push
git pull
git log
🐙 GitHub

GitHub was used as the remote source-code repository.

Repository
Kishanxkumar/jenkins-docker-project

GitHub acts as the source-code location for the Jenkins pipeline.

What I learned
Creating repositories
GitHub repository management
Connecting local Git repositories with GitHub
Working with the main branch
Pushing source code
Maintaining project files
Using GitHub as the CI/CD source
☕ Java 21

Java was used as the application programming language.

Java Version: 21

The application initially started as a simple Java program and was later converted into a Spring Boot web application.

What I learned
Java project structure
Java compilation
JAR files
Running Java applications
Java runtime
Java applications inside Docker
Java 21 with Spring Boot
🌱 Spring Boot

The original Java application was converted into a Spring Boot web application.

This was an important change because the first application was a short-lived process that exited after printing a message.

The final application runs continuously as a web application.

Application endpoint
GET /
Application response
Hello from Jenkins + Docker + Kubernetes!
Application port
8080
What I learned
Spring Boot application structure
REST endpoints
Embedded Tomcat
Application ports
Running Spring Boot with Maven
Packaging Spring Boot applications
Executable JAR files
Running Spring Boot inside Docker
Long-running application processes
Application lifecycle
📦 Maven

Maven was used to build and package the Java/Spring Boot application.

Maven Version: 3.9.16
Installation: /opt/maven
Maven command
mvn clean package
Maven concepts learned
pom.xml
Dependencies
Plugins
Build lifecycle
Clean phase
Package phase
JAR packaging
Maven integration with Jenkins
Generated artifact
target/jenkins-docker-project-1.0.jar
⚙️ Jenkins

Jenkins was the main CI/CD automation tool used in the project.

Jenkins was installed on an AWS EC2 instance and configured to automate the build and Docker image creation process.

Jenkins concepts learned
Jenkins Controller
Built-In Node
Nodes
Executors
Jobs
Builds
Workspaces
Console Output
Plugins
Credentials
Pipeline
Jenkinsfile
Pipeline stages
Environment variables
Tool configuration
CI/CD automation
Troubleshooting
🧩 Jenkins Pipeline

The Jenkins pipeline automates the following process:

GitHub
   ↓
Checkout
   ↓
Maven Build
   ↓
Docker Build
   ↓
Docker Tag
   ↓
Docker Hub Login
   ↓
Docker Push
   ↓
Docker Logout
📄 Jenkinsfile

The Jenkins pipeline contains the following stages:

pipeline {
    agent any

    tools {
        maven 'Maven-3.9.16'
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Kishanxkumar/jenkins-docker-project.git'
            }
        }

        stage('Maven Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Docker Build & Push') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub-credentials',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASS'
                    )
                ]) {
                    sh 'chmod +x build-and-push.sh'
                    sh './build-and-push.sh'
                }
            }
        }
    }
}
Jenkins workspace
/var/lib/jenkins/workspace/jenkins-docker-pipeline
Jenkins skills practiced
Creating Jenkins jobs
Creating Pipeline jobs
Configuring Maven
Connecting Jenkins with GitHub
Running shell commands
Reading console output
Understanding builds
Understanding workspaces
Understanding executors
Managing credentials
Integrating Jenkins with Docker
Troubleshooting Jenkins
🔐 Jenkins Credentials

Docker Hub authentication was handled using Jenkins Credentials.

Instead of storing the Docker Hub token directly inside the project, credentials were securely stored in Jenkins.

Credential ID
dockerhub-credentials

The pipeline accesses the credentials through environment variables.

withCredentials([
    usernamePassword(
        credentialsId: 'dockerhub-credentials',
        usernameVariable: 'DOCKER_USER',
        passwordVariable: 'DOCKER_PASS'
    )
])
What I learned
Jenkins Credentials
Credential IDs
Secure authentication
Environment variables
Access tokens
Avoiding hard-coded credentials
Secure CI/CD practices
🐳 Docker

Docker was used to containerize the Spring Boot application.

Docker concepts learned
Docker images
Docker containers
Dockerfile
Image layers
Image tags
Containers
Port mapping
Docker daemon
Docker permissions
Docker registry
Image build
Image push
Image pull
Docker commands practiced
docker --version
docker ps
docker images
docker build
docker run
docker stop
docker pull
docker push
docker tag
docker login
docker logout
docker inspect
📄 Dockerfile

The application was packaged using the following Dockerfile:

FROM eclipse-temurin:21-jre

COPY target/jenkins-docker-project-1.0.jar /app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app.jar"]
Dockerfile concepts learned
Base images
JRE images
COPY
EXPOSE
ENTRYPOINT
Application artifacts
Container startup
Application ports
🧪 Docker Application Testing

The Docker image was built locally using:

docker build -t jenkins-docker-project:test .

The container was started using:

docker run --rm -p 8081:8080 jenkins-docker-project:test

The application was tested using:

curl http://localhost:8081/

Response:

Hello from Jenkins + Docker + Kubernetes!

This verified that the Spring Boot application was successfully running inside a Docker container.

🐋 Docker Hub

Docker Hub was used as the container image registry.

Repository
kishan272/jenkins-docker-project

The Jenkins pipeline automatically:

Build Docker Image
        ↓
Tag Image
        ↓
Login to Docker Hub
        ↓
Push Image
        ↓
Push latest
        ↓
Logout
🏷️ Docker Image Versioning

The Jenkins build number was used as the Docker image tag.

For example:

Jenkins Build #5
       ↓
kishan272/jenkins-docker-project:5

The image was also tagged as:

kishan272/jenkins-docker-project:latest
What I learned
Docker image tags
Versioning
Docker Hub repositories
latest tag
Docker authentication
Image push
Image pull
Container registry concepts
🔄 Automated Docker Build & Push

A shell script named:

build-and-push.sh

was created to automate Docker image building and pushing.

#!/bin/bash

set -e

IMAGE_NAME="kishan272/jenkins-docker-project"
IMAGE_TAG="${BUILD_NUMBER:-1}"

echo "Building Docker image..."

docker build -t "$IMAGE_NAME:$IMAGE_TAG" .

echo "Tagging image as latest..."

docker tag "$IMAGE_NAME:$IMAGE_TAG" "$IMAGE_NAME:latest"

echo "Logging in to Docker Hub..."

printf '%s' "$DOCKER_PASS" | docker login \
-u "$DOCKER_USER" \
--password-stdin

echo "Pushing image..."

docker push "$IMAGE_NAME:$IMAGE_TAG"

echo "Pushing latest tag..."

docker push "$IMAGE_NAME:latest"

docker logout

echo "Docker image pushed successfully!"

echo "Image: $IMAGE_NAME:$IMAGE_TAG"

This allows Jenkins to automatically create a versioned Docker image based on the Jenkins build number.

☸️ Kubernetes

Kubernetes was used for container orchestration and application deployment.

A separate Ubuntu EC2 instance was configured with Kubernetes tools.

Tools used
Kubernetes
Minikube
kubectl
Docker
Kubernetes concepts learned
Kubernetes Cluster
Control Plane
Nodes
Pods
Deployments
ReplicaSets
Replicas
Services
NodePort
Labels
Selectors
Container ports
Target ports
Application exposure
🧪 Minikube

Minikube was used to create a local Kubernetes cluster running on the Ubuntu EC2 server.

Minikube version
v1.39.0
Start cluster
minikube start --driver=docker
Check cluster status
minikube status
Check Kubernetes node
kubectl get nodes

The node successfully reached:

STATUS: Ready
What I learned
Kubernetes cluster creation
Minikube
Docker driver
Cluster lifecycle
Starting and stopping clusters
Cluster status verification
🧰 kubectl

kubectl was used to communicate with and manage the Kubernetes cluster.

Commands practiced
kubectl get nodes
kubectl get pods
kubectl get pods -o wide
kubectl get deployments
kubectl get svc
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl delete deployment jenkins-docker-app
kubectl port-forward service/jenkins-docker-service 8080:80 --address 0.0.0.0
What I learned
Kubernetes resource management
Checking cluster status
Checking Pods
Checking Deployments
Checking Services
Applying YAML manifests
Deleting resources
Port forwarding
Kubernetes troubleshooting
📦 Docker Image Pull on Kubernetes Server

Before deploying the application, the Docker image was pulled from Docker Hub.

docker pull kishan272/jenkins-docker-project:5

The image was successfully downloaded.

This verified that the Kubernetes environment could access the Docker Hub image.

🚀 Kubernetes Deployment

The application was deployed using a Kubernetes Deployment.

deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: jenkins-docker-app
spec:
  replicas: 2
  selector:
    matchLabels:
      app: jenkins-docker-app
  template:
    metadata:
      labels:
        app: jenkins-docker-app
    spec:
      containers:
        - name: jenkins-docker-app
          image: kishan272/jenkins-docker-project:5
          ports:
            - containerPort: 8080

The Deployment was created using:

kubectl apply -f deployment.yaml
🔁 Kubernetes Replicas

The Deployment was configured with:

replicas: 2

Kubernetes created two application Pods.

jenkins-docker-app-54bbfbf6c-l9dmq
        ↓
1/1 Running

jenkins-docker-app-54bbfbf6c-tfvfk
        ↓
1/1 Running
What I learned
Pods
Deployments
ReplicaSets
Desired state
Replica management
Running multiple application instances
Kubernetes maintaining replicas
🌐 Kubernetes Service

A Kubernetes Service was created to expose the application.

service.yaml
apiVersion: v1
kind: Service
metadata:
  name: jenkins-docker-service
spec:
  selector:
    app: jenkins-docker-app
  ports:
    - protocol: TCP
      port: 80
      targetPort: 8080
  type: NodePort

The Service was created using:

kubectl apply -f service.yaml
🔌 Kubernetes NodePort

The Service was checked using:

kubectl get svc

The Service was assigned:

Service Port : 80
Target Port  : 8080
NodePort     : 31942

Example:

jenkins-docker-service
NodePort
80:31942/TCP
What I learned
Kubernetes Services
Service discovery
Labels
Selectors
Port mapping
Target ports
NodePort
Exposing Pods
🔄 Kubernetes Application Flow
Browser
    ↓
AWS EC2
    ↓
Kubernetes NodePort / Port Forwarding
    ↓
Kubernetes Service
    ↓
Service Selector
    ↓
Pod
    ↓
Spring Boot
    ↓
Port 8080
💥 Kubernetes CrashLoopBackOff Problem

One of the most important troubleshooting experiences in this project was the first Kubernetes deployment.

The original application was a simple Java program:

public static void main(String[] args) {
    System.out.println("Hello from Jenkins + Maven + Docker!");
}

The program printed the message and then exited.

When deployed to Kubernetes, the container stopped because the main process terminated.

Kubernetes then attempted to restart the container.

The Pods showed states such as:

Completed
CrashLoopBackOff
🔍 Root Cause

The application was a short-lived process.

Kubernetes Deployments are designed for workloads where the container process remains running.

Because the Java application exited immediately, Kubernetes kept restarting it.

🛠️ Solution

The application was converted into a Spring Boot web application.

The new application starts an embedded Tomcat server and continuously listens on:

8080

The final endpoint:

GET /

returns:

Hello from Jenkins + Docker + Kubernetes!

The old Deployment was removed:

kubectl delete deployment jenkins-docker-app

The new Spring Boot image was then built, pushed to Docker Hub and deployed to Kubernetes.

Key lesson

The application lifecycle must be understood before deploying containers to Kubernetes.

🛠️ Troubleshooting Experience

This project involved solving real infrastructure and deployment issues.

1. Jenkins Node Offline
Problem

Jenkins displayed:

Waiting for next available executor

The Built-In Node was offline because Jenkins detected insufficient temporary disk space.

The /tmp filesystem had limited capacity.

Solution

Jenkins temporary disk thresholds were adjusted.

Free Temp Space Threshold: 100 MiB
Warning Threshold: 200 MiB

The Jenkins node became available again.

Learned
Jenkins node monitoring
Temporary disk space
Executors
Jenkins resource thresholds
Node troubleshooting
2. EC2 Memory Limitation
Problem

The initial Jenkins EC2 instance was:

t3.micro

with approximately:

1 GB RAM

The Spring Boot Maven build caused significant memory pressure and became extremely slow.

Solution

The Jenkins EC2 instance was upgraded to:

t3.small

with approximately:

2 GB RAM

After the upgrade, the Jenkins pipeline completed successfully.

Learned
EC2 resource sizing
Memory monitoring
Diagnosing slow builds
Infrastructure sizing
Resource planning
3. Jenkins Docker Permission
Problem

Jenkins needed permission to communicate with Docker.

Solution

Jenkins was added to the Docker group:

sudo usermod -aG docker jenkins
sudo systemctl restart jenkins

Docker access was verified with:

sudo -u jenkins docker ps
Learned
Linux groups
Docker permissions
Docker daemon
Jenkins-Docker integration
Service restart and verification
4. Kubernetes CrashLoopBackOff
Problem

The original Java application exited immediately.

Kubernetes restarted the container repeatedly.

Solution

The application was converted into a Spring Boot web application that remains running.

Learned
Container lifecycle
Pod lifecycle
CrashLoopBackOff
Application process management
Kubernetes troubleshooting
5. Minikube Cluster Recovery

After restarting the Kubernetes EC2 server, the Minikube cluster was initially stopped.

The cluster was restarted using:

minikube start --driver=docker

The cluster was then verified:

minikube status
kubectl get nodes

The node returned to:

Ready
Learned
Minikube lifecycle
Cluster recovery
Kubernetes connectivity
Cluster status verification
🔐 Security Practices

Security was considered during the CI/CD setup.

Sensitive credentials were not hard-coded into the Jenkinsfile.

Docker Hub authentication was handled using Jenkins Credentials.

The Docker Hub access token was stored securely inside Jenkins.

Sensitive information should never be committed to GitHub, including:

Passwords
Access Tokens
AWS Access Keys
Private Keys
.pem files
.env files
Kubernetes Secrets

AWS Security Group rules should also be restricted to trusted IP addresses whenever possible.

🧪 Application Testing

The application was tested at multiple stages.

Java / Spring Boot
java -jar target/jenkins-docker-project-1.0.jar --server.port=8081

Test:

curl http://localhost:8081/

Response:

Hello from Jenkins + Docker + Kubernetes!
Docker

Build:

docker build -t jenkins-docker-project:test .

Run:

docker run --rm -p 8081:8080 jenkins-docker-project:test

Test:

curl http://localhost:8081/

Response:

Hello from Jenkins + Docker + Kubernetes!
Kubernetes

Check Pods:

kubectl get pods -o wide

Result:

1/1 Running
1/1 Running

Check Service:

kubectl get svc

Result:

jenkins-docker-service
NodePort
80:31942/TCP

Final application response:

Hello from Jenkins + Docker + Kubernetes!
📊 Final Project Results

The project successfully achieved:

✅ AWS EC2 Infrastructure
✅ Linux Server Administration
✅ Git Version Control
✅ GitHub Repository
✅ Jenkins CI/CD Pipeline
✅ Jenkins Pipeline Stages
✅ Maven Build Automation
✅ Java 21
✅ Spring Boot
✅ Executable JAR
✅ Docker Containerization
✅ Dockerfile
✅ Docker Image Versioning
✅ Docker Hub Registry
✅ Jenkins Credentials
✅ Secure Docker Authentication
✅ Kubernetes Cluster
✅ Minikube
✅ kubectl
✅ Kubernetes Deployment
✅ Kubernetes Pods
✅ Kubernetes Replica Management
✅ 2 Running Replicas
✅ Kubernetes Service
✅ NodePort
✅ Port Forwarding
✅ Application Access
✅ Troubleshooting
🧠 What I Learned From This Project

This project helped me understand how different DevOps technologies work together as one complete system.

Git & GitHub

I learned how source code is version-controlled, committed and maintained in a remote GitHub repository.

I also learned how GitHub can act as the source for a Jenkins CI/CD pipeline.

Jenkins

I learned how Jenkins automates repetitive development and deployment tasks.

I gained practical experience with:

Jobs
Builds
Pipelines
Stages
Nodes
Executors
Workspaces
Credentials
Plugins
Console output
Tool configuration
Maven

I learned how Maven manages Java application builds, dependencies and packaging.

I learned how a Java/Spring Boot project can be converted into a deployable JAR artifact.

Docker

I learned how applications can be packaged into portable containers.

I gained practical experience with:

Dockerfiles
Images
Containers
Tags
Ports
Port mapping
Registries
Image push
Image pull
Docker Hub

I learned how Docker images can be stored and distributed using a container registry.

I also learned the importance of image versioning instead of relying only on the latest tag.

Kubernetes

I learned how Kubernetes manages containerized applications.

I gained practical experience with:

Pods
Deployments
ReplicaSets
Replicas
Services
NodePort
Labels
Selectors
Port mapping
AWS

I learned how cloud infrastructure can be used to host DevOps tools and environments.

I also learned how infrastructure resources such as memory and instance size can affect application builds and deployments.

Linux

I improved my practical Linux skills, including:

SSH
Permissions
Users and groups
Processes
Services
Networking
Disk monitoring
Memory monitoring
Troubleshooting
Troubleshooting

The biggest learning experience was troubleshooting real issues.

I learned that DevOps is not only about knowing commands or tools.

It is also about understanding:

Problem
   ↓
Observation
   ↓
Logs
   ↓
Root Cause
   ↓
Solution
   ↓
Verification
🎯 DevOps Skills Demonstrated
☁️ Cloud
AWS EC2
Security Groups
Instance Management
Cloud Infrastructure
Resource Monitoring
🐧 Operating System
Linux
SSH
Users & Groups
File Permissions
Processes
Services
Networking
Disk Monitoring
Memory Monitoring
🔀 Version Control
Git
GitHub
Branches
Commits
Remote Repositories
Version Control
⚙️ CI/CD
Jenkins
Jenkins Pipeline
Jenkinsfile
Pipeline Stages
Builds
Workspaces
Executors
Credentials
Environment Variables
📦 Build Automation
Maven
pom.xml
Dependencies
Plugins
Build Lifecycle
JAR Packaging
☕ Application
Java 21
Spring Boot
REST Endpoint
Embedded Tomcat
Application Ports
Executable JAR
🐳 Containerization
Docker
Dockerfile
Images
Containers
Image Tags
Port Mapping
Docker Daemon
Container Registry
🐋 Container Registry
Docker Hub
Image Push
Image Pull
Image Versioning
Docker Authentication
☸️ Container Orchestration
Kubernetes
Minikube
kubectl
Pods
Deployments
ReplicaSets
Replicas
Services
NodePort
Labels
Selectors
Port Forwarding
🔧 Troubleshooting
Jenkins Node Issues
Disk Space Issues
Memory Issues
Docker Permission Issues
Container Lifecycle Issues
CrashLoopBackOff
Minikube Connectivity
Application Deployment
📁 Project Structure
jenkins-docker-project/
│
├── .git/
├── .gitignore
├── Dockerfile
├── Jenkinsfile
├── build-and-push.sh
├── deployment.yaml
├── service.yaml
├── pom.xml
├── README.md
│
├── src/
│   └── main/
│       └── java/
│           └── com/
│               └── example/
│                   └── App.java
│
└── target/
    └── jenkins-docker-project-1.0.jar
📄 Important Project Files
pom.xml

The Maven configuration defines the Spring Boot application and dependencies.

<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
         https://maven.apache.org/xsd/maven-4.0.0.xsd">

    <modelVersion>4.0.0</modelVersion>

    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>3.5.6</version>
        <relativePath/>
    </parent>

    <groupId>com.example</groupId>
    <artifactId>jenkins-docker-project</artifactId>
    <version>1.0</version>

    <properties>
        <java.version>21</java.version>
    </properties>

    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
    </dependencies>

    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
            </plugin>
        </plugins>
    </build>

</project>
📄 App.java
package com.example;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class App {

    public static void main(String[] args) {
        SpringApplication.run(App.class, args);
    }

    @GetMapping("/")
    public String home() {
        return "Hello from Jenkins + Docker + Kubernetes!";
    }
}
📄 Dockerfile
FROM eclipse-temurin:21-jre

COPY target/jenkins-docker-project-1.0.jar /app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app.jar"]
📄 Kubernetes Deployment
apiVersion: apps/v1
kind: Deployment
metadata:
  name: jenkins-docker-app
spec:
  replicas: 2
  selector:
    matchLabels:
      app: jenkins-docker-app
  template:
    metadata:
      labels:
        app: jenkins-docker-app
    spec:
      containers:
        - name: jenkins-docker-app
          image: kishan272/jenkins-docker-project:5
          ports:
            - containerPort: 8080
📄 Kubernetes Service
apiVersion: v1
kind: Service
metadata:
  name: jenkins-docker-service
spec:
  selector:
    app: jenkins-docker-app
  ports:
    - protocol: TCP
      port: 80
      targetPort: 8080
  type: NodePort
🧪 Important Commands
Git
git init
git status
git add .
git commit -m "commit message"
git branch -M main
git remote -v
git push -u origin main
git pull
git log
Maven
mvn -version
mvn clean package
Java
java -version
java -jar target/jenkins-docker-project-1.0.jar
Docker
docker --version
docker ps
docker images
docker build -t image-name .
docker run image-name
docker run --rm -p 8081:8080 image-name
docker tag image-name repository/image:tag
docker push repository/image:tag
docker pull repository/image:tag
docker login
docker logout
docker inspect
Jenkins
Jenkins Dashboard
Jobs
Builds
Console Output
Pipeline
Stages
Credentials
Nodes
Executors
Workspaces
Tools
Kubernetes
kubectl get nodes
kubectl get pods
kubectl get pods -o wide
kubectl get deployments
kubectl get svc
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl delete deployment jenkins-docker-app
kubectl port-forward service/jenkins-docker-service 8080:80 --address 0.0.0.0
Minikube
minikube start --driver=docker
minikube status
minikube service jenkins-docker-service --url
📸 Project Milestones

The project was validated at multiple stages.

Milestone 1 — Jenkins
Jenkins Pipeline
       ↓
Build SUCCESS
Milestone 2 — Docker
Docker Image
       ↓
Successfully Built
Milestone 3 — Docker Hub
kishan272/jenkins-docker-project:5

The versioned image was successfully pushed to Docker Hub.

Milestone 4 — Kubernetes Cluster
Minikube
    ↓
Running

Kubernetes Node
    ↓
Ready
Milestone 5 — Kubernetes Deployment
Deployment
    ↓
2 Replicas
    ↓
Pod 1 → 1/1 Running
Pod 2 → 1/1 Running
Milestone 6 — Kubernetes Service
jenkins-docker-service
       ↓
NodePort
       ↓
80:31942/TCP
Milestone 7 — Final Application
Hello from Jenkins + Docker + Kubernetes!

The application was successfully accessed through the Kubernetes environment.

📈 End-to-End Result

The final implementation connects:

GitHub
   ↓
Jenkins
   ↓
Maven
   ↓
Spring Boot
   ↓
Docker
   ↓
Docker Hub
   ↓
Kubernetes
   ↓
Minikube
   ↓
Deployment
   ↓
2 Replicas
   ↓
Service
   ↓
Application
🔮 Future Improvements

The current project demonstrates the complete CI/CD and Kubernetes deployment workflow.

Possible future improvements include:

GitHub Webhooks
Automatic Jenkins triggering
Automated Kubernetes deployment from Jenkins
Terraform for AWS infrastructure provisioning
Amazon EKS
Kubernetes Ingress
ConfigMaps
Kubernetes Secrets
Prometheus monitoring
Grafana dashboards
SonarQube
Trivy container image scanning
Automated rollback
Liveness probes
Readiness probes
Horizontal Pod Autoscaling
Centralized logging
CI/CD notifications
🚀 Future DevOps Architecture

The project can be extended into:

Developer
    ↓
GitHub
    ↓
GitHub Webhook
    ↓
Jenkins
    ↓
Maven Build
    ↓
Docker Build
    ↓
Security Scan
    ↓
Docker Hub
    ↓
Kubernetes / Amazon EKS
    ↓
Deployment
    ↓
Service / Ingress
    ↓
Application
    ↓
Prometheus
    ↓
Grafana
🎯 Key Takeaways

This project helped me move from learning individual DevOps tools to understanding how they work together in a real deployment workflow.

The major concepts practiced were:

Source Control
      ↓
CI/CD Automation
      ↓
Build Automation
      ↓
Application Packaging
      ↓
Containerization
      ↓
Container Registry
      ↓
Container Orchestration
      ↓
Application Deployment
      ↓
Service Exposure
      ↓
Troubleshooting

The project also gave me practical experience with troubleshooting real-world issues involving:

Jenkins
Linux
AWS EC2
Docker
Maven
Spring Boot
Kubernetes
Minikube
Networking
Memory
Disk Space
Permissions
Application Lifecycle
🏁 Project Status
STATUS: COMPLETED ✅

The end-to-end CI/CD pipeline and Kubernetes deployment were successfully implemented and tested.

👨‍💻 Author
Kishan Kumar N

Aspiring Cloud & DevOps Engineer

Technologies
AWS
Linux
Git
GitHub
Jenkins
Docker
Docker Hub
Kubernetes
Minikube
kubectl
Maven
Java 21
Spring Boot
CI/CD
Terraform
⭐ Project Highlights
☁️ AWS Cloud Infrastructure
🐧 Linux Administration
🔀 Git & GitHub
⚙️ Jenkins CI/CD
📦 Maven Build Automation
☕ Java 21
🌱 Spring Boot
🐳 Docker Containerization
🐋 Docker Hub
☸️ Kubernetes
🧪 Minikube
🧰 kubectl
🔐 Jenkins Credentials
🔄 Automated Docker Build & Push
📈 Kubernetes Replicas
🌐 Kubernetes Service
🛠️ Real-World Troubleshooting
📚 Skills Gained
Cloud Computing
Linux Administration
Git & GitHub
CI/CD
Jenkins
Pipeline Automation
Build Automation
Maven
Java
Spring Boot
Docker
Dockerfile
Docker Images
Docker Containers
Docker Hub
Container Registry
Kubernetes
Minikube
kubectl
Pods
Deployments
ReplicaSets
Services
NodePort
Port Forwarding
AWS EC2
Security Groups
Resource Monitoring
Troubleshooting
Application Deployment
DevOps Practices
🔖 Tags

#DevOps #AWS #Jenkins #Docker #Kubernetes #CI/CD #Linux #Git #GitHub #Maven #Java #SpringBoot #DockerHub #Minikube #CloudComputing #CloudEngineer #DevOpsEngineer
