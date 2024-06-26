#!/bin/bash

# Check if AWS region is provided as a command-line argument
if [ -z "$1" ]; then
    echo "Usage: $0 <aws-region>"
    exit 1
fi

# Set AWS region from command-line argument
AWS_REGION="$1"

# List EC2 instances and get their resource usage
echo "EC2 Instances:"
aws ec2 describe-instances --region $AWS_REGION --query 'Reservations[*].Instances[*].[InstanceId, InstanceType, State.Name, PrivateIpAddress, PublicIpAddress]'

# List RDS instances and get their resource usage
echo "RDS Instances:"
aws rds describe-db-instances --region $AWS_REGION --query 'DBInstances[*].[DBInstanceIdentifier, DBInstanceClass, DBInstanceStatus, Engine, EngineVersion, Endpoint.Address]'

# List S3 buckets and get their resource usage
echo "S3 Buckets:"
aws s3 ls

# List Lambda functions and get their resource usage
echo "Lambda Functions:"
aws lambda list-functions --region $AWS_REGION --query 'Functions[*].[FunctionName, Runtime, MemorySize, Timeout]'

# List DynamoDB tables and get their resource usage
echo "DynamoDB Tables:"
aws dynamodb list-tables --region $AWS_REGION --query 'TableNames'

# List CloudFormation stacks
echo "CloudFormation Stacks:"
aws cloudformation describe-stacks --region $AWS_REGION --query 'Stacks[*].[StackName, StackStatus]'

# List Elastic Beanstalk applications
echo "Elastic Beanstalk Applications:"
aws elasticbeanstalk describe-applications --region $AWS_REGION --query 'Applications[*].[ApplicationName, Status]'

# List IAM users
echo "IAM Users:"
aws iam list-users --region $AWS_REGION --query 'Users[*].[UserName, UserId, Arn]'

# List ECS clusters
echo "ECS Clusters:"
aws ecs list-clusters --region $AWS_REGION --query 'clusterArns'

# List SNS topics
echo "SNS Topics:"
aws sns list-topics --region $AWS_REGION --query 'Topics[*].[TopicArn]'

# List EKS clusters
echo "EKS Clusters:"
aws eks list-clusters --region $AWS_REGION --query 'clusters'

# List CloudTrail trails
echo "CloudTrail Trails:"
aws cloudtrail describe-trails --region $AWS_REGION --query 'trailList[*].[Name, HomeRegion]'

# List VPC peering connections
echo "VPC Peering Connections:"
aws ec2 describe-vpc-peering-connections --region $AWS_REGION --query 'VpcPeeringConnections[*].[VpcPeeringConnectionId, Status.Code]'

# List DataSync tasks
echo "DataSync Tasks:"
aws datasync list-tasks --region $AWS_REGION --query 'Tasks[*].[TaskArn, Status]'

# List Direct Connect connections
echo "Direct Connect Connections:"
aws directconnect describe-connections --region $AWS_REGION --query 'connections[*].[connectionId, connectionState]'

# List CloudWatch alarms
echo "CloudWatch Alarms:"
aws cloudwatch describe-alarms --region $AWS_REGION --query 'MetricAlarms[*].[AlarmName, StateValue]'

# List EFS file systems
echo "EFS File Systems:"
aws efs describe-file-systems --region $AWS_REGION --query 'FileSystems[*].[FileSystemId, CreationTime, LifeCycleState]'

# List Route 53 hosted zones
echo "Route 53 Hosted Zones:"
aws route53 list-hosted-zones --region $AWS_REGION --query 'HostedZones[*].[Name, Id]'

# List Auto Scaling groups
echo "Auto Scaling Groups:"
aws autoscaling describe-auto-scaling-groups --region $AWS_REGION --query 'AutoScalingGroups[*].[AutoScalingGroupName, MinSize, MaxSize, DesiredCapacity]'

# List ACM certificates
echo "ACM Certificates:"
aws acm list-certificates --region $AWS_REGION --query 'CertificateSummaryList[*].[DomainName, CertificateArn]'

# List NAT gateways
echo "NAT Gateways:"
aws ec2 describe-nat-gateways --region $AWS_REGION --query 'NatGateways[*].[NatGatewayId, State]'

# List Amazon ECR repositories
echo "Amazon ECR Repositories:"
aws ecr describe-repositories --region $AWS_REGION --query 'repositories[*].[repositoryName, repositoryUri]'

# List Amazon CloudFront distributions
echo "CloudFront Distributions:"
aws cloudfront list-distributions --region $AWS_REGION --query 'DistributionList.Items[*].[Id, DomainName]'

# List AWS Global Accelerator accelerators
echo "AWS Global Accelerator Accelerators:"
aws globalaccelerator list-accelerators --region $AWS_REGION --query 'Accelerators[*].[AcceleratorArn, IpSets]'

# List AWS Control Tower managed accounts
echo "AWS Control Tower Managed Accounts:"
aws controltower describe-managed-accounts --region $AWS_REGION --query 'ManagedAccounts[*].[AccountName, AccountId]'

# List Amazon Managed Grafana workspaces
echo "Amazon Managed Grafana Workspaces:"
aws managedgrafana list-workspaces --region $AWS_REGION --query 'workspaces[*].[workspaceId, workspaceName]'

# List Amazon Managed Prometheus workspaces
echo "Amazon Managed Prometheus Workspaces:"
aws managedprometheus list-workspaces --region $AWS_REGION --query 'workspaces[*].[workspaceId, workspaceName]'

# List AWS AppSync APIs
echo "AWS AppSync APIs:"
aws appsync list-graphql-apis --region $AWS_REGION --query 'graphqlApis[*].[apiId, apiName]'

# List AWS Amplify apps
echo "AWS Amplify Apps:"
aws amplify list-apps --region $AWS_REGION --query 'apps[*].[appId, name]'

# List AWS Key Management Service (KMS) keys
echo "AWS KMS Keys:"
aws kms list-keys --region $AWS_REGION --query 'Keys[*].[KeyId, KeyArn]'

# List AWS Secrets Manager secrets
echo "AWS Secrets Manager Secrets:"
aws secretsmanager list-secrets --region $AWS_REGION --query 'SecretList[*].[Name, ARN]'

# List AWS WAF web ACLs
echo "AWS WAF Web ACLs:"
aws wafv2 list-web-acls --region $AWS_REGION --query 'WebACLs[*].[Name, ARN]'



