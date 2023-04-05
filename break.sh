#!/bin/bash
aws_region=(us-east-1 us-eat-2 hyd-india-1 eu-north-1 eu-west-3 eu-west-2 eu-west-1 ap-northeast-2)
Get_VPC() {
    echo "Running The Function To List VPCs using regions list"
    for region in ${aws_regions[@]}
    do
       echo "Getting VPCs in @region.."
       vpc_list=$(aws ec2 describe-vpcs --region $region | jq .Vpcs[].VpcId | tr -d '"')
       vpc_arr=(${vpc_list[@]})
       if [ ${#vpc_list[@]} -gt 0 ]
       then
           #echo ${vpc_list[@]}
           for vpc in ${vpc_list[@]}
           do
             echo "The VPC-ID is: $vpc"
           done
           echo "#######################"
       else
           echo 'Invalid Region..!!'
           echo "###########################"
           echo "# Breaking at $region #####"
           echo "###########################"
           break
       fi    
    done
 }
Get_VPC