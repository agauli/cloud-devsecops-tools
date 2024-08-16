#!/bin/bash
#Usage:
#./delete-expired-certs.sh dev us-east-1

PROFILE=ard-srm-prd
ENV=prd
#REGIONS=$2
#REGIONS=("us-east-2" "us-west-1" "us-west-2" "af-south-1" "ap-southeast-2" "ap-northeast-1" "eu-west-1" "eu-north-1")

REGIONS=("us-east-1")

for REGION in ${REGIONS[@]};
	do
	echo $REGION
	certs=$(aws acm list-certificates --profile $PROFILE-$ENV --region $REGION | jq -r '.CertificateSummaryList[].CertificateArn')
	for cert in $certs;
		do
		status=$(aws acm describe-certificate  --certificate-arn $cert --region $REGION --profile $PROFILE-$ENV | jq -r '.Certificate.Status')
		if [ $status = "EXPIRED" ]; then 
			echo "Deleting cert": $cert,$status
    			aws acm delete-certificate --profile $PROFILE-$ENV --certificate-arn $cert --region $REGION --profile $PROFILE-$ENV
    		fi
	done
done
