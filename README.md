## orbiter unified ci/cd solutions

# Demo Scope
Application Type : Dotnet Core , Dotnet Framework
Target : AWS ECS, EKS
Tech Stack: AWS Code Pipeline, Code Build, AWS CDK, Python Utility


# EKS Available App Type and Build Type 
APP_TYPE : dotnet_msbuild-k8s, dotnet_msbuild_cdk, dotnet_core_k8s, dotnet_core_cdk
BUILD_TYPE: "full", "build_only", "deploy_only", "rollback"

# CDK Type of application takes more ENV variable

```
   BUILD_PACK: "type of the name"

```
available option : dotnet_ecs_fargate, dotnet_lambda_apigateway
more cdk cookie cutter app can be extended

CDK Override Option
```
    cdk_path: 'aws_ref_cdk/python/ecs/fargate-service-with-autoscaling'
    cdk_app_name: 'cdk_default_ecs_app_name'
    ecs_fargate_cluster_name: 'cluster'
    ecs_fargate_service_name: 'service'
    as_max_capacity: '1'
    as_target_utilization_percent: '50'
    as_scale_in_cooldown: '60'
    as_scale_out_cooldown: '60' 
    ecs_cpu: '512'
    ecs_cpu_in_mb: '1024'
```

# EKS Application, CI/CD

- add below env varibles based on your applications.

```
   APP_TYPE: "dotnet_msbuild-k8s"
   BUILD_TYPE: "full"
   APP_CSPROJ_LOC: "aspnetmvcapp"
   DOCKER_FILE_PATH: "Dockerfile"
   EKS_CLUSTER_NAME: "windows-prod"
   K8S_FILE_PATH: "devops-automation/eks.yaml"
   K8S_REGION: "us-west-2"
   K8S_NAMESPACE: "application"
   PIPELINE_OVERRIDE: "devops-automation/pipeline-stages.yml"
```

# PIPELINE_OVERRIDE - Available stages for custom override

 add below stages in stages.yml and configure file path to PIPELINE_OVERRIDE ENV variable
 ```
 stages: 
   - common_git_checkout
   - dotnet_msbuild_set_properties
   - dotnet_msbuild_install_serverside_modules
   - dotnet_msbuild_build_publish_serverside
   - dotnet_msbuild_run_serverside_unit_tests
   - dotnet_msbuild_code_analysis
   - dotnet_msbuild_publish_generic_assets
   - docker_build_publish
   - eks_deploy

```   


# EKS Manifest file
Add kubernetes manifest file and configure to K8S_FILE_PATH ENV Variable


# GIT Override ENV Variable

CUSTOM_GIT_URL: ""
CUSTOM_GIT_BRANCH: ""
