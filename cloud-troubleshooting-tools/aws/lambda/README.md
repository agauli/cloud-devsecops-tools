filter @message like /(?i)(Exception|error|fail)/
| fields @timestamp, @message
| sort @timestamp desc
| limit 20


