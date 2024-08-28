### 1. Find errored lambda instances log. 

In the query editor, paste the following query:

```plaintext
filter @message like /(?i)(Exception|error|fail)/
| fields @timestamp, @message
| sort @timestamp desc
| limit 20


### 1. Find errored lambda instances log.