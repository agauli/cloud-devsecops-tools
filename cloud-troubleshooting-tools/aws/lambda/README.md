### 1. Select the Log Group

1. From the **Log Group** dropdown menu, select the log group associated with your Lambda functions. Log groups are typically named in the format `/aws/lambda/<function-name>`.
2. If you have multiple Lambda functions, you may need to repeat these steps for each relevant log group.

### 2. Enter and Run the Query

In the query editor, paste the following query:

```plaintext
filter @message like /(?i)(Exception|error|fail)/
| fields @timestamp, @message
| sort @timestamp desc
| limit 20