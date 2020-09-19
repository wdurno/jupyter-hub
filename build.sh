## set repo dir 
export repo_dir=$PWD

## configure build 
. ~/jupyter-hub-config.sh 

## get secrets 
export cacert_key=$(cat ${repo_dir}/secret/cert/cacert.key) 
export cacert_crt=$(cat ${repo_dir}/secret/cert/cacert.crt) 
export proxy_token=$(cat ${repo_dir}/secret/proxy/proxy-token) 

## get infrastructure 

## deploy to kubernetes 
