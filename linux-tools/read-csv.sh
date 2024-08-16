while IFS="," read -r originbucketname
do
  echo $originbucketname
  
done < <(tail -n +2 bucketname.csv)
