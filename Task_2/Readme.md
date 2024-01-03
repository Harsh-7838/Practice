# Task 2 : Kubernetes Deployment
● Deploy a sample application (e.g., nginx) on a Kubernetes cluster.
● Configure the application for high availability.
● Implement rolling updates for the application.

- Created a Manifest file for deployment and service for deploying a sample file on the kubernetes cluster. Selected for the 3 replicas to make sure it     remains highly available also added the HPA for the same in case if the load increases and it is defined on CPU utilization avg of 50%.

- Rolling update is the strategy which is already being used by the kubernetes deployment by default with maxsurge and minavailable equals to 25% but I have added it manually with the value of 50%.

