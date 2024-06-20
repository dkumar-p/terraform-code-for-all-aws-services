pipeline{
    agent any
    stages{
        stage("Git access"){
        steps{
            git branch: 'main', url: 'https://github.com/dkumar-p/terraform-code-for-all-aws-services.git'
           }
        }
        stage("AWS Credentials"){
        steps {
            withCredentials([[ $class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'jenkins-git-integration', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                sh 'echo $AWS_ACCESS_KEY_ID'
                sh 'echo $AWS_SECRET_ACCESS_KEY'
            }
          }
        }
        stage("Terraform INIT"){
            steps{
                sh 'terraform init'
            }
        }
        stage("Terraform validate"){
            steps{
                sh 'terraform validate'
            }
        }
        stage("Terraform plan"){
            steps{
                sh 'terraform plan'
            }
        }
        stage('User Approval') {
            steps {
                input message: 'Approve Terraform plan?', parameters: [string(name: 'APPROVE', defaultValue: 'no', description: 'Type "yes" to approve')]
            }
        }
        stage('Apply Terraform') {
            when {
                expression { params.APPROVE == 'yes' }
            }
            steps {
            sh 'terraform apply -auto-approve'
            }
        }

    }
}
