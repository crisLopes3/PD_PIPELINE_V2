def buildApp() {
    echo 'building the application...'
    #git url: 'https://github.com/crisLopes3/PD_PIPELINE_V2.git'
} 

def testApp() {
    echo 'testing the application...'
} 

def deployApp() {
    echo 'deplying the application...'
    echo "deploying version ${params.VERSION}"
} 

return this
