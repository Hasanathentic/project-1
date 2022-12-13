pipeline {
    agent any

    stages {
         stage ('git clone') {
            steps {
        echo "code is building"
         git 'https://github.com/Hasanathentic/project-1.git'
            }
        }
        
        stage('build docker image') {
            steps {
                echo "build docker image"
                sh 'aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 276448867345.dkr.ecr.ap-south-1.amazonaws.com'
                sh 'sudo docker build -t httpd .'
                sh 'sudo docker tag httpd:latest public.ecr.aws/c9e0d4u8/httpd:2.4'
                sh 'sudo docker push public.ecr.aws/c9e0d4u8/httpd:2.4'
               
            }
        }
      
        stage('kubectl deploy'){ 
       steps {
          sh 'kubectl apply -f httpd.yaml'
          sh 'kubectl get nodes'
                   
        }
      } 
    }
}
