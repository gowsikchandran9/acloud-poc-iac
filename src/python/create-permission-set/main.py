import os
import boto3

def lambda_handler(event, context):
    # Retrieve Environment variables
    instance_arn = event['SSO_INSTANCE_ARN']
    permission_set_name = event['PERMISSION_SET_NAME']
    description = event['PERMISSION_SET_DESCRIPTION']

    # Create an AWS SSO Admin client
    sso_admin_client = boto3.client('sso-admin')

    # Create a permission set
    response = sso_admin_client.create_permission_set(
        Name=permission_set_name,
        Description=description,
        InstanceArn=instance_arn
    )

    print(f"Permission set created: {response['PermissionSet']['Name']}")
    return {
        'statusCode': 200,
        'body': f"Permission set created: {response['PermissionSet']['Name']}"
    }