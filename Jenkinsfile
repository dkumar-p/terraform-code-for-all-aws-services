pipeline{
    agent any
    stages{
       stage('AWS credentials') {
            steps{
                withAWS(credentials: 'AKIA5E6HQNDCFCSBQDHS', region: 'ap-south-1')
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
