# Docker-iac-network-deployment
This project simulates a small-scale infrastructure using Docker and IaC concepts. It includes a web and DNS service on a shared network, Ubuntu clients with firewall rules, and a segregated backend network with a MySQL database.

---

## Table of Content

1. [Project Overview](#project-overview)
2. [Architecture and Topology](#architecture-and-topology)
3. [Components](#components)
4. [Deployment](#deployment)
5. [Usage and Testing](#usage-and-testing)
6. [Future Improvements](#future-improvements)
7. [Repository Structure](#repository-structure)
8. [Author](#author)

---

## 📘 Project Overview

This repository provides a containerized lab environment using Docker Compose to simulate basic infrastructure with network segmentation. It serves as a demonstration of IaC principles using Docker.

---

## Architecture and Topology

The architecture follows recommended network segmentation practices for production environments. In this scenario, all services and clients within the frontend network are intentionally isolated from the database. However, a MySQL container is included to demonstrate important networking principles, such as segmentation and access control.

The provided Docker Compose file also serves as a flexible template for extending the topology. For example, an additional service could be deployed within the frontend network to access the database via an API, showcasing real-world communication patterns.

- Two Docker networks:
  - **Frontend Network**: Contains NGINX, Pi-hole, and 5 Ubuntu client containers.
  - **Backend Network**: Contains a MySQL database container (not used functionally, for demo purposes only).
- Ubuntu clients are configured with `nftables` during deployment for firewall configuration.

![docker-topology](https://github.com/user-attachments/assets/537eb0bb-6cb2-4e95-a984-f2d3a40f8a42)

---

## Components


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

- To deploy the infrastructure:
  ```bash
  docker compose -d
  ```

## Usage and Testing

Once the environment is up and running, you can list the running containers with:
```bash
docker ps
```
Using the container name, you can connect to any of the clients like this:
```bash
docker exec -it <client> bash
```
Once inside the client shell, you can test the NGINX web server by curling the hosted website:
```bash
curl http://web
```
This should return the default NGINX page or your custom content, confirming the service is running properly.

<img width="505" height="151" alt="Screenshot_20250930_165619" src="https://github.com/user-attachments/assets/53ba684f-7c43-4d88-a5ee-e92567e32518" />

To access the Pi-hole admin interface, open the following URL in your browser:
```bash
http://localhost:8081/admin/
```

<img width="750" height=auto alt="Screenshot_20250930_164137" src="https://github.com/user-attachments/assets/e5268e86-e08c-424d-a3ae-4680f87b7348" />

---

## Future Improvements

Now that the networks and services are fully deployed and operational, additional services can be integrated.

For example, a backend API could be added to allow client containers to securely access the MySQL database. This architecture could be used as a foundation for a typical business solution, where employees (clients) need controlled and secure access to customer data.

Other potential improvements:
- Add logging and monitoring services (e.g., Prometheus, Grafana)
- Implement authentication for accessing internal services
- Automate testing with scripts

---

## Repository Structure

```bash
│
├── docker-compose.yml           
│
├── html/                        
│   └── index.html
│
├── scripts/                     
│   ├── install-nftables.sh
│   └── deploy.sh                
│
├── docs/                        
│   ├── topology-diagram.png
│   ├── nginx-test.png
│   ├── pihole-console.png
│   ├── docker-desktop-containers.png
│   └── terminal-output.png
│
├── README.md        
└── LICENSE          
```

---

## Author
[nachogtan](https://github.com/nachogtan)
