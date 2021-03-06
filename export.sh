#!/bin/bash
# EXPORT_DB_HOST database host
# EXPORT_DB_USERNAME database username
# EXPORT_DB_PASSWORD
# EXPORT_DB_NAME name of database to export
# EXPORT_S3_PATH path to file. Will be saved in format ${EXPORT_S3_PATH}/${EXPORT_DB_NAME}.gz
#
# Example usage:
# EXPORT_DB_HOST=db1.prod.server.com EXPORT_DB_USERNAME=backup EXPORT_DB_PASSWORD=password EXPORT_DB_NAME=db EXPORT_S3_PATH=s3://bucket/backup/sql sh export.sh

echo "Backing up ${EXPORT_DB_NAME} to ${EXPORT_S3_PATH}/${EXPORT_DB_NAME}.gz"
./mysqldump --host ${EXPORT_DB_HOST} --opt -u ${EXPORT_DB_USERNAME} -p${EXPORT_DB_PASSWORD} ${EXPORT_DB_NAME} | gzip | aws s3 cp - ${EXPORT_S3_PATH}/${EXPORT_DB_NAME}.gz


