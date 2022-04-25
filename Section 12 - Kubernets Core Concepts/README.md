# Minikube

## Installation

<br/>

### Installing minikube

See: <https://minikube.sigs.k8s.io/docs/start/>

```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

<br/>

### Adding dedicated user

It is necessary to create a new user to manage Kubernetes. This user needs to have the home directory.

```bash
# Creates the user with his home dir
sudo useradd -m <username>
# Adds a password to the user
sudo passwd <username>
# Adds user to docker group
sudo useradd -m <username>
# Switch to new user
su <username>
```

<br/>

### First run

The first time you run minikube, it will download whats needed

```bash
# This will download minikube
minikube start 
--driver=docker # docker is already the default driver anyway
--force # to run as root
# This will download kubectl
minikube kubectl -- get pods -A
```

<br/>

### kubectl

The kubectl bundled with minikube is a little bit different. The commands need to be run like:

```bash
minikube kubectl -- <command>
```

it is better to create an alias

```bash
alias kubectl='minikube kubectl --'
```

<br>

### Web Dashboard

```bash
minikube dashboard --port <PORT>
```

<br/>

## Concepts

* Usually Pods run one container.
* Containers inside a Pod communicate via localhost. 
* Every Pod has then a cluster-internal IP.
* Pods start, stop and are replaced as needed, they're non persistent.

<br/>

## Deployment

* Deployments control one or more Pods.
* You set the desired state of your Pods, and Kubernetes manages get to that state.
* Deployments can be rolled back in case of errors or stopped/deleted.
* Deployments can scale, also automatically.

## Service

* Groups the Pods together and to the external world
* Static address to call the Pods