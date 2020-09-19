. ~/jupyter-hub-config.sh
terraform apply \
  -auto-approve\
  -var="subscription_id=${jupyter_hub_subscription_id}"\
  -var="tenant_id=${jupyter_hub_tenent_id}"\
  -var="resource_group_name=${jupyter_hub_resource_group_name}"
