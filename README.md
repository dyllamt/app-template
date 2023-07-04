# app-template
Template for applications running on Kubernetes.

## Contents

### Frontend

Unopinionated JS frontend.

### Backend

Fastapi python backend.

### Redis

Redis in-memory storage.

## Local K8s Testing

Dependencies:
```shell
brew install helm;
brew cask install docker;
brew install redis;
brew install --cask next;  # if you want to use next for frontend
```

Prerequisites:
- Docker desktop is running in the background (make sure you enable K8s)
- build containers using `make docker-build` within frontend and backend directories
- activate local context `kubectl config use-context docker-desktop`

Dev testing leverages port-forwarding:
```shell
make helm-install-dev;
kubectl port-forward service/frontend-service 3000:80
```
to open the frontend at `localhost:3000`. Make sure you uninstall after testing:
```shell
make helm-uninstall
```
