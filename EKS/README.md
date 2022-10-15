# EKS

[Official EKS user guide](https://docs.aws.amazon.com/eks/latest/userguide/what-is-eks.html) from AWS Documentations.

## Prerequisites

Before using eksctl, a CLI tool for EKS, [AWS CLI](https://docs.aws.amazon.com/cli/index.html) must be installed and configured to
authenticate. the AWS CLI can be installed from [here](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).

After installing the AWS CLI, use `aws configure` command to setup. More details [here](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-quickstart.html).

Installation instructions for eksctl can be found [here](https://docs.aws.amazon.com/eks/latest/userguide/eksctl.html) and more information about eksctl is on
it's [website](https://eksctl.io/).

## Using eksctl

* **Creating a cluster**
    - by default, cluster with auto-generated name, two `m5.large` EC2 instance worker nodes
    is created in `us-west-2` region

    ```sh
    eksctl create cluster

    # create with specific configurations
    eksctl create cluster --name aws-test \
    --region ap-southeast-1 \
    --instance-types t2.small

    eksctl delete cluster --name aws-test --region ap-southeast-1
    ```

    - YAML file can be used to create a cluster

        ```sh
        # generate yaml file
        eksctl create cluster --name aws-test \
        --region ap-southeast-1 \
        --instance-types t2.small --dry-run > aws-test-cluster.yml

        eksctl delete cluster -f aws-test-cluster.yml
        ```

    - `max-pods-calculator.sh` is useful for choosing EC2 instance types for the cluster. More
    details [here](https://docs.aws.amazon.com/eks/latest/userguide/choosing-instance-type.html)
