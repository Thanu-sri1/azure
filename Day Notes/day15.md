# Day 15 22-5-2026

## Problems with On-premesis Kubernetes

1. Manual repair
2. Manual networking setup
3. Manual high availability
4. Master node management
5. Manual data backup
6. Manual upgrade
7. Manual Secret management
8. RBAC and Monitoring
9. Cluster Autoscaling
10. Manual plugins

## AKS

- CIDR range of Pod network in aks cluster
  - Azure CNI Overlay
  - Azure CNI Subnet
- Service Mesh
  - Refers to Microsoft's managed Istio add-on for Azure Kubernetes Service (AKS)
  - Abstracts microservice communication to the infrastructure level, providing robust traffic management
  - Traffic Management: Enables canary rollouts, A/B testing, and percentage-based traffic splits.
  - Enhanced security via mutual TLS (mTLS) - Secures service-to-service communication with automatic mTLS encryption.
  - Observability -  Provides tracing, logging, and metrics to monitor service health and dependencies.
- Why the Istio Add-on?
  - Microsoft and the cloud community previously used Open Service Mesh (OSM) on AKS. Because upstream OSM has been retired by the CNCF, Azure has transitioned its primary managed service mesh offering to an officially supported Istio-based add-on. This managed add-on reduces the operational burden of deploying, upgrading, and managing an Istio mesh yourself.
