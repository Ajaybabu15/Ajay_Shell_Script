aws ec2 describe-vpcs --region us-east-1 | jq ''.Vpcs[].VpcId, .CidrBlock, .OwnerId' | paste - - - | tr -d '"' | awk '{print $3  "-->" $2 "--->" $1}'
# Result : 721834156908 --> 172.166.0.0/16 ---> vpc-ob44c7de8ff0bc1be
#           (owner ID)        (Cidr ID)              (vpc Id)

#Now i want vpc ID then owner ID and cidr ID
aws ec2 describe-vpcs --region us-east-1 | jq ''.Vpcs[].VpcId, .CidrBlock, .OwnerId' | paste - - - | tr -d '"' | awk '{print $1  "-->" $3 "--->" $2}'
# Result : vpc-ob44c7de8ff0bc1be --> 721834156908 ---> 172.166.0.0/16  
#                (vpc Id)              (owner ID)         (Cidr ID)