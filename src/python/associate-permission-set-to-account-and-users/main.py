import os
import boto3
# test comment
def lambda_handler(event, context):
    # Retrieve environment variables
    sso_instance_arn = event['SSO_INSTANCE_ARN']
    permission_set_arn = event['PERMISSION_SET_ARN']
    aws_account_id = event['AWS_ACCOUNT_ID']
    user_id = event['USER_ID']  # Replace with the actual user ID

    # Create an AWS SSO Admin client
    sso_admin_client = boto3.client('sso-admin')

    # Associate the permission set with the AWS account
    response_associate_permission_set_account = sso_admin_client.create_account_assignment(
        InstanceArn=sso_instance_arn,
        PermissionSetArn=permission_set_arn,
        TargetType='AWS_ACCOUNT',
        TargetId=aws_account_id,
        PrincipalType='USER',
        PrincipalId=user_id  # Assuming AWS account ID can be used as PrincipalId for users
    )

    print(f"Permission set associated with AWS account: {aws_account_id}")

    return {
        'statusCode': 200,
        'body': f"Permission set associated with AWS account and user: {user_id}"
    }
