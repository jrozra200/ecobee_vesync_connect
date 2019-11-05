# LOG ROTATION

echo $(date)': Log Rotation Script Started.'

# MOVE THE ECOBEE LOG FILE
ecobeefilename='/home/ec2-user/ecobee/ecobee.log'
newecobeefilename='/home/ec2-user/ecobee/logs/ecobee'$(date +%Y%m%d)'.log'

mv $ecobeefilename $newecobeefilename

echo $(date)': Moved Ecobee Logs.'

# MOVE THE VESYNC LOG FILE
vesyncfilename='/home/ec2-user/ecobee/vesync.log'
newvesyncfilename='/home/ec2-user/ecobee/logs/vesync'$(date +%Y%m%d)'.log'

mv $vesyncfilename $newvesyncfilename

# MOVE THE LOG ROTATION LOG FILE
logrotatefilename='/home/ec2-user/ecobee/log_rotation.log'
newlogrotatefilename='/home/ec2-user/ecobee/logs/log_rotation'$(date +%Y%m%d)'.log'

mv $logrotatefilename $newlogrotatefilename

echo $(date)': Moved Vesync Logs.'

# DELETE THE LOGS OLDER THAN A WEEK

find /home/ec2-user/ecobee/logs/ -type f -mtime +7 -delete

echo $(date)': Deleted logs that are older than 7 days.'