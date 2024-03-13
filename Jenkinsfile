pipeline {
  agent any
    environment {
        name_container='ubuntu'
        name_imagen='ubuntu'
        tag_imagen='latest'
        puerto_imagen='81'
        name_final = "${name_container}${tag_imagen}${puerto_imagen}"        
    }
    stages {
           stage('stop/rm') {
            steps {
                script{
                    sh ''' 
                         docker stop ${name_final}
                    '''
                    }
                    

                script{
                    sh ''' 
                         docker rm ${name_final}
                    '''
                    }
                    
                }                 
                     
            }
           
         stage('build') {
            steps {
                script{
                    sh ''' 
                    docker build -t ${name_imagen}:${tag_imagen} .
                    '''
                    }
                    
                }                    
                                  
            }
            stage('run') {
            steps {
                script{
                    sh ''' 
                        docker run -dp ${puerto_imagen}:80 --name ${name_final} ${name_imagen}:${tag_imagen}
 
                    '''
                    }
                    
                }                    
                                  
            }
            
          
        }   
    }