echo "You are using yc-k8s-scale profile!"
yc config profiles activate yc-k8s-scale

export YC_TOKEN=$(yc iam create-token)
export YC_CLOUD_ID=$(yc config get cloud-id)
export YC_FOLDER_ID=$(yc config get folder-id)