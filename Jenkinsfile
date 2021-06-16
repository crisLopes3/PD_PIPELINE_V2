def app

pipeline {

    agent any
    
    parameters {
        choice(name: 'VERSION', choices: ['3.0',  '2.0'], description: '')
        booleanParam(name: 'executePlaybook', defaultValue: false, description: '')
    }

    stage('SCM Checkout')
    {            
        echo 'cloning the application...'    
        checkout scm
        echo 'cloning successed...'
    }
    
    stage('Build image') {
        echo 'BUILDIND successed...'
        sh 'sudo chmod 777 /var/run/docker.sock'
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
        when {
                expression {
                    params.executePlaybook
                }
            }
         ansiblePlaybook credentialsId: 'ansible-CN', disableHostKeyChecking: true, installation: 'ansible2', inventory: 'hosts.inventory', playbook: 'playbook.yml'
       }  
}
