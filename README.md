# Helmcharts

This repository serves the helm charts from `charts` directory

# To add the helm repo to the helm client
```
helm repo add mycharts https://devopspilot.com/helm/charts/
```

# To push helm charts from local to github hosted helm repo
First package the helm charts
```
helm package .
```

Move the generated chart(*.tgz) to `charts` folder

Execute the following command from `charts` directory to generate the index.yaml file
```
helm repo index --url https://devopspilot.com/helm/charts/ --merge index.yaml .
```
After executing the above command the local available charts are added to index.yaml file

Now commit and push the index.yaml file and the helm charts (*.tgz)

