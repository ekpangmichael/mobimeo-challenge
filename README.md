
  

# Mobimeo App

  

  

### Features

  

  

- Register <br>

  

  

- Login <br>

  

  

- Request a ride <br>

  

  

- Get one ride<br>

  

  

- Get all rides<br>

  

  

- Update ride<br>

  

  

- Delete ride<br>

  

  

Authentication is required to access Ride CRUD APIs

  

  

  

## API Endpoints

  

  

  

- Import this postman collection https://www.getpostman.com/collections/2652df5fad09c14541a9

  

  

<br>

  

  

## Requirements

  

- Create a kubernetes cluster running locally (i made use of Minikube v1.10.1)

  

- Setup a postgresql Database

  

- Install [skaffold](https://skaffold.dev/docs/install/)

  

- Install [Helm](https://helm.sh/) (I used Helm v3.1.2)

  

  

## Deployment

  

1. Clone this repository

  

2. cd into the repository

  

  

> cd mobimeo-challenge/

  

3. Update the env section in values.yaml file with the corresponding values

  

> mobimeo-challenge/deployment/charts/values.yaml

  

```yaml

  

env:

JWT_SECRET: <JWT_SECRET>
DB_NAME: <DB_NAME>
DB_USER: <DB_USER>
DB_HOST: <DB_HOST>
DB_PASS: <DB_HOST>
NODE_ENV: cHJvZHVjdGlvbg==
SERVICE_URL: aHR0cDovL2FwbS1zZXJ2ZXItYXBtLXNlcnZlci5lbGsuc3ZjLmNsdXN0ZXIubG9jYWw6ODIwMA==
SERVICE_NAME: bW9iaW1lbw==
```

  

  

>  ***Values should be encoded in base64.*** These envs are use to create a kubernetes secret which is injected into the container during runtime

  

<br>

  

## Deploy the app

1. To deploy the application run the commands below:

  

```bash

  

make deploy-app

  

```

  

2. To expose the application service run

  

```bash

  

make expose-app

  

```

  

These command deploys the app using skaffold into a kubernetes cluster and perform a port forward on the app service.

  

To access the endpoints make use of the postman collection provided above

  

## Deploy ELK stack

1. To deploy the ELK stack run the commands below:

  

```bash

  

make deploy-elk

  

```

  

2. To expose the kibana service run

  

  

```bash

  

make expose-kibana

  

```

  

  

These commands deploy Elastic search, Kibana, Fluentd, APM-server and configure fluentd to get the container logs, format and ship the logs to Elastichsearch.

  
  
  

3. Open the kibana dashboard and create an index with **app-***

  

Select `Time field: as 'startTime'`

  

The application is also configured to work with APM, click on the apm link on the kibana dashboard to view the APM metrics

  
  

ELK was choosen because it is a highly scalable, fast and very efficient solution for logging

- Elasticsearch runs on cluster mode which helps to provide high available

- With the help of Kibana, logs index in Elasticsearch can be easily retrieved and analyse, it also makes it easy to search and filter logs

- The ability to also get time series data makes it easy to perform investigation and faster debugging process

- Fluentd facilitates logs collection from containers, format the logs and ship them to  Elasticsearch for indexing
- Fluentd is deployed as a DaemonSet on all the worker nodes

  
  

## Delete the charts

To delete all the helm charts run

  

```bash

  

make delete

  

```

  

## Next Steps

  
#### CI/CD pipeline

<pre>

On the ci/cd pipeline i will setup the following steps/stages

Checkout the code

-- Install dependencies

-- Run build and test

  

If test pass

-- Build the docker image and tag it

-- Run security scan to check the images for vulnerabilities (using aqua microscanner)

  

If stage pass

-- update the deployment manifest with the latest image tag/ helm chart version

-- Publish docker image to a docker registry

-- Publish helm chart to a registry

  

Deploy to dev

-- Run performance test

  

If test pass

  

Deploy to staging

-- Run performance and stress test

  

If test pass

  

Promote to production

-- Run performance and stress test

</pre>

  

### Deploy application on production in a cloud environment.

  

To deploy application to a production environemt using AWS as a case study

  

  

- I will setup VPC with private and public subnet

  

- Setup internet gateway to give access to the internet

  

- Setup and configure route tables

  

- Setup nat gateway to private internet access to private subnets

  

- Configure securities group

  

- Setup EKS (Elastic kubernetes Service)

  

- Setup and configure Loadbalancers and auto-scaling group

  

- Build and test application

- Scan docker image for vulnerabilities

- Push Docker image to ECR ( Elastic container Registry )

- Update helm chart manifest files with new image tag

- Deploy to a staging environment

- Perform performance test

- Promote to production after approval using rolling or blue green deployment strategy

  
  
  

## Major Technologies

  

NodeJS: Visit [here](https://nodejs.org/en/) for details.

  

ExressJS: Visit [here](https://expressjs.com) for details.

  
  

Postgresql Database: Visit [here](https://www.postgresql.org/docs) for details.

  
  

Sequelize ORM: Visit [here](https://sequelize.org/master) for details.

  

log4js: Visit [here](https://www.npmjs.com/package/log4js) for details.

  

Minikube: Visit [Minikube](https://minikube.sigs.k8s.io/docs/start/) for details

  

Helm: Visit [Helm](https://helm.sh/) for details

  

Skffold: Visit [Skaffold](https://skaffold.dev/) For details