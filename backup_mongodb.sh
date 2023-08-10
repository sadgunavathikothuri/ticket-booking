#!/bin/bash

# Set variables
TIMESTAMP=$(date +%Y%m%d%H%M%S)
BACKUP_DIR="/path/to/backup/directory"
MONGO_HOST="mongodb-host"
MONGO_PORT="27017"
MONGO_DATABASE="mydb"
AWS_ACCESS_KEY="your-aws-access-key"
AWS_SECRET_KEY="your-aws-secret-key"
S3_BUCKET="your-s3-bucket"

# Create backup
mongodump --host $MONGO_HOST --port $MONGO_PORT --db $MONGO_DATABASE --out $BACKUP_DIR/$TIMESTAMP

# Upload to S3
aws s3 cp $BACKUP_DIR/$TIMESTAMP s3://$S3_BUCKET/$MONGO_DATABASE/$TIMESTAMP --recursive --access-key $AWS_ACCESS_KEY --secret-key $AWS_SECRET_KEY
