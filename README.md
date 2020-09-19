# jupyterhub

1. Initialize secrets in `secret/cert` and `secret/proxy`
2. Copy `jupyter-hub-config.sh` to `$HOME` and configure it. Ensure your domain name is unique and available to you.
3. Build with `build.sh` 
4. AKS public load balancers will automatically procure a public IP. You can modify the URI from there. 

