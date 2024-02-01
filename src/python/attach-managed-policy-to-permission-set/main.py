import os
import boto3

def lambda_handler(event, context):
    # Retrieve environment variables
    permission_set_arn = event['PERMISSION_SET_ARN']
    managed_policy_arn = event['MANAGED_POLICY_ARN']
    instance_arn = event['SSO_INSTANCE_ARN']

    # Create an AWS SSO Admin client
    sso_admin_client = boto3.client('sso-admin')

    # Attach the managed policy to the permission set
    response = sso_admin_client.attach_managed_policy_to_permission_set(
        InstanceArn=instance_arn,
        PermissionSetArn=permission_set_arn,
        ManagedPolicyArn=managed_policy_arn
    )

    print(f"Managed policy attached to permission set: {permission_set_arn}")

    return {
        'statusCode': 200,
        'body': f"Managed policy attached to permission set: {permission_set_arn}"
    }
