VERSION ?= 0.1.2

build:
	docker build . -t paulandrei/text2lang:${VERSION}

push: build
	docker push paulandrei/text2lang:${VERSION}

deploy:
	kustomize build k8s | kubectl apply -f -

undeploy:
	kustomize build k8s | kubectl delete -f -