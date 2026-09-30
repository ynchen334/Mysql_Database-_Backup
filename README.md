## Scheduled Execution

This project can be executed automatically using Linux `crontab`, for example, to back up a MySQL database on a schedule.

### 1. Add a cron job

Run:

```bash
crontab -e

# Run MySQL backup script every day at 0:00 AM
0 0 * * * /bin/bash /usr/sbin/mysql_db_backup.sh >> /var/log/mysql_db_backup.log 2>&1
