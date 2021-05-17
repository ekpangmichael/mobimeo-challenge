#!/usr/bin/env bash

# terminal colours
blue=`tput setaf 4`
green=`tput setaf 2`
reset=`tput sgr0`

echoMessage() {
  echo  -e "${1}========================= ${2} ============================== ${reset} \n "
}

# Deploy application
deploy-app() {
  
  echoMessage "${blue}" "deploying project using skaffold"
  kubectl create ns mobimeo
  skaffold run   
  echoMessage "${green}" "app deployed successfuly"
}

expose-app(){
  kubectl port-forward service/mobimeo-app 5678:80 -n mobimeo  
}

# Deploy ELK stack 
deploy-elk() {
 kubectl create ns elk
 echoMessage "${blue}" "Deploying ELK stack"
 helm repo add elastic https://helm.elastic.co
 helm repo add bitnami https://charts.bitnami.com/bitnami
 helm install elasticsearch elastic/elasticsearch  --version="7.12.1" -f ./deployment/elk/elasticsearch-values.yaml -n elk 
 kubectl apply -f ./deployment/elk/fluentd-configmap.yaml -n elk    
 helm install fluentd bitnami/fluentd --version="3.7.3" -f ./deployment/elk/fluentd-values.yml -n elk
 helm install apm-server elastic/apm-server --version="7.12.1" -n elk
 helm install kibana elastic/kibana --version="7.12.1" -f ./deployment/elk/kibana-values.yml -n elk
 echoMessage "${green}" "ELK stack deployed successfuly"
}

expose-kibana(){
  kubectl port-forward service/kibana-kibana 5601:5601 -n elk
}

delete(){

echoMessage "${blue}" "uninstalling charts"
helm del kibana -n elk  
helm del apm-server -n elk 
helm del fluentd -n elk 
helm del elasticsearch -n elk  
helm del mobimeo -n mobimeo   
echoMessage "${green}" "Charts uninstalled successfuly"

}


main() {
  deploy-app
  deploy-elk
  expose-kibana
}

$@