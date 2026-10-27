pipeline {
    agent any

    environment {
        STUDENT_NAME     = 'Farukh'
        STUDENT_SURNAME  = 'Makhmutkhodzhaev'
        STUDENT_GROUP    = 'IT-2 2314'
        STUDENT_ID       = '37093'
        IMAGE_NAME       = 'makhmutkhodzhaev-farukh-devops'
        CONTAINER_NAME   = 'makhmutkhodzhaev-farukh-container'
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
                sh "podman build -t ${IMAGE_NAME} ."
                sh 'podman images'
            }
        }

        stage('Docker Run') {
            steps {
                sh '''
                    podman rm -f ${CONTAINER_NAME} 2>/dev/null || true
                    podman run -d -p 8080:8080 \
                        --name ${CONTAINER_NAME} \
                        -e STUDENT_NAME=${STUDENT_NAME} \
                        -e STUDENT_SURNAME=${STUDENT_SURNAME} \
                        -e STUDENT_GROUP="${STUDENT_GROUP}" \
                        -e STUDENT_ID=${STUDENT_ID} \
                        ${IMAGE_NAME}
                    sleep 2
                    podman ps
                    podman logs ${CONTAINER_NAME}
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
