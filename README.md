
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

- Install [Helm](https://helm.sh/)

  

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
To deploy the application run the commands below:

```bash

make deploy-app

```

To expose the application service run

```bash

make expose-app

```

These commande deploys the app using skaffold  in a kubernetes cluster and perform a port forward on the app service.

To access the endpoints make use of the postman collection provided above

### Deploy ELK stack

```bash

make deploy-elk

```

To expose the kibana service run

  

```bash

make expose-kibana

```

  

These commands deploy Elastic search, Kibana, Fluentd, APM-server and configure fluentd  to get the container logs, analyse and ship to them to Elastichsearch.

  

Open the kibana dashboard and create an index with **app-***

Select `Time field: as 'startTime'`

The application is also configured to work with APM, click on the apm link  on the kibana dashboard to view the APM metrics

To delete all the charts run

```bash

make delete

```

## Next Steps

  

#### CI/CD pipeline

<pre>

On the ci/cd pipeline i will setup the following steps/stages

Checkout the code

-- Install dependencies

-- Run build and test test

If test pass

-- Build the docker image and tag

-- Run security scan to check the images for vulnerabilities (using aqua microscanner)

If stage pass

-- Publish docker image to a docker registry

-- Publish helm chart to a registry

-- update the deployment manifest with the latest image tag

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
