#!/bin/bash
function subnet() {
    echo "Getting SUBNETS Info VPC $VPC..."
    aws ec2 describe-subnets --filters "Name=vpv-id,Values=$VPC" --region $REGION | jq ".Subnets[].SubnetId"
    echo ".............................................."
}

function vpcs() {
    for REGION in $@
    do
      echo "Getting VPC List For Regions $REGION..."
      vpcs=$(aws ec2 describe-vpcs  --region "${REGION}" | jq "".Vpcs[].VpcId"" | tr -d '""')
      echo $vpcs
      for VPC in $vpcs
      do
        subnets $VPC 
      done
    done
}
vpcs $@