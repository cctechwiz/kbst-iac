#Instructions from: https://www.kubestack.com/framework/documentation/tutorial-provision-infrastructure#overview

.PHONY: docker-build docker-run

# Build the bootstrap container
docker-build:
	docker build -t kbst-infra-automation:bootstrap .

# Exec into the bootstrap container
docker-run:
	docker run --rm -ti \
	-v $(CURDIR):/infra \
	--network host \
	kbst-infra-automation:bootstrap
