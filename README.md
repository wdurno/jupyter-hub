# jupyter-hub

This repo follows the [Zero to JupyterHub tutorial](https://zero-to-jupyterhub.readthedocs.io/en/latest/) and is tested on GCP. In this repo's first version, I plan to follow the tutorial closely. So, the following notes look much like the tutorial. In a later version, I plan to automate the process.

Start by initializing a kubernetes cluster.

You must have the `kubectl` and `helm` clients installed to manipulate the cluster and start a `tiller` server. Helm can be installed with [this script](https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get). GCP will have both installed in cloud shell. 

Ensure `kubectl` can connect to your kubernetes cluster. On GCP, this requires credentials, `gcloud container clusters get-credentials <cluster name> --zone <zone name> --project <project name>`.

Create a service account for `tiller`.
```
kubectl --namespace kube-system create serviceaccount tiller
```

Give the service account full cluster permissions. In a non-demo context, I expect permissions to be much more constrained.
```
kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller
```

Start your `tiller` server.
```
helm init --service-account tiller --wait
```

Patch the `tiller` deployment to only take instructions from its local host. Since `tiller` now has so much power, it's good to deny manipulation from the outside.
```
kubectl patch deployment tiller-deploy --namespace=kube-system --type=json --patch='[{"op": "add", "path": "/spec/template/spec/containers/0/command", "value": ["/tiller", "--listen=localhost:44134"]}]'
```

The `tiller` server's functioning can be verified by running `helm version`. You should see versions for both `helm` and `tiller`. 

It's now time to create a JupyterHub deployment. 

I've configured my JupyterHub to use a fixed token, found in `jupyter-hub-config.yml`. This is fine for my demo, but you may wish to populate this field dynamically, storing the token as a secret.

Add `jupyterhub` to your `helm` repo.
```
helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/
helm repo update
```

From this repo's root directory, deploy JupyterHub into the `jhub` kubernetes namespace.
```
RELEASE=jhub
NAMESPACE=jhub

helm upgrade --install $RELEASE jupyterhub/jupyterhub \
  --namespace $NAMESPACE  \
  --version=0.8.2 \
  --values jupyter-hub-config.yml
```

You can see your public-facing IP with this.
```
kubectl --namespace=jhub get svc proxy-public
```

You can log in with any name and no password. 





