helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/
helm repo update

helm upgrade --cleanup-on-fail \
  --install jhub jupyterhub/jupyterhub \
  --version=0.9.0 \
  --values jupyter-hub/config.yaml \
  --set auth.azuread.clientId="${jupyter_hub_client_id}" \
  --set auth.azuread.clientSecret="${jupyter_hub_client_secret}" \
  --set auth.azuread.tenantId="${jupyter_hub_tenant_id}" \
  --set auth.azuread.callbackUrl="https://${jupyter_hub_host}/hub/oauth_callback" \
  --set proxy.secretToken="${proxy_token}" \
  --set proxy.https.hosts[0]="${jupyter_hub_host}"
