
deploy-app:
	@ ./deploy.sh deploy-app

expose-app:
	@ ./deploy.sh expose-app

deploy-elk:
	@ ./deploy.sh deploy-elk

expose-kibana:
	@ ./deploy.sh expose-kibana

delete:
	@ ./deploy.sh delete