pipeline {
  agent any
  stages {
    stage ('Build') {
      steps {
        sh 'printenv'
        sh 'docker build -t ajay0071/jenkinsdemo:""$GIT_COMMIT"" .'
      }
    }
    stage('Publish to DockerHub') {
    steps {
        script {
            docker.withRegistry('https://hub.docker.com/repositories/ajju0071', 'ajju0071') {
                docker.image("ajay0071/jenkinsdemo:${GIT_COMMIT}").push()
            }
        }
    }
}
    stage ('Publish to ECR') {
      steps {
        //sh 'aws ecr-public get-login-password --region eu-west-2 | docker login --username AWS --password-stdin public.ecr.aws/t7e2c6o4'
        //withAWS(credentials: 'sam-jenkins-demo-credentials', region: 'eu-west-2') {
         withEnv(["AWS_ACCESS_KEY_ID=${env.AWS_ACCESS_KEY_ID}", "AWS_SECRET_ACCESS_KEY=${env.AWS_SECRET_ACCESS_KEY}", "AWS_DEFAULT_REGION=${env.AWS_DEFAULT_REGION}"]) {
          sh 'docker login -u AWS -p $(aws ecr-public get-login-password --region us-east-1) public.ecr.aws/h8n1h4e9' //985729960198.dkr.ecr.eu-west-2.amazonaws.com'
          sh 'docker build -t ecr-demo .'
          sh 'docker tag ecr-demo:latest public.ecr.aws/h8n1h4e9/ecr-demo:latest'
          sh 'docker push public.ecr.aws/h8n1h4e9/ecr-demo:latest'
         }
       }
    }
  }
}
