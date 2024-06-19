pipeline{
    agent any
    stages{
        stage("AWS Credentials"){
        steps {
            withCredentials([[ $class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'jenkins-test-user', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
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
        stage("Build"){
            steps{
                echo "========executing Build========"
            }
        }
        stage("Test"){
            steps{
                echo "========executing Test========"
            }
        }
        stage("Deploy"){
            steps{
                echo "========executing Deploy========"
            }
        }
    }
}
