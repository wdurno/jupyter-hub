## set repo dir 
export repo_dir=$PWD

## configure build 
. ~/jupyter-hub-config.sh 

## get infrastructure 
cd ${repo_dir}/terraform
terraform init
. terraform-apply.sh

## get kubeconfig 
. ${repo_dir}/scripts/get-kubeconfig-azure.sh

## get secrets 
export proxy_token=$(cat ${repo_dir}/secret/proxy/proxy-token) 
cd ${repo_dir}/secret/cert
. upload-cert.sh 

## deploy to kubernetes 
cd ${repo_dir}/helm
. helm-deploy.sh
