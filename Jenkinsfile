node{

    def app
   

    stage('SCM Checkout')
    {            
        echo 'cloning the application...'    
        checkout scm
        echo 'cloning successed...'
    }
    
    stage('Build image') {
        echo 'BUILDIND successed...'
        app = docker.build("a21250034cris/my-app:3.0")
        
        echo 'BUILD successed...'
    }
    
    stage('Push image  to Docker Hub') {
        docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {            
            def app2 = docker.build("a21250034cris/my-app:3.0", '.').push()
            echo "Trying to Push Docker Build to DockerHub"   
          }    
       }  
}
