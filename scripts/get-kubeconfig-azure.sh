. ~/jupyter-hub-config.sh

cluster_name=jh-aks

az aks get-credentials --name ${cluster_name} --resource-group ${jupyter_hub_resource_group_name} 
