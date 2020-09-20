# jupyterhub with access control 

1. Initialize secrets in `secret/cert` and `secret/proxy`
2. Create an app in Azure Active Directory's App Registrations. 
3. Create a client secret for your registered app. 
4. Copy `jupyter-hub-config.sh` to `$HOME` and configure it. Ensure your domain name is unique and available to you.
5. Build with `build.sh` 
6. AKS public load balancers will automatically procure a public IP. You can modify the URI from there. 
7. Add users with Azure Active Directory. 
8. Server image can be modified through editting the hub's configmap 

