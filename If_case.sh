# #!/bin/bash
# get_details() {
#     CHOICE=$@
#     if [ "${CHOICE}" = 'vpcs' ]
#     then
#         aws ec2 describe-vpcs | jq .Vpcs[].VpcId
#     elif [ "${CHOICE}" = 'instances' ]
#     then
#         aws ec2 describe-instances | jq .Reservations[].Instances[].InstanceId
#     elif [ "${CHOICE}" = 'tags' ]
#     then
#         aws ec2 describe-tags | jq .Tags[].Value
#     else
#         echo "Invalid Input, Please Select between vpcs/instances/tags."
#     fi    
# }
# #echo "Please Enter You Choice vpcs/instances/tags"
# read -p "Please Enter You Choice vpcs/instances/tags:" USER_CHOICE
# get_details ${USER_CHOICE}

# Above same can be writen in case statment as below

# ############# Case Statments ##################
#!/bin/bash
while true
do
  read -p "Please Enter You Choice vpcs/instances/tags:" USER_CHOICE
  case $CHOICE in
    vpcs)
      aws ec2  describe-vpcs | jq .Vpcs[].VpcId
      ;;
    instances)
      aws ec2  describe-instances | jq .Reservations[].Instances[].InstanceId
      ;;
    tags)
      aws ec2  describe-tags | jq .Tags[].values
      ;;
    *)
      echo "Invalid Input, Please Select Between vpcs/instances/tags."
      ;;
    esac
done
