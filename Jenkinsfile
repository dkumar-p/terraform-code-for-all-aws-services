pipeline{
    agent any
    stages{
        stage("AWS Credentials"){
        steps {
            withCredentials(credentialsId: 'jenkins-test-user', accessKeyVariable: 'ACCESS_KEY_ID', secretKeyVariable: 'SECRET_ACCESS_KEY') {
                sh 'echo $ACCESS_KEY_ID'
                sh 'echo $SECRET_ACCESS_KEY'
            }
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
