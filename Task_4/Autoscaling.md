# Automatic Scaling with AWS Auto Scaling

To automatically scale EC2 instances based on CPU utilization, AWS Auto Scaling can be utilized. AWS Auto Scaling enables you to dynamically adjust the number of EC2 instances in an Auto Scaling group based on specified criteria.

## 1. Create an Auto Scaling Group

### Launch Configuration:

Create a launch configuration specifying the Amazon Machine Image (AMI), instance type, and other settings.
Configure user data or bootstrap scripts if needed.

### Auto Scaling Group:

Create an Auto Scaling group using the launch configuration.
Set the desired capacity and the minimum and maximum number of instances.

## 2. Configure Scaling Policies

### Scale Out Policy:

Create a scaling policy for scaling out (adding more instances) based on CPU utilization.
Set the trigger condition, such as average CPU utilization exceeding a certain threshold for a specified period.

```bash
aws autoscaling put-scaling-policy \
  --policy-name ScaleOutPolicy \
  --auto-scaling-group-name YourAutoScalingGroup \
  --scaling-adjustment 1 \
  --adjustment-type ChangeInCapacity \
  --cooldown 300
```


### Scale In Policy:

Create a scaling policy for scaling in (removing instances) based on CPU utilization going below a certain threshold.
```bash
aws autoscaling put-scaling-policy \
  --policy-name ScaleInPolicy \
  --auto-scaling-group-name YourAutoScalingGroup \
  --scaling-adjustment -1 \
  --adjustment-type ChangeInCapacity \
  --cooldown 300
  ```