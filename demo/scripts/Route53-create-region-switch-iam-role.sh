# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved. SPDX-License-Identifier: MIT-0
#!/bin/zsh 

CDK_OUTPUT_FILE=../out.json 

if [ ! -f $CDK_OUTPUT_FILE ]; then
    echo "Can not find CDK output files with the ARN of the resources it created"
    echo "Be sure to deploy the CDK stack using 'cdk deploy --all --outputs-file out.json'"
    exit -1
fi

REGION=us-west-2
STACK_NAME=Route53ARC-RegionSwitch-IAM-Role
#aws --region $REGION cloudformation create-stack               \
#    --template-body file://../cloudformation/Route53-ARC-region-switch-iam-role.yaml  \
#    --stack-name $STACK_NAME                                   \
#    --capabilities CAPABILITY_NAMED_IAM

aws --region $REGION iam get-role \
    --role-name RegionSwitch-Role |
    jq -r .Role.Arn