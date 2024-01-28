# Create GKE Cluster with Terraform

This guide outlines the steps to create a GKE (Google Kubernetes Engine) cluster using Terraform. It includes setting up infrastructure, deploying Nginx Ingress, and configuring DNS for ingress access.

## Prerequisites
- Google Cloud account
- Terraform installed
- Helm installed
- kubectl installed and configured

## Steps

### 1. Set Up Terraform State Bucket
Create a GCS bucket to store Terraform states and enable versioning.

```bash
# Step 1: Create the bucket
gsutil mb -p [PROJECT_ID] -l [LOCATION] gs://[BUCKET_NAME]/

# Step 2: Enable versioning on the bucket
gsutil versioning set on gs://[BUCKET_NAME]/
```

### 2. Authenticate GCloud
Run the following command to authenticate:

```bash
gcloud auth application-default login
```

### 3. Initialize Terraform
Navigate to your Terraform directory and initialize the Terraform configuration.

```bash
cd path/to/your/terraform/directory
terraform init
```

### 4. Apply Terraform Configuration
Apply the Terraform configuration to create the infrastructure.

```bash
terraform apply
```

### 5. Install Nginx Ingress using Helm
Add the Nginx Ingress repository, update it, and install the Ingress controller.

```bash
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm repo search nginx  # Find the latest version and note it down.
helm install myingress ingress-nginx/ingress-nginx \
                                   --namespace ingress \
                                   --version 4.9.1 \
                                   --values nginx-values.yaml \
                                   --create-namespace
```

### 6. Configure Ingress
Use the correct hostname, path, and storage class for your deployment based on the example provided.

### 7. Verify Ingress IP
Check the IP address assigned to your ingress by running:

```bash
kubectl get ingress
```

### 8. Update DNS Settings
Update the DNS name and IP in your DNS provider interface to match the ingress settings. This allows you to access the application using the ingress.

### 9. (Optional) Destroy Infrastructure
To clean up and destroy the created resources, run:

```bash
terraform destroy
```

## Conclusion
Follow these steps to successfully create a GKE cluster using Terraform, deploy Nginx Ingress, and configure DNS settings for ingress access.
```
