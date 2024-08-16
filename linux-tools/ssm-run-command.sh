region="eu-west-1"
instanceid=""

parameter='{"command": ["curl -v https://google.com"]}'
aws ssm start-session --target $instanceid --region $region --document-name 'AWS-StartNonInteractiveCommand' --parameters $parameter 
