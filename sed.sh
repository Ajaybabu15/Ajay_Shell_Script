First run cat /etc/ssh/sshd_config | grep -w PasswordAuthentication

Result 
 PasswordAuthentication NO
 PasswordAuthentication NO
 PasswordAuthentication NO
 
 we got 3 time as the file has 3 times in that file

Now I can change NO to yes with out opening the file using sed command as follows

sed -i ""s/.*PasswordAuthentication.*/*PasswordAuthentication yes/g"" /etc/ssh/sshd_config

Now run cat /etc/ssh/sshd_config | grep -w PasswordAuthentication
Result 
 PasswordAuthentication yes
 PasswordAuthentication yes
 PasswordAuthentication yes
but all 3 has been changed but i want only 1st one to change

I want to change only first occurance

sed -i 0/.*PasswordAuthentication.*/s//*PasswordAuthentication no/g"" /etc/ssh/sshd_config
Here 0 indicates First occurance , 1 indicates 2nd occurance and 2 indicates 3rd occurance and .......
Now run cat /etc/ssh/sshd_config | grep -w PasswordAuthentication
Result 
 PasswordAuthentication no
 PasswordAuthentication yes
 PasswordAuthentication yes