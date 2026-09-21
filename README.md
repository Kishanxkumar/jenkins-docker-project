# 🚀 End-to-End CI/CD Pipeline with Jenkins, Docker & Kubernetes

A hands-on DevOps project demonstrating an end-to-end CI/CD workflow using GitHub, Jenkins, Maven, Docker, Docker Hub and Kubernetes.

## 🏗️ Architecture

GitHub
↓
Jenkins
↓
Maven Build
↓
Docker Build
↓
Docker Hub
↓
Kubernetes / Minikube
↓
Spring Boot Application

## 🛠️ Technologies Used

- AWS EC2
- Linux
- Git & GitHub
- Jenkins
- Maven
- Java 21
- Spring Boot
- Docker
- Docker Hub
- Kubernetes
- Minikube

## 🔄 CI/CD Workflow

### 1. Source Code

The application source code is maintained in GitHub.

### 2. Jenkins

Jenkins automatically checks out the source code and executes the CI/CD pipeline.

Pipeline stages:

- Checkout
- Maven Build
- Docker Build
- Docker Hub Push

### 3. Maven Build

Jenkins builds the Spring Boot application using Maven.

```bash
mvn clean package
