pipeline{
     environment {
        imagename = "pawankhanaparazymr1/javabuild:$BUILD_NUMBER"
        dockerImage = ''
    }
    agent any
    stages{
          stage('Cloning our Git') { 
            steps { 
              git([url: 'https://github.com/Pawankhanapara/docker.git', branch: 'main', credentialsId: 'github']) }
        } 
        stage('Building image') {
            steps{
                script{
                    dockerImage = docker.build imagename
                }
            }
        }
        stage('Deploy Image') {
            steps{
                withDockerRegistry([ credentialsId: "docker_id", url: "https://index.docker.io/v1/" ]){
                    //sh 'docker tag mynginx pawankhanaparazymr1/mynginx:$BUILD_NUMBER '
                    // sh 'docker push pawankhanaparazymr1/mynginx:$BUILD_NUMBER'
                    script{
                        //dockerImage.push("$BUILD_NUMBER")
                         dockerImage.push('latest')
                    }
                }
            }
        }
    }
}
