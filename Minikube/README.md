# Minikube

[Minikube](https://minikube.sigs.k8s.io/) is one of the best ways to deploy Kubernetes cluster for local development and
testing. It can be downloaded [here](https://minikube.sigs.k8s.io/docs/start/).

* **Creating a cluster**
    - by default, Minikube will start a cluster with a name 'minikube' and latest K8s version

    ```sh
    minikube start

    # start the cluster with different name
    minikube start -p my-cluster

    # start the cluster with different K8s version
    minikube start --kubernetes-version v1.23.10

    # pause the cluster
    minikube pause
    minikube pause -p my-cluster

    # delete the cluster
    minikube delete
    minikube delete -p my-cluster
    ```

* view and edit configurations

    ```sh
    minikube status
    minikube profile list
    minikube config view

    # list default drivers
    minikube config defaults driver

    # set default driver to docker
    minikube config set driver docker

    # set default container-runtime to containerd
    minikube config set container-runtime containerd

    # addons
    minikube addons list
    minikube addons enable metrics-server
    minikube addons disable metrics-server
    ```
