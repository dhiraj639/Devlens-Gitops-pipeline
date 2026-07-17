def call(String imageName, String tag, String dockerHubUsername) {

    withCredentials([
        usernamePassword(
            credentialsId: 'dockerhub-cred',
            usernameVariable: 'DOCKER_USER',
            passwordVariable: 'DOCKER_PASS'
        )
    ]) {

        sh """
            echo \$DOCKER_PASS | docker login \
            -u \$DOCKER_USER \
            --password-stdin

            docker push ${dockerHubUsername}/${imageName}:${tag}

            docker logout
        """
    }

}