# 🚀 End-to-End CI/CD Pipeline with Jenkins, Docker & Kubernetes

A hands-on DevOps project demonstrating an end-to-end CI/CD workflow from source code in GitHub to a containerized Spring Boot application deployed on Kubernetes.

This project was built using AWS EC2, Jenkins, Git, GitHub, Maven, Docker, Docker Hub, Kubernetes and Minikube.

---

# 📌 Project Overview

The objective of this project was to understand how a DevOps pipeline works from source code to application deployment.

The application starts as Java source code stored in GitHub.

Jenkins checks out the source code and builds the application using Maven.

The generated Spring Boot JAR is then packaged into a Docker image.

Jenkins authenticates securely with Docker Hub and pushes the image.

The Docker image is then deployed to a Kubernetes cluster running on a separate AWS EC2 instance using Minikube.

Kubernetes runs two replicas of the application and exposes them through a NodePort Service.

Finally, the application is accessed through a browser.

---

# 🏗️ Final Architecture

```text
                         ┌──────────────────┐
                         │      GitHub      │
                         │  Source Code     │
                         └────────┬─────────┘
                                  │
                                  ▼
                         ┌──────────────────┐
                         │     Jenkins      │
                         │      CI/CD       │
                         └────────┬─────────┘
                                  │
                                  ▼
                         ┌──────────────────┐
                         │      Maven       │
                         │   Build JAR      │
                         └────────┬─────────┘
                                  │
                                  ▼
                         ┌──────────────────┐
                         │      Docker      │
                         │  Build Image     │
                         └────────┬─────────┘
                                  │
                                  ▼
                         ┌──────────────────┐
                         │    Docker Hub    │
                         │ Store Image      │
                         └────────┬─────────┘
                                  │
                                  │ docker pull
                                  ▼
                  ┌──────────────────────────────┐
                  │    AWS EC2 - Kubernetes     │
                  │                              │
                  │       Minikube Cluster      │
                  │                              │
                  │   ┌──────────┐ ┌──────────┐ │
                  │   │   Pod 1   │ │   Pod 2   │ │
                  │   │  Running  │ │  Running  │ │
                  │   └────┬─────┘ └────┬─────┘ │
                  │        │              │       │
                  │        └──────┬───────┘       │
                  │               ▼               │
                  │       Kubernetes Service      │
                  │            NodePort           │
                  └──────────────┬───────────────┘
                                 │
                                 ▼
                         ┌──────────────────┐
                         │  Spring Boot     │
                         │   Application    │
                         └──────────────────┘
