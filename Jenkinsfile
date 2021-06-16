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
        sh 'sudo -i'
        sh 'chmod 777 /var/run/docker.sock'
        app = docker.build("a21250034cris/my-app:3.0")
        
        echo 'BUILD successed...'
    }
  
    stage('Push image  to Docker Hub') {
        docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {            
            def app2 = docker.build("a21250034cris/my-app:3.0", '.').push()
            echo "Trying to Push Docker Build to DockerHub"   
          }    
       }  
    
    stage('Run Ansible Playbook') {
         ansiblePlaybook credentialsId: 'ansible-CN', disableHostKeyChecking: true, installation: 'ansible2', inventory: 'hosts.inventory', playbook: 'playbook.yml'
       }  
}
