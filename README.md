# Docker-iac-network-deployment
This project simulates a small-scale infrastructure using Docker and IaC concepts. It includes a web and DNS service on a shared network, Ubuntu clients with firewall rules, and a segregated backend network with a MySQL database.

---

## Table of Content

1. [Project Overview](#project-overview)
2. [Architecture and Topology](#architecture-and-topology)
3. [Components](#components)
4. [Deployment](#deployment)
5. [Usage](#usage)
6. [Testing](#testing)
7. [Future Improvements](#future-improvements)
8. [License](#license)

---

## 📘 Project Overview

This repository provides a containerized lab environment using Docker Compose to simulate basic infrastructure with network segmentation. It serves as a demonstration of IaC principles using Docker.

---

## 🧱 Architecture and Topology

The architecture follows recommended network segmentation practices for production environments. In this scenario, all services and clients within the frontend network are intentionally isolated from the database. However, a MySQL container is included to demonstrate important networking principles, such as segmentation and access control.

The provided Docker Compose file also serves as a flexible template for extending the topology. For example, an additional service could be deployed within the frontend network to access the database via an API, showcasing real-world communication patterns.

- Two Docker networks:
  - **Frontend Network**: Contains NGINX, Pi-hole, and 5 Ubuntu client containers.
  - **Backend Network**: Contains a MySQL database container (not used functionally, for demo purposes only).
- Ubuntu clients are configured with `nftables` during deployment for firewall configuration.

![docke_topology](https://github.com/user-attachments/assets/c2485dc8-6cfa-4a74-aca8-9865f1453b02)

---

## 🔧 Components


| Component       | Role                             |
|----------------|----------------------------------|
| NGINX          | Web server (HTTP)                |
| Pi-hole        | DNS server for internal network  |
| Ubuntu Clients | Simulated client machines        |
| MySQL          | Example backend service          |

---

## Deployment

> ⚠️ Prerequisites:
> - [Docker Desktop](https://docs.docker.com/desktop/) installed
> - [Docker Compose](https://docs.docker.com/compose/) installed

- Prior to deployment, all services were confirmed to be installed and operational.
To install Docker Desktop, follow the official [installation guide](https://docs.docker.com/desktop/).
- Once installed, startet the Docker service:
  ```bash
  sudo systemctl start docker
  ```
  Enable the service to start automatically on boot:
  ```bash
  sudo systemctl enable docker
  ```
  To check the status of the Docker service:
  ```bash
  sudo systemctl status docker
  ```
- Docker Compose uses a YAML file to define and manage multi-container applications, allowing us to deploy the entire infrastructure quickly and efficiently.

  The deployment YAML file is provided [here](/doc).
  > **Note:** Before deploying, make sure Docker Desktop is up and running.

