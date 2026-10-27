pipeline {
    agent any

    environment {
        STUDENT_NAME     = 'Farukh'
        STUDENT_SURNAME  = 'Makhmutkhodzhaev'
        STUDENT_GROUP    = 'IT-2 2314'
        STUDENT_ID       = '37093'
        DOCKER_IMAGE     = 'makhmutkhodzhaev-farukh-devops'
        DOCKER_CONTAINER = 'makhmutkhodzhaev-farukh-container'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                sh 'echo "Git commit used by Jenkins:" && git log --oneline -1'
                sh 'echo "Student: ${STUDENT_NAME} ${STUDENT_SURNAME}"'
                sh 'echo "Group: ${STUDENT_GROUP}"'
                sh 'echo "Student ID: ${STUDENT_ID}"'
            }
        }

        stage('Build') {
            steps {
                sh 'ls -la'
                sh 'echo "Build stage completed successfully"'
            }
        }

        stage('Test') {
            steps {
                sh '''
                    test -f Makhmutkhodzhaev_Farukh_info.txt
                    echo "Info file check: PASSED"
                    bash scripts/Makhmutkhodzhaev_Farukh_system.sh
                    echo "System script check: PASSED"
                '''
            }
        }

        stage('Docker Build') {
            steps {
                sh "docker build -t ${DOCKER_IMAGE} ."
                sh 'docker images'
            }
        }

        stage('Docker Run') {
            steps {
                sh '''
                    docker rm -f ${DOCKER_CONTAINER} 2>/dev/null || true
                    docker run -d -p 8080:8080 \
                        --name ${DOCKER_CONTAINER} \
                        -e STUDENT_NAME=${STUDENT_NAME} \
                        -e STUDENT_SURNAME=${STUDENT_SURNAME} \
                        -e STUDENT_GROUP="${STUDENT_GROUP}" \
                        -e STUDENT_ID=${STUDENT_ID} \
                        ${DOCKER_IMAGE}
                    sleep 2
                    docker ps
                    docker logs ${DOCKER_CONTAINER}
                '''
            }
        }
    }

    post {
        success {
            sh 'echo "Pipeline finished successfully. Student: ${STUDENT_NAME} ${STUDENT_SURNAME}, Group: ${STUDENT_GROUP}, Student ID: ${STUDENT_ID}"'
        }
        failure {
            echo 'Pipeline failed. Check the stage that is marked as failed.'
        }
    }
}
