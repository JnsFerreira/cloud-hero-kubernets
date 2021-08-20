# Set a default compute zone
gcloud config set compute/zone us-central1-a

# Env vars
export CLUSTER_NAME=jns-cluster

# Create Kubernets cluster
gcloud container clusters create $CLUSTER_NAME

# Get authentication credentials for the cluster
gcloud container clusters get-credentials $CLUSTER_NAME

# Creates a new Deployment hello-server from the hello-app container image
kubectl create deployment hello-server --image=gcr.io/google-samples/hello-app:1.0

# Creates a Kubernetes Service
kubectl expose deployment hello-server --type=LoadBalancer --port 8080

gcloud container clusters delete $CLUSTER_NAME -y
